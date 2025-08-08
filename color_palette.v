module color_palette (
    // Color index inputs
    input wire [3:0] color_index_0,
    input wire [3:0] color_index_1,
    input wire [3:0] color_index_2,
    input wire [3:0] color_index_3,
    
    // RGB outputs (6-bit total: 2R, 2G, 2B)
    output wire [5:0] color_out_0,
    output wire [5:0] color_out_1,
    output wire [5:0] color_out_2,
    output wire [5:0] color_out_3
);

    // 16-color palette function
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
            4'hA: color_map = 6'b001000;  // Dark blue
            4'hB: color_map = 6'b100000;  // Brown
            4'hC: color_map = 6'b101010;  // Gray
            4'hD: color_map = 6'b110110;  // Light gray
            4'hE: color_map = 6'b111000;  // Orange
            4'hF: color_map = 6'b100010;  // Purple/Violet
            default: color_map = 6'b000000;
        endcase
    endfunction

    // Multiple simultaneous color lookups for different modes
    assign color_out_0 = color_map(color_index_0);
    assign color_out_1 = color_map(color_index_1);
    assign color_out_2 = color_map(color_index_2);
    assign color_out_3 = color_map(color_index_3);

endmodule