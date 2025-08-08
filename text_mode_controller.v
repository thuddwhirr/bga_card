module text_mode_controller (
    // Clock domains
    input wire clk,           // CPU clock
    input wire video_clk,     // Video clock
    input wire reset_n,
    
    // VGA timing inputs
    input wire active,
    input wire [9:0] column,
    input wire [9:0] row, 
    input wire [6:0] column_pixel,
    input wire [6:0] row_pixel,
    
    // CPU interface
    input wire [7:0] cmd,
    input wire [7:0] arg0,
    input wire [7:0] arg1,
    input wire execute,        // Trigger signal from main module
    
    // Status outputs
    output wire busy,
    output reg error,
    output wire [15:0] cursor_pos,
    output wire [15:0] page_start,
    output wire [15:0] page_end,
    
    // Video output
    output wire [5:0] pixel_data
);

    // Parameters
    parameter BUFFER_SIZE = 16'd2560;
    parameter SCREEN_SIZE = 16'd2400;
    parameter LINE_WIDTH = 16'd80;
    
    // Commands
    parameter CMD_TEXT_WRITE = 8'h0;
    parameter CMD_TEXT_POSITION = 8'h1;
    parameter CMD_CLEAR_SCREEN = 8'h2;

    //---------------------------
    // Cursor & Paging Logic
    //---------------------------
    
    reg [15:0] cursor_pos_reg;
    reg [15:0] page_start_reg;
    wire [15:0] cursor_pos_next;
    wire [15:0] page_end_wire;
    wire [15:0] page_start_next;
    
    assign cursor_pos = cursor_pos_reg;
    assign page_start = page_start_reg;
    assign page_end = page_end_wire;
    
    assign page_end_wire = ((page_start_reg + (SCREEN_SIZE - 16'd1)) < (BUFFER_SIZE - 16'd1)) ? 
                           page_start_reg + (SCREEN_SIZE - 16'd1) : 
                           (page_start_reg + (SCREEN_SIZE - 16'd1) - BUFFER_SIZE);
                           
    assign cursor_pos_next = ((cursor_pos_reg + 1'b1) < BUFFER_SIZE) ? 
                             cursor_pos_reg + 1'b1 : 16'd0;
                             
    assign page_start_next = ((page_start_reg + LINE_WIDTH) < BUFFER_SIZE) ? 
                             page_start_reg + LINE_WIDTH : 16'd0;

    //---------------------------
    // Character Memory
    //---------------------------
    
    // Control side interface (video clock domain)
    reg [15:0] control_char_mem_addr;
    reg [15:0] control_char_mem_input;
    wire [15:0] control_char_mem_output;
    reg control_char_mem_enable;
    reg control_char_mem_we;

    // Video side interface
    wire [11:0] video_char_mem_addr;
    wire [15:0] video_char_mem_output;
    
    // Page start synchronizer for video addressing
    reg [11:0] page_start_sync1, page_start_sync2;
    always @(posedge video_clk) begin
        page_start_sync1 <= page_start_reg[11:0];
        page_start_sync2 <= page_start_sync1;
    end
    
    assign video_char_mem_addr = (page_start_sync2 + (row * 8'd80) + column) % BUFFER_SIZE;

    // Character memory instance (your existing BRAM)
    Gowin_DPB char_mem(
        .reseta(~reset_n),
        .resetb(~reset_n),
        .clka(video_clk),
        .clkb(video_clk),
        .cea(control_char_mem_enable),
        .ceb(1'b1),
        .wrea(1'b1),
        .wreb(1'b0),
        .ada(control_char_mem_addr[11:0]),
        .adb(video_char_mem_addr),
        .dina(control_char_mem_input),
        .dinb(16'd0),
        .douta(control_char_mem_output),
        .doutb(video_char_mem_output),
        .ocea(1'b0),
        .oceb(1'b1)
    );

    //---------------------------
    // Font ROM
    //---------------------------
    
    wire [11:0] font_offset;
    wire [7:0] font_output;
    
    assign font_offset = (video_char_mem_output[15:8] * 8'd16) + row_pixel;
    
    font_rom fonts(
        .clk(video_clk),
        .en(1'b1), 
        .rst(1'b0), 
        .addr(font_offset), 
        .dout(font_output)
    );

    //---------------------------
    // Color Mapping
    //---------------------------
    
    wire [3:0] font_foreground_color = video_char_mem_output[3:0];
    wire [3:0] font_background_color = video_char_mem_output[7:4];
    wire [5:0] foreground_color_out;
    wire [5:0] background_color_out;

    // Use shared color palette module
    color_palette colors (
        .color_index_0(font_foreground_color),
        .color_index_1(font_background_color),
        .color_index_2(4'h0),  // Unused
        .color_index_3(4'h0),  // Unused
        .color_out_0(foreground_color_out),
        .color_out_1(background_color_out),
        .color_out_2(),        // Unused
        .color_out_3()         // Unused
    );

    //---------------------------
    // Pixel Output
    //---------------------------
    
    wire pixel = font_output[7 - column_pixel]; // MSB is leftmost
    assign pixel_data = (active) ? (pixel ? foreground_color_out : background_color_out) : 6'b000000;

    //---------------------------
    // Instruction State Machine
    //---------------------------
    
    // Cross-domain synchronization
    reg char_write_requested, char_write_active, char_write_done;
    reg clear_screen_requested, clear_screen_active, clear_screen_done;
    reg clear_scroll_line_requested, clear_scroll_line_active, clear_scroll_line_done;
    
    reg char_write_requested_sync1, char_write_requested_sync2;
    reg clear_screen_requested_sync1, clear_screen_requested_sync2;
    reg clear_scroll_line_requested_sync1, clear_scroll_line_requested_sync2;
    
    reg [15:0] char_write_addr;
    reg [15:0] char_write_data;
    reg [7:0] default_formatting;
    reg [15:0] clear_scroll_line_start;
    reg [15:0] instruction_counter;

    assign busy = (char_write_active || clear_screen_active || clear_scroll_line_active);

    // Video domain state machine (your existing logic)
    always @(negedge video_clk) begin
        if (!reset_n) begin
            // Reset all video domain registers
            char_write_requested_sync1 <= 1'b0;
            char_write_requested_sync2 <= 1'b0;
            clear_screen_requested_sync1 <= 1'b0;
            clear_screen_requested_sync2 <= 1'b0;
            clear_scroll_line_requested_sync1 <= 1'b0;
            clear_scroll_line_requested_sync2 <= 1'b0;
            
            instruction_counter <= 16'b0;
            control_char_mem_addr <= 16'd0;
            control_char_mem_input <= 16'h2001;
            control_char_mem_enable <= 1'b0;
            control_char_mem_we <= 1'b0;
            
            char_write_active <= 1'b0;
            char_write_done <= 1'b0;
            clear_screen_active <= 1'b0;
            clear_screen_done <= 1'b0;
            clear_scroll_line_active <= 1'b0;
            clear_scroll_line_done <= 1'b0;
        end else begin
            // Synchronize CPU domain signals
            char_write_requested_sync1 <= char_write_requested;
            char_write_requested_sync2 <= char_write_requested_sync1;
            clear_screen_requested_sync1 <= clear_screen_requested;
            clear_screen_requested_sync2 <= clear_screen_requested_sync1;
            clear_scroll_line_requested_sync1 <= clear_scroll_line_requested;
            clear_scroll_line_requested_sync2 <= clear_scroll_line_requested_sync1;

            // Clear done flags when requests are cleared
            if (!char_write_requested_sync2 && char_write_done) 
                char_write_done <= 1'b0;
            if (!clear_screen_requested_sync2 && clear_screen_done) 
                clear_screen_done <= 1'b0;
            if (!clear_scroll_line_requested_sync2 && clear_scroll_line_done) 
                clear_scroll_line_done <= 1'b0;

            // State machine logic (your existing implementation)
            if (char_write_requested_sync2 && !char_write_active && !char_write_done) begin
                char_write_active <= 1'b1;
                char_write_done <= 1'b0;
                control_char_mem_enable <= 1'b1;
                control_char_mem_we <= 1'b1;
                control_char_mem_input <= char_write_data;
                control_char_mem_addr <= char_write_addr;
            end else if (char_write_active) begin
                char_write_active <= 1'b0;
                char_write_done <= 1'b1;
                control_char_mem_enable <= 1'b0;
                control_char_mem_we <= 1'b0;
            end else if (clear_screen_requested_sync2 && !clear_screen_active && !clear_screen_done) begin
                clear_screen_active <= 1'b1;
                clear_screen_done <= 1'b0;
                instruction_counter <= 16'd0;
                control_char_mem_enable <= 1'b1;
                control_char_mem_we <= 1'b1;
            end else if (clear_screen_active && instruction_counter < BUFFER_SIZE) begin
                control_char_mem_input <= {8'd0, default_formatting};
                control_char_mem_addr <= instruction_counter;
                instruction_counter <= instruction_counter + 1'b1;
            end else if (clear_screen_active && instruction_counter >= BUFFER_SIZE) begin
                clear_screen_active <= 1'b0;
                clear_screen_done <= 1'b1;
                control_char_mem_enable <= 1'b0;
                control_char_mem_we <= 1'b0;
            end else if (clear_scroll_line_requested_sync2 && !clear_scroll_line_active && !clear_scroll_line_done) begin
                clear_scroll_line_active <= 1'b1;
                clear_scroll_line_done <= 1'b0;
                instruction_counter <= 16'd0;
            end else if (clear_scroll_line_active && instruction_counter < LINE_WIDTH) begin  
                control_char_mem_enable <= 1'b1;
                control_char_mem_we <= 1'b1;
                control_char_mem_input <= {8'd0, default_formatting};
                control_char_mem_addr <= (clear_scroll_line_start + instruction_counter) % BUFFER_SIZE;
                instruction_counter <= instruction_counter + 1'b1;
            end else if (clear_scroll_line_active && instruction_counter >= LINE_WIDTH) begin
                clear_scroll_line_active <= 1'b0;
                clear_scroll_line_done <= 1'b1;
                control_char_mem_enable <= 1'b0;
                control_char_mem_we <= 1'b0;
            end else begin
                control_char_mem_addr <= 16'd0;
                control_char_mem_enable <= 1'b0;
                control_char_mem_we <= 1'b0;
            end
        end
    end

    // CPU domain command processing
    always @(negedge clk) begin
        if (!reset_n) begin
            error <= 1'b0;
            char_write_requested <= 1'b0;
            char_write_addr <= 16'd0;
            char_write_data <= 16'd0;
            default_formatting <= 8'd1;
            cursor_pos_reg <= 16'd0;
            page_start_reg <= 16'd0;
            clear_screen_requested <= 1'b0;
            clear_scroll_line_requested <= 1'b0;
            clear_scroll_line_start <= 16'd0;
        end else begin
            // Clear requests when done (with synchronization)
            if (char_write_done && char_write_requested) 
                char_write_requested <= 1'b0;
            if (clear_screen_done && clear_screen_requested) 
                clear_screen_requested <= 1'b0;
            if (clear_scroll_line_done && clear_scroll_line_requested) 
                clear_scroll_line_requested <= 1'b0;

            if (execute) begin
                case (cmd)
                    CMD_TEXT_WRITE: begin
                        if (!char_write_active) begin
                            char_write_data <= {arg0, arg1};
                            char_write_addr <= cursor_pos_reg;
                            char_write_requested <= 1'b1;
                            default_formatting <= arg1;
                            cursor_pos_reg <= cursor_pos_next;

                            // Scroll check
                            if (cursor_pos_reg == ((page_end_wire + 1'b1) % BUFFER_SIZE)) begin
                                clear_scroll_line_start <= page_start_reg;
                                clear_scroll_line_requested <= 1'b1;
                                page_start_reg <= page_start_next;
                            end
                        end else begin
                            error <= 1'b1;
                        end
                    end
                    
                    CMD_TEXT_POSITION: begin
                        cursor_pos_reg <= (page_start_reg + (arg0 * 8'd80) + arg1) % BUFFER_SIZE;
                    end
                    
                    CMD_CLEAR_SCREEN: begin
                        if (!clear_screen_active) begin
                            cursor_pos_reg <= 16'd0;
                            page_start_reg <= 16'd0;
                            clear_screen_requested <= 1'b1;
                            default_formatting <= arg0;
                        end else begin
                            error <= 1'b1;
                        end
                    end
                endcase
            end
        end
    end

endmodule