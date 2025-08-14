module video_memory_controller (
    // Clock domains
    input wire video_clk,     // 25.175 MHz video clock
    input wire cpu_clk,       // 1 MHz CPU clock
    input wire reset_n,
    
    // Video side interface (continuous read for display)
    input wire [16:0] video_addr,        // 17-bit address (0-76799)
    output reg [7:0] video_data,
    input wire video_enable,
    
    // CPU side interface (read-modify-write for pixel updates)
    output reg [16:0] cpu_addr,          // 17-bit address (0-76799)
    output reg [7:0] cpu_write_data,     // Full byte to write
    output reg [7:0] cpu_read_data,      // Full byte read
    output reg cpu_write_enable,
    output reg cpu_read_enable,
    
    // Pixel update interface (handles bit manipulation)
    input wire pixel_update_enable,
    input wire [16:0] pixel_addr,        // Pixel address
    input wire [7:0] pixel_data,         // New pixel value
    input wire [1:0] video_mode,         // Current video mode for pixel packing
    output reg pixel_busy,               // High when RMW operation in progress
    output reg pixel_done                // Pulse when RMW operation complete
);

    // Video modes for pixel packing
    parameter MODE_640x480x2  = 2'b00;   // 1 bit per pixel, 8 pixels per byte
    parameter MODE_640x480x4  = 2'b01;   // 2 bits per pixel, 4 pixels per byte  
    parameter MODE_320x240x16 = 2'b10;   // 4 bits per pixel, 2 pixels per byte
    parameter MODE_320x240x64 = 2'b11;   // 8 bits per pixel, 1 pixel per byte

    //---------------------------
    // Use Custom Gowin Block RAM - 76,800 x 8-bit
    //---------------------------
    
    parameter VIDEO_MEM_SIZE = 76800; // Full video memory size
    
    // Address width: 17 bits (2^17 = 131,072 > 76,800)
    wire [16:0] video_addr_full = video_addr;
    wire [16:0] cpu_addr_full = cpu_addr;
    
    // Instantiate your new custom video memory block RAM
    wire [7:0] video_mem_dout_a, video_mem_dout_b;
    
    // Replace "Video_Memory_DPB" with whatever you name your new block RAM
    Video_Memory_DPB video_memory_bram(
        .reseta(~reset_n),
        .resetb(~reset_n),
        .clka(video_clk),
        .clkb(cpu_clk),
        .cea(video_enable),
        .ceb(cpu_write_enable || cpu_read_enable),
        .wrea(1'b0),           // Video side is read-only
        .wreb(cpu_write_enable), // CPU side can write
        .ada(video_addr_full),
        .adb(cpu_addr_full),
        .dina(8'h00),          // Video side doesn't write
        .dinb(cpu_write_data),
        .douta(video_mem_dout_a),
        .doutb(video_mem_dout_b),
        .ocea(1'b1),
        .oceb(1'b1)
    );

    // Connect video output
    always @(posedge video_clk) begin
        if (video_enable && video_addr < VIDEO_MEM_SIZE) begin
            video_data <= video_mem_dout_a;
        end else begin
            video_data <= 8'h00;
        end
    end

    //---------------------------
    // Simplified CPU Interface - Single Always Block
    //---------------------------
    
    // State machine for pixel operations
    typedef enum reg [2:0] {
        IDLE,
        WRITE_PIXEL,
        DONE
    } pixel_state_t;
    
    pixel_state_t pixel_state;

    // Single always block to drive ALL CPU interface signals
    always @(posedge cpu_clk) begin
        if (!reset_n) begin
            // Initialize all outputs
            cpu_addr <= 17'd0;
            cpu_write_data <= 8'h00;
            cpu_read_data <= 8'h00;
            cpu_write_enable <= 1'b0;
            cpu_read_enable <= 1'b0;
            
            // Initialize pixel interface
            pixel_busy <= 1'b0;
            pixel_done <= 1'b0;
            pixel_state <= IDLE;
        end else begin
            // Always connect read data from block RAM
            cpu_read_data <= video_mem_dout_b;
            
            // Default: clear control signals
            cpu_write_enable <= 1'b0;
            cpu_read_enable <= 1'b0;
            pixel_done <= 1'b0;
            
            // Simple pixel write state machine
            case (pixel_state)
                IDLE: begin
                    pixel_busy <= 1'b0;
                    if (pixel_update_enable) begin
                        // Start pixel write operation
                        pixel_busy <= 1'b1;
                        cpu_addr <= pixel_addr;
                        cpu_write_data <= pixel_data;
                        cpu_write_enable <= 1'b1;
                        pixel_state <= WRITE_PIXEL;
                    end
                end
                
                WRITE_PIXEL: begin
                    // Complete the write operation
                    pixel_state <= DONE;
                end
                
                DONE: begin
                    // Signal completion
                    pixel_done <= 1'b1;
                    pixel_busy <= 1'b0;
                    pixel_state <= IDLE;
                end
                
                default: begin
                    pixel_state <= IDLE;
                end
            endcase
        end
    end

endmodule