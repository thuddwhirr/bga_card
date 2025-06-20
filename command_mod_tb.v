`timescale 1ns/1ns
`include "command_mod.v"

module command_mod_tb;

reg cpu_clock;
reg reset;
reg ce;
reg rw;
reg [3:0]addr;
reg [7:0]data_in;
wire [7:0]data_out;
wire [11:0] text_addr;
wire [15:0] text_data;
wire text_ce;
 

initial begin
    $dumpfile("command_mod_tb.vcd");
    $dumpvars(0,command_mod_tb);
    cpu_clock = 0;
    reset = 0;
    ce = 0;
    rw = 0;
    addr = 0;
    data_in = 0;

    reset = 1;
    #5  
    reset = 0;
    #10  
    ce = 1;
    rw = 1;
    addr = 4'd0;
    data_in = 8'h00;
    #5
    cpu_clock = 1;
    #5  
    cpu_clock = 0;
    #5
    addr = 4'd1;
    data_in = 8'hA0;
    #5
    cpu_clock = 1;
    #5
    cpu_clock = 0;

    #5
    addr = 4'd1;
    data_in = 8'hA1;
    #5
    cpu_clock = 1;
    #5
    cpu_clock = 0;

    addr = 4'd0;
    data_in = 8'h01;
    #5
    cpu_clock = 1;
    #5  
    cpu_clock = 0;
    #5

    addr = 4'd3;
    data_in = 8'd20;
    #5
    cpu_clock = 1;
    #5  
    cpu_clock = 0;
    #5

    addr = 4'd4;
    data_in = 8'd15;
    #5
    cpu_clock = 1;
    #5  
    cpu_clock = 0;
    #5

    #5
    addr = 4'd1;
    data_in = 8'hA2;
    #5
    cpu_clock = 1;
    #5
    cpu_clock = 0;



    #5
    ce = 0;
    rw = 0;
    #5
    cpu_clock = 1;
    #5
    cpu_clock = 0;



end

//always begin
//    #5  clock =  ! clock;
//end

command_mod U0 (
    .cpu_clock (cpu_clock),
    .reset (reset),
    .ce (ce),
    .rw (rw),
    .addr (addr),
    .data_in (data_in),
    .data_out (data_out),
    .text_addr (text_addr),
    .text_data (text_data),
    .text_enable (text_ce)
);
endmodule