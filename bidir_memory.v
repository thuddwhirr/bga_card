/*
    video adapter
    Modes: 
        - 0: text. 80 column x 30 rows. 16 colors. 
        - 1: graphics, low-res, full color: 320x240 res, 64 colors, 1 video page. 
        - 2: graphics, low-res, paged: 320x240 res, 16 colors, 2 video pages. 
        - 3: graphics, hi-res, low color: 640x480 res, 4 colors, 1 video page. 
        - 4: graphics, hi-res, paged, monochrome: 640x480 res, 2 colors, 2 video pages. 


    Commands: 
        - 0: write text to cursor position, increment cursor 1 to the right
        - 1: relocate cursor
        - 2: clear text screen to background and home cursor to 0,0. 
        - 3: write pixel to video cursor, increment 1 to the right
        - 4: set video cursor position. 

*/

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

    //Edge inferface for CPU bus interaction & Control interface setup

    // Internal 8-bit registers
    // Splitting 8/8 now
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

    // Drive data bus during reads (6502 expects data available when RW=1)
    assign data_bus = read_enable ? (addr[3]==0) ? internal_reg[subaddr] : result_reg[subaddr] : 8'hzz;
    
    // Pure combinatorial write - transparent latch behavior
    // Acts like a 74LS373 latch that's transparent during φ2 high
    // Bad practice - but necessary for briding this FPGA's bidirectional ports with the 6502 bus
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
            // Latch data when φ2 is high AND write is enabled
            // Follows data_bus continuously while conditions are true
            internal_reg[subaddr] <= data_bus;
        end
        // Holds last value when φ2 goes low or write_enable goes false
    end



    //---------------------------
    // Text Mode Components
    //---------------------------

    //font rom module setup 
    wire [11:0] font_offset; //target address of a row of font data
    wire [7:0] font_output;  //a row of font data
    font_rom fonts(video_clk, 1'b1, 1'b0, font_offset, font_output); //font rom bram module


    //character memory module setup

    //control side interface
    //used for direct instruction execution
    reg [11:0] control_char_mem_addr; 
    reg [15:0] control_char_mem_input;
    wire [15:0] control_char_mem_output;
    reg control_char_mem_enable;
    reg control_char_mem_rw;

    //video side interface
    //used for bulk reads, and batch instruction execution
    wire [11:0] video_char_mem_addr;
    reg [15:0] video_char_mem_input;
    wire [15:0] video_char_mem_output;
    reg video_char_mem_enable;
    reg video_char_mem_rw; 

    //character memory bram module
    char_memory char_mem(
        .clka(clk),
        .clkb(video_clk),
        .ena(1'b1),
        .enb(1'b1),
        .wea(control_char_mem_rw),
        .web(video_char_mem_rw),
        .addra(control_char_mem_addr),
        .addrb(video_char_mem_addr),
        .dia(control_char_mem_input),
        .dib(video_char_mem_input),
        .doa(control_char_mem_output),
        .dob(video_char_mem_output));



    //16 color palette handler
    wire [3:0] font_foreground_color;   //color indes
    wire [5:0] foreground_color_out;    //6 bit video output data
    wire [3:0] font_background_color;   //color indes
    wire [5:0] background_color_out;    //6 bit video output data

    function [5:0] color_map;
        input [3:0] color_index;
        case(color_index)
            4'h0: color_map = 6'b000000;  // Black
            4'h1: color_map = 6'b111111;  // White
            4'h2: color_map = 6'b001100;  // Bright green
            4'h3: color_map = 6'b000100;  // Dark green
            4'h4: color_map = 6'b110000;  // Red
            4'h5: color_map = 6'b000011;  // Blue
            4'h6: color_map = 6'b111100;  // Yellow
            4'h7: color_map = 6'b110011;  // Magenta
            4'h8: color_map = 6'b001111;  // Cyan
            4'h9: color_map = 6'b100100;  // Dark red
            4'hA: color_map = 6'b001000; // Dark blue
            4'hB: color_map = 6'b100000; // Brown
            4'hC: color_map = 6'b101010; // Gray
            4'hD: color_map = 6'b110110; // Light gray
            4'hE: color_map = 6'b111000; // Orange
            4'hF: color_map = 6'b100010; // Purple/Violet (dark magenta)
            default: color_map = 6'b000000;
        endcase
    endfunction

    assign foreground_color_out = color_map(font_foreground_color);
    assign background_color_out = color_map(font_background_color);

 
    
    reg [11:0] cursor_pos;  //curent position of the cursor
    wire [11:0] cursor_pos_next; //the next position the cursor should be set to
    assign cursor_pos_next = (cursor_pos < 2400)? cursor_pos + 1'b1: 12'd0; 


    //---------------------------
    // Instruction Handler block
    //---------------------------

    parameter MODE = 4'h0;        
    parameter CMD = 4'h1;
    parameter ARG0 = 4'b0010;
    parameter ARG1 = 4'b0011;
    parameter ARG2 = 4'b0100;
    parameter ARG3 = 4'b0101;
    parameter ARG4 = 4'b0110;

    parameter CMD_TEXT_WRITE = 8'h0;       //write text and then advance the cursor to the right
    parameter CMD_TEXT_POSITION = 8'h1;     //set cursor to provided row/col
    parameter CMD_CLEAR_SCREEN = 8'h2; //clear active screen to bg color provided and set cursor_pos to 0,0
    


    //Batch mode state vars
    reg clear_screen_requested;
    reg clear_screen_active;
    reg clear_screen_done;
    reg [7:0] clear_screen_color;

    // Instructions are "executed" when a "trigger" parameter is written. 
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
            control_char_mem_input <= 16'h2001;
            control_char_mem_enable <= 1'b0;
            control_char_mem_rw <= 1'b1;
            cursor_pos <= 11'd0;

            //clear screen state
            clear_screen_requested <= 1'b0;

        end else if (write_enable) begin
            //DO STUFF ON WRITE HERE
            result_reg[0] <= result_reg[0] + 1'b1; //count how many instructions have been run, for debuggin

            //if clear screen was requested and is now finished, set requested = false
            if (clear_screen_done && clear_screen_requested) clear_screen_requested <= 1'b0;
            
            case(addr)
                4'b0010: begin //if we've updated 2 - write this data to memory
                    case (internal_reg[CMD])
                        CMD_TEXT_WRITE: begin
                            control_char_mem_input <= {internal_reg[2],internal_reg[3]};     //set the memory data in to the value in ir2
                            control_char_mem_addr <= cursor_pos;
                            control_char_mem_enable <= 1'b1;  //set the enable bit to trigger the write.
                            cursor_pos <= cursor_pos_next;   //set the target address to the cursor position
                        end
                        CMD_TEXT_POSITION: begin
                            cursor_pos <= (((internal_reg[2]*8'd80) + internal_reg[3]) < 2400) ? ((internal_reg[2]*8'd80) + internal_reg[3]): 12'd0 ;   //set the target address to the cursor position
                        end
                        CMD_CLEAR_SCREEN: begin
                            if (!clear_screen_active) begin 
                                cursor_pos <= 12'd0; //cursor position to home
                                clear_screen_requested <= 1'b1; //set the requested flag
                                clear_screen_color <= internal_reg[2]; //set the background color
                            end
                        end
                    endcase  
                end
                default: begin
                    control_char_mem_enable <= 1'b0;
                end
            endcase
        end else begin
            control_char_mem_enable = 1'b0;
        end
    end


parameter SCREEN_WIDTH = 640;
parameter SCREEN_HEIGHT = 480;
parameter H_SYNC_PULSE = 96;
parameter H_BACK_PORCH = 48;
parameter H_FRONT_PORCH = 16;
parameter V_SYNC_PULSE = 2;
parameter V_BACK_PORCH = 31;
parameter V_FRONT_PORCH = 11;

reg [9:0] h_count, v_count;
wire [9:0] h_count_next, v_count_next;
wire active, pixel;

wire [6:0] column_pixel, row_pixel;
wire [9:0] column, row;

// Active video region
assign active = (h_count < SCREEN_WIDTH && v_count < SCREEN_HEIGHT);

// Calculate text and pixel positions
assign column = (h_count < 640) ? (h_count + internal_reg[7] ) / 8 : 9'd0; // Column of text
assign column_pixel = h_count % 8;// Horizontal offset within character
assign row = v_count / 16 ; // Row of text
assign row_pixel = v_count % 16; // Vertical offset within character

assign video_char_mem_addr = (row * 8'd80) + column; // Index in text buffer

// Horizontal and vertical sync signals
assign hsync = (h_count >= (SCREEN_WIDTH + H_FRONT_PORCH) &&
                h_count < (SCREEN_WIDTH + H_FRONT_PORCH + H_SYNC_PULSE)) ? 1'b0 : 1'b1;

assign vsync = (v_count >= (SCREEN_HEIGHT + V_FRONT_PORCH) &&
                v_count < (SCREEN_HEIGHT + V_FRONT_PORCH + V_SYNC_PULSE)) ? 1'b0 : 1'b1;

// Read pixel data from font 
assign font_offset = (video_char_mem_output[15:8] * 8'd16) + row_pixel;
assign font_background_color = video_char_mem_output[7:4];
assign font_foreground_color = video_char_mem_output[3:0];

assign pixel = font_output[7 - column_pixel]; // MSB is leftmost
assign pixel_data = (active) ? (pixel)? foreground_color_out : background_color_out: 6'b000000;


// Horizontal and vertical counters
always @(posedge video_clk) begin
    if (!reset_n) begin
        h_count <= 0;
        v_count <= 0;
    end else begin
        if (h_count < (SCREEN_WIDTH + H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH - 1))
            h_count <= h_count_next;
        else begin
            h_count <= 0;
            if (v_count < (SCREEN_HEIGHT + V_FRONT_PORCH + V_SYNC_PULSE + V_BACK_PORCH - 1))
                v_count <= v_count_next;
            else
                v_count <= 0;
        end
    end
end

assign h_count_next = h_count + 1'b1;
assign v_count_next = v_count + 1'b1;


//bulk processing block for clear screen
always @(posedge video_clk) begin
    if (!reset_n) begin
        //video write params
        video_char_mem_rw <= 1'b0;

        //clear screen state
        clear_screen_active <= 1'b0;
        clear_screen_done <= 1'b1;
    end else 


    //if we're on the first char/pixel
    if (clear_screen_requested && h_count == 0 && v_count == 0) begin
        //set the initial state
        clear_screen_active <= 1'b1;
        clear_screen_done <= 1'b0;
    end else if (h_count == 640 && v_count == 480 && clear_screen_active) begin
        clear_screen_active <= 1'b0;
        clear_screen_done <= 1'b1;
        video_char_mem_rw <= 1'b0; //put video in write mode
    end else if (clear_screen_active && active) begin
        video_char_mem_rw <= 1'b1; //put video in write mode
        video_char_mem_input <= {8'b0,clear_screen_color};
        //assume the current video_char_mem_addr is the one to clear
    end
end

endmodule