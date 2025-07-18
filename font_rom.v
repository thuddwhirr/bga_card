// Block RAM with Resettable Data Output
// File: rams_sp_rf_rst.v

module font_rom (clk, en, rst, addr, dout);
input clk;
input en;
input rst;
input [11:0] addr;
output [7:0] dout;

reg [7:0] ram [4095:0];
reg [7:0] dout;

initial begin 
    $readmemb("font.bin", ram);
end

always @(posedge clk)
begin
    if (en) //optional enable
        begin
            if (rst) //optional reset
                dout <= 0;
            else
                dout <= ram[addr];
        end
end

endmodule