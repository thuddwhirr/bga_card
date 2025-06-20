module render_mod (
    input pixel_clock,
    input reset,
    input [7:0] char_data,
    output [9:0] char_index,
    output hsync,
    output vsync,
    output [5:0] pixel_data // 6 bits for RGB output
);

parameter SCREEN_WIDTH = 640;
parameter SCREEN_HEIGHT = 480;
parameter H_SYNC_PULSE = 96;
parameter H_BACK_PORCH = 48;
parameter H_FRONT_PORCH = 16;
parameter V_SYNC_PULSE = 2;
parameter V_BACK_PORCH = 31;
parameter V_FRONT_PORCH = 11;

reg [7:0] font_rom[0:(256 * 16) - 1];
reg [9:0] h_count, v_count;
wire [9:0] h_count_next, v_count_next;
wire active, pixel;
wire [6:0] column_pixel, row_pixel;
wire [9:0] column, row;
wire [7:0] font_entry;
wire [15:0] font_offset;

// Load font ROM
initial begin
    $readmemb("font.bin", font_rom);
end


// Horizontal and vertical sync signals
assign hsync = (h_count >= (SCREEN_WIDTH + H_FRONT_PORCH) &&
                h_count < (SCREEN_WIDTH + H_FRONT_PORCH + H_SYNC_PULSE)) ? 1'b0 : 1'b1;

assign vsync = (v_count >= (SCREEN_HEIGHT + V_FRONT_PORCH) &&
                v_count < (SCREEN_HEIGHT + V_FRONT_PORCH + V_SYNC_PULSE)) ? 1'b0 : 1'b1;

// Active video region
assign active = (h_count < SCREEN_WIDTH && v_count < SCREEN_HEIGHT);

// Calculate text and pixel positions
assign column = h_count >> 3; // Column of text
assign column_pixel = h_count % 8; // Horizontal offset within character
assign row = v_count >> 4; // Row of text
assign row_pixel = v_count % 16; // Vertical offset within character
assign char_index = (row * 80) + column; // Index in text buffer

// Read pixel data from font 
assign font_offset = (char_data * 16) + row_pixel;
assign font_entry = font_rom[font_offset]; // Get the character data from font ROM
assign pixel = font_entry[7 - column_pixel]; // MSB is leftmost

// Output pixel data (green for active pixels, black otherwise)
assign pixel_data = (active && pixel) ? 6'b001100 : 6'b000000;

// Horizontal and vertical counters
always @(posedge pixel_clock or negedge reset) begin
    if (!reset) begin
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

assign h_count_next = h_count + 1;
assign v_count_next = v_count + 1;

endmodule