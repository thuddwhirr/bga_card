module command_mod (
    input cpu_clock,
    input reset,
    input ce,
    input rw,
    input [3:0] addr,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output [11:0] text_addr,
    output [15:0] text_data,
    output text_enable
);

parameter CMD_REG = 0;
parameter ARG0_REG = 1;
parameter ARG1_REG = 2;
parameter ARG2_REG = 3;
parameter ARG3_REG = 4;

parameter SCREEN_WIDTH = 80;

reg [7:0] cmd;
reg [7:0] arg0, arg1, arg2, arg3;
reg [11:0] cursor_pos;
reg text_ce;

// Output assignments
assign text_data = {arg0, arg1};
assign text_addr = cursor_pos - 1;
assign text_enable = text_ce;

// Synchronous process
always @(posedge cpu_clock) begin
    if (reset) begin
        // Reset all registers
        cmd <= 0;
        arg0 <= 0;
        arg1 <= 0;
        arg2 <= 0;
        arg3 <= 0;
        cursor_pos <= 0;
        text_ce <= 1'b0;
        data_out <= 8'b0;
    end else if (ce) begin
        text_ce <= 1'b0; // Default value
        if (rw) begin
            // Write operation
            case (addr)
                CMD_REG: begin
                    cmd <= data_in;
                end
                ARG0_REG: begin
                    arg0 <= data_in;
                    cursor_pos <= (cmd == 0) ? cursor_pos + 1 : (arg2 * SCREEN_WIDTH + arg3);
                    text_ce <= 1'b1;
                end
                ARG1_REG: arg1 <= data_in;
                ARG2_REG: arg2 <= data_in;
                ARG3_REG: arg3 <= data_in;
                default: ; // Do nothing for invalid addresses
            endcase
        end else begin
            // Read operation
            case (addr)
                CMD_REG: data_out <= cmd;
                ARG0_REG: data_out <= arg0;
                ARG1_REG: data_out <= arg1;
                ARG2_REG: data_out <= arg2;
                ARG3_REG: data_out <= arg3;
                default: data_out <= 8'b0; // Default value for invalid addresses
            endcase
        end
    end
end

endmodule