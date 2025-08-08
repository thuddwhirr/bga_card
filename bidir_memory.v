module video_adapter (
    //cpu command interface 
    input wire clk,           // External clock (φ2 from 6502)
    input wire rw,            // Read/Write signal (0 = write, 1 = read)
    input wire reset_n,       // Active low reset
    input wire ce0,           // Chip enable 0
    input wire ce1b,          // Chip enable 1 (active low)
    input wire [3:0] addr,     // Address of interest 
    inout wire [7:0] data_bus, // 8-bit bidirectional data bus

    //vga
    input video_clk,
    output hsync, 
    output vsync,
    output [5:0] pixel_data
);

    //---------------------------
    // CPU Bus Interface
    //---------------------------
    
    // Internal 8-bit registers
    reg [7:0] internal_reg [7:0]; 
    reg [7:0] result_reg [7:0];
    
    // 6502 control signals (combinatorial decode)
    wire chip_enabled;
    wire read_enable;
    wire write_enable;

    // Chip is enabled when ce0 is high AND ce1b is low
    assign chip_enabled = ce0 & ~ce1b;
    
    // Read/Write enables
    assign read_enable = chip_enabled & rw;
    assign write_enable = chip_enabled & ~rw;

    //lower 3 bits of 4 bit address, used for index of internal_reg or result_reg
    wire [2:0] subaddr = addr[2:0];

    // Drive data bus during reads
    assign data_bus = read_enable ? (addr[3]==0) ? internal_reg[subaddr] : result_reg[subaddr] : 8'hzz;
    
    // CPU register interface (your existing transparent latch behavior)
    always @(*) begin
        if (!reset_n) begin
            internal_reg[0] <= 8'h3F;
            internal_reg[1] <= 8'h00;
            internal_reg[2] <= 8'h00;
            internal_reg[3] <= 8'h00;
            internal_reg[4] <= 8'h00;
            internal_reg[5] <= 8'h00;
            internal_reg[6] <= 8'h00;
            internal_reg[7] <= 8'h03;     
        end else if (write_enable && clk) begin
            internal_reg[subaddr] <= data_bus;
        end
    end

    //---------------------------
    // VGA Timing Generator
    //---------------------------
    
    wire active;
    wire [9:0] h_count, v_count;
    wire [9:0] column, row;
    wire [6:0] column_pixel, row_pixel;

    vga_timing_generator vga_timing (
        .video_clk(video_clk),
        .reset_n(reset_n),
        .hsync(hsync),
        .vsync(vsync),
        .active(active),
        .h_count(h_count),
        .v_count(v_count),
        .column(column),
        .row(row),
        .column_pixel(column_pixel),
        .row_pixel(row_pixel)
    );

    //---------------------------
    // Video Memory Block RAM (Direct Connection)
    //---------------------------

    // Video memory interface signals  
    wire [16:0] video_mem_addr;
    wire [7:0] video_mem_data;
    wire video_mem_enable;

    wire [16:0] cpu_mem_addr;
    wire [7:0] cpu_mem_write_data;
    wire [7:0] cpu_mem_read_data;
    wire cpu_mem_write_enable;
    wire cpu_mem_read_enable;

    // Direct Block RAM instantiation
    Video_Memory_DPB video_memory_bram(
        .reseta(~reset_n),
        .resetb(~reset_n),
        .clka(video_clk),
        .clkb(video_clk),  // Use CPU clock for port B
        .cea(video_mem_enable),
        .ceb(cpu_mem_write_enable || cpu_mem_read_enable),
        .wrea(1'b0),           // Video side is read-only
        .wreb(cpu_mem_write_enable), // CPU side can write
        .ada(video_mem_addr),
        .adb(cpu_mem_addr),
        .dina(8'h00),          // Video side doesn't write
        .dinb(cpu_mem_write_data),
        .douta(video_mem_data),
        .doutb(cpu_mem_read_data),
        .ocea(1'b1),
        .oceb(1'b1)
    );

    //---------------------------
    // Graphics Mode Controller
    //---------------------------

    // Graphics controller interface signals
    wire graphics_busy;
    wire graphics_error;
    wire [7:0] graphics_result_data;
    wire [5:0] graphics_pixel_data;
    wire graphics_execute;

    // Mode configuration (from your registers)
    wire [2:0] current_mode = internal_reg[0][2:0];   // Bits 2:0 of mode register
    wire [1:0] graphics_mode = current_mode[1:0];     // Bits 1:0 for graphics controller
    wire active_page = internal_reg[0][3];           // Bit 3 for display page
    wire working_page = internal_reg[0][4];          // Bit 4 for write page

    // Execute signal for graphics commands
    assign graphics_execute = (write_enable && addr == 4'b0010 && current_mode != MODE_TEXT);

    
    graphics_mode_controller graphics_ctrl (
        // Clock domains
        .cpu_clk(clk),
        .video_clk(video_clk),
        .reset_n(reset_n),
        
        // VGA timing inputs
        .active(active),
        .h_count(h_count),
        .v_count(v_count),
        
        // CPU interface (from your existing registers)
        .cmd(internal_reg[1]),           // Command register
        .arg0(internal_reg[2]),          // Argument 0
        .arg1(internal_reg[3]),          // Argument 1  
        .arg2(internal_reg[4]),          // Argument 2
        .arg3(internal_reg[5]),          // Argument 3
        .arg4(internal_reg[6]),          // Argument 4
        .arg5(internal_reg[7]),          // Argument 5
        .execute(graphics_execute),
        
        // Mode configuration
        .video_mode(graphics_mode),
        .active_page(active_page),
        .working_page(working_page),
        
        // Status outputs
        .busy(graphics_busy),
        .error(graphics_error),
        .result_data(graphics_result_data),
        
        // Video memory interface - DIRECT to block RAM
        .video_addr(video_mem_addr),
        .video_data(video_mem_data),
        .video_enable(video_mem_enable),
        
        .cpu_addr(cpu_mem_addr),
        .cpu_write_data(cpu_mem_write_data),
        .cpu_read_data(cpu_mem_read_data),
        .cpu_write_enable(cpu_mem_write_enable),
        .cpu_read_enable(cpu_mem_read_enable),
        
        // Pixel interface - these can be left unconnected for now
        .pixel_update_enable(),  // Not used in direct mode
        .pixel_addr(),          // Not used in direct mode  
        .pixel_data(),          // Not used in direct mode
        .pixel_busy(1'b0),      // Tie to inactive
        .pixel_done(1'b0),      // Tie to inactive
        
        // Video output
        .pixel_out(graphics_pixel_data)
    );

    //---------------------------
    // Mode Selection Logic
    //---------------------------

    // Mode constants
    parameter MODE_TEXT = 3'b000;
    parameter MODE_640x480x2 = 3'b001;    // + page bit
    parameter MODE_640x480x4 = 3'b010;
    parameter MODE_320x240x16 = 3'b011;   // + page bit  
    parameter MODE_320x240x64 = 3'b100;
    
    //---------------------------
    // Text Mode Controller
    //---------------------------
    
    wire text_busy, text_error;
    wire [15:0] text_cursor_pos, text_page_start, text_page_end;
    wire [5:0] text_pixel_data;
    wire text_execute;
    
    // Execute when writing to command register (addr 2)
    assign text_execute = (write_enable && addr == 4'b0010 && current_mode == MODE_TEXT);
    
    text_mode_controller text_controller (
        .clk(clk),
        .video_clk(video_clk),
        .reset_n(reset_n),
        .active(active),
        .column(column),
        .row(row),
        .column_pixel(column_pixel),
        .row_pixel(row_pixel),
        .cmd(internal_reg[1]),      // Command register
        .arg0(internal_reg[2]),     // Argument 0
        .arg1(internal_reg[3]),     // Argument 1
        .execute(text_execute),
        .busy(text_busy),
        .error(text_error),
        .cursor_pos(text_cursor_pos),
        .page_start(text_page_start),
        .page_end(text_page_end),
        .pixel_data(text_pixel_data)
    );

    //---------------------------
    // Output Multiplexing
    //---------------------------
    
    // Select output based on current mode
    assign pixel_data = (current_mode[2:0] == MODE_TEXT) ? text_pixel_data : graphics_pixel_data;

    //---------------------------
    // Status Register Logic
    //---------------------------

    // Combine busy signals from both controllers
    wire busy = (current_mode[2:0] == MODE_TEXT) ? text_busy : graphics_busy;
    reg error;
    wire error_combined = (current_mode[2:0] == MODE_TEXT) ? text_error : graphics_error;

    // Update your existing result register logic
    always @(negedge clk) begin
        if (!reset_n) begin
            result_reg[0] <= 8'h00;
            result_reg[1] <= 8'h00;
            result_reg[2] <= 8'h00;
            result_reg[3] <= 8'h00;
            result_reg[4] <= 8'h00;
            result_reg[5] <= 8'h00;
            result_reg[6] <= 8'h00;
            result_reg[7] <= 8'h00;
            error <= 1'b0;
        end else if (write_enable) begin
            // Update status based on current mode
            if (current_mode[2:0] == MODE_TEXT) begin
                result_reg[0] <= text_cursor_pos[7:0];
                result_reg[1] <= text_cursor_pos[15:8];
                result_reg[2] <= text_page_start[7:0];
                result_reg[3] <= text_page_start[15:8];
                result_reg[4] <= text_page_end[7:0];
                result_reg[5] <= text_page_end[15:8];
                error <= text_error;
            end else begin
                // Graphics mode status
                result_reg[0] <= 8'h00;                 // Pixel read data
                result_reg[1] <= 8'h00;                 // Reserved
                result_reg[2] <= 8'h00;                 // Reserved
                result_reg[3] <= 8'h00;                 // Reserved
                result_reg[4] <= 8'h00;                 // Reserved
                result_reg[5] <= 8'h00;                 // Reserved
                error <= graphics_error;
            end
        end else begin
            // Debug values - same as above but outside write cycle
            if (current_mode[2:0] == MODE_TEXT) begin
                result_reg[0] <= text_cursor_pos[7:0];
                result_reg[1] <= text_cursor_pos[15:8];
                result_reg[2] <= text_page_start[7:0];
                result_reg[3] <= text_page_start[15:8];
                result_reg[4] <= text_page_end[7:0];
                result_reg[5] <= text_page_end[15:8];
            end else begin
                result_reg[0] <= graphics_result_data;
            end
            
            result_reg[7] <= {6'b0, error_combined, busy};

            // Clear error bit when status is read
            if (addr == 4'd7) error <= 1'b0;
        end
    end

endmodule