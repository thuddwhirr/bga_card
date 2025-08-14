module vga_timing_generator (
    input wire video_clk,
    input wire reset_n,
    
    // VGA outputs
    output wire hsync,
    output wire vsync,
    output wire active,
    
    // Position outputs for display logic
    output wire [9:0] h_count,
    output wire [9:0] v_count,
    output wire [9:0] column,      // Text column (0-79)
    output wire [9:0] row,         // Text row (0-29)
    output wire [6:0] column_pixel, // Pixel within character (0-7)
    output wire [6:0] row_pixel     // Pixel within character (0-15)
);

    // VGA 640x480 @ 60Hz timing parameters
    parameter SCREEN_WIDTH = 640;
    parameter SCREEN_HEIGHT = 480;
    parameter H_SYNC_PULSE = 96;
    parameter H_BACK_PORCH = 48;
    parameter H_FRONT_PORCH = 16;
    parameter V_SYNC_PULSE = 2;
    parameter V_BACK_PORCH = 31;
    parameter V_FRONT_PORCH = 11;
    
    // Total timing calculations
    parameter H_TOTAL = SCREEN_WIDTH + H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH;
    parameter V_TOTAL = SCREEN_HEIGHT + V_FRONT_PORCH + V_SYNC_PULSE + V_BACK_PORCH;

    // Counter registers
    reg [9:0] h_count_reg, v_count_reg;
    
    // Counter next values
    wire [9:0] h_count_next = h_count_reg + 1'b1;
    wire [9:0] v_count_next = v_count_reg + 1'b1;

    // Horizontal and vertical counters
    always @(posedge video_clk) begin
        if (!reset_n) begin
            h_count_reg <= 10'd0;
            v_count_reg <= 10'd0;
        end else begin
            if (h_count_reg < (H_TOTAL - 1)) begin
                h_count_reg <= h_count_next;
            end else begin
                h_count_reg <= 10'd0;
                if (v_count_reg < (V_TOTAL - 1)) begin
                    v_count_reg <= v_count_next;
                end else begin
                    v_count_reg <= 10'd0;
                end
            end
        end
    end

    // Output assignments
    assign h_count = h_count_reg;
    assign v_count = v_count_reg;

    // Active video region
    assign active = (h_count_reg < SCREEN_WIDTH && v_count_reg < SCREEN_HEIGHT);

    // Sync signals (negative polarity)
    assign hsync = (h_count_reg >= (SCREEN_WIDTH + H_FRONT_PORCH) &&
                    h_count_reg < (SCREEN_WIDTH + H_FRONT_PORCH + H_SYNC_PULSE)) ? 1'b0 : 1'b1;

    assign vsync = (v_count_reg >= (SCREEN_HEIGHT + V_FRONT_PORCH) &&
                    v_count_reg < (SCREEN_HEIGHT + V_FRONT_PORCH + V_SYNC_PULSE)) ? 1'b0 : 1'b1;

    // Text mode position calculations (8x16 character cells)
    assign column = (h_count_reg < SCREEN_WIDTH) ? (h_count_reg + 2) / 8 : 10'd0;
    assign row = (v_count_reg < SCREEN_HEIGHT) ? v_count_reg / 16 : 10'd0;
    assign column_pixel = h_count_reg % 8;
    assign row_pixel = v_count_reg % 16;

endmodule