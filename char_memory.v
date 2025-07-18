module char_memory (clka,clkb,ena,enb,wea,web,addra,addrb,dia,dib,doa,dob);

input clka,clkb,ena,enb,wea,web;
input [11:0] addra,addrb;
input [15:0] dia;
input [15:0] dib;
output [15:0] doa;
output [15:0] dob;

reg [15:0] ram [2559:0];
reg [15:0] doa;
reg [15:0] dob;

initial begin 
    $readmemh("text_formating_init.hex", ram);
end

always @(posedge clka) begin
    if (ena) begin
        if (wea)
            ram[addra] <= dia;
        else
            doa <= ram[addra];
    end
end

always @(posedge clkb)
begin
    if (enb) begin
        if (web)
                ram[addrb] <= dib;
            else
                dob <= ram[addrb];
    end
end

endmodule