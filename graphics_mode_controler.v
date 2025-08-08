module graphics_mode_controller (
    // Clock domains
    input wire cpu_clk,       // 1 MHz CPU clock
    input wire video_clk,     // 25.175 MHz video clock
    input wire reset_n,
    
    // VGA timing inputs
    input wire active,
    input wire [9:0] h_count,
    input wire [9:0] v_count,
    
    // CPU interface
    input wire [7:0] cmd,
    input wire [7:0] arg0,    // Multi-purpose based on command
    input wire [7:0] arg1,
    input wire [7:0] arg2,
    input wire [7:0] arg3,
    input wire [7:0] arg4,
    input wire [7:0] arg5,
    input wire execute,       // Trigger signal from main module
    
    // Mode configuration
    input wire [1:0] video_mode,
    input wire active_page,   // Which page to display (for modes with 2 pages)
    input wire working_page,  // Which page to write to (for modes with 2 pages)
    
    // Status outputs
    output wire busy,
    output reg error,
    output reg [7:0] result_data,  // For read operations
    
    // Video memory interface
    output reg [16:0] video_addr,
    input wire [7:0] video_data,
    output reg video_enable,
    
    output reg [16:0] cpu_addr,
    output reg [7:0] cpu_write_data,
    input wire [7:0] cpu_read_data,
    output reg cpu_write_enable,
    output reg cpu_read_enable,
    
    output reg pixel_update_enable,
    output reg [16:0] pixel_addr,
    output reg [7:0] pixel_data,
    input wire pixel_busy,
    input wire pixel_done,
    
    // Video output
    output wire [5:0] pixel_out
);

    // Video mode parameters
    parameter MODE_640x480x2  = 2'b00;   // 1 bit per pixel, 8 pixels per byte
    parameter MODE_640x480x4  = 2'b01;   // 2 bits per pixel, 4 pixels per byte  
    parameter MODE_320x240x16 = 2'b10;   // 4 bits per pixel, 2 pixels per byte
    parameter MODE_320x240x64 = 2'b11;   // 8 bits per pixel, 1 pixel per byte

    // Commands
    parameter CMD_WRITE_PIXEL     = 8'h04;
    parameter CMD_PIXEL_POS       = 8'h05;
    parameter CMD_WRITE_PIXEL_POS = 8'h06;
    parameter CMD_CLEAR_SCREEN    = 8'h07;
    parameter CMD_GET_PIXEL_AT    = 8'h08;

    // Memory layout parameters
    parameter PAGE_SIZE_640x480 = 17'd38400;  // 640*480/8 for 1-bit mode
    parameter PAGE_SIZE_320x240 = 17'd38400;  // 320*240/2 for 4-bit mode

    //---------------------------
    // Pixel Cursor Management
    //---------------------------
    
    reg [15:0] pixel_cursor_x;
    reg [15:0] pixel_cursor_y;
    wire [15:0] max_x, max_y;
    
    // Screen dimensions based on current mode
    assign max_x = (video_mode == MODE_640x480x2 || video_mode == MODE_640x480x4) ? 16'd639 : 16'd319;
    assign max_y = (video_mode == MODE_640x480x2 || video_mode == MODE_640x480x4) ? 16'd479 : 16'd239;

    //---------------------------
    // Address Calculation
    //---------------------------
    
    wire [16:0] pixel_linear_addr;
    wire [16:0] pixel_memory_addr;
    wire [16:0] page_offset;
    
    // Calculate linear pixel address
    assign pixel_linear_addr = (pixel_cursor_y * (max_x + 1)) + pixel_cursor_x;
    
    // Calculate page offset for dual-page modes
    assign page_offset = ((video_mode == MODE_640x480x2) && working_page) ? PAGE_SIZE_640x480 :
                        ((video_mode == MODE_320x240x16) && working_page) ? PAGE_SIZE_320x240 : 17'd0;
    
    // Final memory address
    assign pixel_memory_addr = pixel_linear_addr + page_offset;

    //---------------------------
    // Video Display Logic
    //---------------------------
    
    // Calculate current display pixel address
    wire [16:0] display_linear_addr;
    wire [16:0] display_memory_addr;
    wire [16:0] display_page_offset;
    
    // Current pixel coordinates for display
    wire [9:0] display_x = h_count;
    wire [9:0] display_y = v_count;
    
    // Scale coordinates based on mode
    wire [9:0] scaled_x, scaled_y;
    assign scaled_x = (video_mode == MODE_320x240x16 || video_mode == MODE_320x240x64) ? h_count >> 1 : h_count;
    assign scaled_y = (video_mode == MODE_320x240x16 || video_mode == MODE_320x240x64) ? v_count >> 1 : v_count;
    
    assign display_linear_addr = (scaled_y * (max_x + 1)) + scaled_x;
    
    // Page offset for display
    assign display_page_offset = ((video_mode == MODE_640x480x2) && active_page) ? PAGE_SIZE_640x480 :
                                ((video_mode == MODE_320x240x16) && active_page) ? PAGE_SIZE_320x240 : 17'd0;
    
    assign display_memory_addr = display_linear_addr + display_page_offset;
    
    // Video memory read for display
    always @(*) begin
        video_addr = display_memory_addr;
        video_enable = active;
    end
    
    // Extract pixel from byte based on mode and position
    reg [7:0] display_pixel_value;
    reg [3:0] palette_index;

        

    always @(*) begin
        case (video_mode)
            MODE_640x480x2: begin
                // 1 bit per pixel, 8 pixels per byte
                display_pixel_value = video_data >> (7 - (scaled_x[2:0]));
                palette_index = {3'b000, display_pixel_value[0]};
            end
            
            MODE_640x480x4: begin
                // 2 bits per pixel, 4 pixels per byte
                display_pixel_value = video_data >> ((3 - scaled_x[1:0]) << 1);
                palette_index = {2'b00, display_pixel_value[1:0]};
            end
            
            MODE_320x240x16: begin
                // 4 bits per pixel, 2 pixels per byte
                display_pixel_value = video_data >> ((1 - scaled_x[0]) << 2);
                palette_index = display_pixel_value[3:0];
            end
            
            MODE_320x240x64: begin
                // 8 bits per pixel, direct color
                display_pixel_value = video_data;
                palette_index = 4'h0; // Not used in direct color mode
            end
        endcase
    end
    
    // Color output
    wire [5:0] palette_color;
    
    // Use existing color palette for indexed modes
    color_palette display_colors (
        .color_index_0(palette_index),
        .color_index_1(4'h0),
        .color_index_2(4'h0),
        .color_index_3(4'h0),
        .color_out_0(palette_color),
        .color_out_1(),
        .color_out_2(),
        .color_out_3()
    );
    
    // Output pixel data
    assign pixel_out = (video_mode == MODE_320x240x64) ? display_pixel_value[5:0] : palette_color;

    //---------------------------
    // Command State Machine
    //---------------------------
    
    typedef enum reg [3:0] {
        IDLE,
        WRITE_PIXEL_EXEC,
        PIXEL_POS_EXEC,
        WRITE_PIXEL_POS_EXEC,
        CLEAR_SCREEN_INIT,
        CLEAR_SCREEN_EXEC,
        GET_PIXEL_EXEC,
        WAIT_PIXEL_DONE
    } cmd_state_t;
    
    cmd_state_t cmd_state;
    reg [16:0] clear_counter;
    reg [16:0] clear_total;
    
    assign busy = (cmd_state != IDLE);
    
    // Calculate total pixels to clear based on mode
    always @(*) begin
        case (video_mode)
            MODE_640x480x2:  clear_total = 17'd38400;  // 640*480/8 bytes
            MODE_640x480x4:  clear_total = 17'd76800;  // 640*480/4 bytes  
            MODE_320x240x16: clear_total = 17'd38400;  // 320*240/2 bytes
            MODE_320x240x64: clear_total = 17'd76800;  // 320*240 bytes
        endcase
    end
    
    // Command processing state machine
    always @(posedge cpu_clk) begin
        if (!reset_n) begin
            cmd_state <= IDLE;
            error <= 1'b0;
            result_data <= 8'h00;
            pixel_cursor_x <= 16'd0;
            pixel_cursor_y <= 16'd0;
            clear_counter <= 17'd0;
            
            cpu_write_enable <= 1'b0;
            cpu_read_enable <= 1'b0;
            pixel_update_enable <= 1'b0;
            cpu_addr <= 17'd0;
            cpu_write_data <= 8'h00;
            pixel_addr <= 17'd0;
            pixel_data <= 8'h00;
        end else begin
            // Default: clear control signals
            cpu_write_enable <= 1'b0;
            cpu_read_enable <= 1'b0;
            pixel_update_enable <= 1'b0;
            
            case (cmd_state)
                IDLE: begin
                    if (execute) begin
                        case (cmd)
                            CMD_WRITE_PIXEL: begin
                                if (!pixel_busy) begin
                                    pixel_addr <= pixel_memory_addr;
                                    pixel_data <= arg0;
                                    pixel_update_enable <= 1'b1;
                                    cmd_state <= WAIT_PIXEL_DONE;
                                end else begin
                                    error <= 1'b1;
                                end
                            end
                            
                            CMD_PIXEL_POS: begin
                                pixel_cursor_x <= {arg0, arg1};
                                pixel_cursor_y <= {arg2, arg3};
                                cmd_state <= IDLE; // Immediate operation
                            end
                            
                            CMD_WRITE_PIXEL_POS: begin
                                pixel_cursor_x <= {arg0, arg1};
                                pixel_cursor_y <= {arg2, arg3};
                                cmd_state <= WRITE_PIXEL_POS_EXEC;
                            end
                            
                            CMD_CLEAR_SCREEN: begin
                                clear_counter <= 17'd0;
                                cmd_state <= CLEAR_SCREEN_INIT;
                            end
                            
                            CMD_GET_PIXEL_AT: begin
                                pixel_cursor_x <= {arg0, arg1};
                                pixel_cursor_y <= {arg2, arg3};
                                cmd_state <= GET_PIXEL_EXEC;
                            end
                        endcase
                    end
                end
                
                WRITE_PIXEL_POS_EXEC: begin
                    if (!pixel_busy) begin
                        pixel_addr <= pixel_memory_addr;
                        pixel_data <= arg4;
                        pixel_update_enable <= 1'b1;
                        cmd_state <= WAIT_PIXEL_DONE;
                    end else begin
                        error <= 1'b1;
                        cmd_state <= IDLE;
                    end
                end
                
                CLEAR_SCREEN_INIT: begin
                    // Start clearing screen memory
                    cpu_addr <= clear_counter + page_offset;
                    cpu_write_data <= arg0;
                    cpu_write_enable <= 1'b1;
                    cmd_state <= CLEAR_SCREEN_EXEC;
                end
                
                CLEAR_SCREEN_EXEC: begin
                    clear_counter <= clear_counter + 1'b1;
                    if (clear_counter >= clear_total) begin
                        cmd_state <= IDLE;
                    end else begin
                        cpu_addr <= clear_counter + page_offset;
                        cpu_write_data <= arg0;
                        cpu_write_enable <= 1'b1;
                    end
                end
                
                GET_PIXEL_EXEC: begin
                    cpu_addr <= pixel_memory_addr;
                    cpu_read_enable <= 1'b1;
                    result_data <= cpu_read_data;
                    cmd_state <= IDLE;
                end
                
                WAIT_PIXEL_DONE: begin
                    if (pixel_done) begin
                        // Auto-increment cursor for WritePixel
                        if (pixel_cursor_x < max_x) begin
                            pixel_cursor_x <= pixel_cursor_x + 1'b1;
                        end else begin
                            pixel_cursor_x <= 16'd0;
                            if (pixel_cursor_y < max_y) begin
                                pixel_cursor_y <= pixel_cursor_y + 1'b1;
                            end else begin
                                pixel_cursor_y <= 16'd0;
                            end
                        end
                        cmd_state <= IDLE;
                    end
                end
                
                default: begin
                    cmd_state <= IDLE;
                end
            endcase
        end
    end

endmodule