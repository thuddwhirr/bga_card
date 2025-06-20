module text_module(
    cpu_cock,
    reset,
    rw,
    data_in,
    data_out,
    addr,
    video_clock,
    pixel_data,
    hsync,
    vsync
);

input cpu_clock;
input reset;
input rw;
input [7:0]data_in;
output [7:0]data_out;
inout [14:0]addr;
input video_clock;
output [5:0]pixel_data;
output hsync,vsync;

reg [11:0] cursor_pos;
reg [11:0] cursor_pos_next;



reg command_reg
reg [7:0]arg1_reg
reg [7:0]arg2_reg
reg [7:0]arg3_reg
reg [7:0]arg4_reg
reg [7:0]page_reg

reg [9:0]h_count;
reg [9:0]h_count_next; 
reg [9:0]v_count;
reg [9:0]v_count_next;

wire active;
wire [11:0]char_index;

parameter COMMAND_ADDR = 15'b100000011110000;
parameter ARG1_ADDR = 15'b100000011110001;
parameter ARG2_ADDR = 15'b100000011110010;
parameter ARG3_ADDR = 15'b100000011110011;
parameter ARG4_ADDR = 15'b100000011110100;
parameter PAGE_ADDR = 15'b100000011110101;

parameter CMD_SET_CHAR = 8'd0;
parameter CMD_APPEND_CHAR = 8'd1;

simple_dual_two_clocks text_buffer(
    cpu_clock,
    video_clock,
    ena,
    enb,
    wea,
    addra,
    addrb,
    dia,
    dob
);

// configuration stuff (should probably be own module)
always @(posedge cpu_clock or negedge reset) 
begin
    if (!reset) begin
        h_count <=0; 
        v_count <=0;
        cursor_pos <=0;
    end 
    else if (addr == COMMAND_ADDR) 
        command_reg <= data_in;
    else if (addr == ARG1_ADDR)
        arg1_reg <= data_in;
    else if (addr ==ARG2_ADDR)
        arg2_reg <= data_in;
    else if (addr == ARG3_ADDR)
        arg3_reg <= data_in;
    else if (addr == ARG4_ADDR)
        arg4_reg <= data_in;
    else if (addr == PAGE_ADDR)
        arg4_reg <= data_in;      
end

//--- rendering stuff (should probably be own module)
assign hsync = (hcount>=(640+16) && hcount<(640+16+96))?1'b0:1'b1; 
assign vsync = (vcount>=(480+11) && vcount<(480+11+2))?1'b0:1'b1;
assign active = (hcount >=0 && hcount < 640 && vcount >=0 && vcount < 480)?1'b1:1'b0;

//calculate the pixel to display
assign column = h_count/8;                  //get the column of text the current active pixel is in
assign column_pixel = h_count % 8;          //get how many bits into the charecter we are 
assign row = v_count/16;                    //get the row of text the current active pixel is in 
assign row_pixel = v_count % 16;            //get the vertical offset within the charecter 
assign char_index = (row * 80) + column;    //get the index in the text buffer for the current char

//read the pixel at col_px/row_px out of the font rom for the charecter at char_index
assign pixel = font_rom[text_buffer[char_index]][row_pixel][column_pixel]; 

//if active and pixel == 1, then output green, otherwise output black
assign pixel_data = (active & pixel == 1'b1)?9'b000111000:9b'000000000;

always @(posedge pixel_clock or negedge reset)
begin
    if(!reset) 
        h_count <= 0;
        v_count <= 0;
    else begin
        if (h_count < (640+16+96+48)) h_count <= h_count_next;
        else h_count <=0;

        if (v_count < (480+11+2+31)) v_count <= v_count_next;
        else v_count <= 0;
    end
end

always @(*) begin
    h_count_next = h_count + 1'b1;
end

always @(*) begin
    v_count_next = v_count + 1'b1;
end

always @(*) begin
    cursor_pos_next = cursor_pos + 1'b1;
end

endmodule

