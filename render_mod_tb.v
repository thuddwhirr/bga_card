`timescale 1ns / 1ps
`include "render_mod.v"
module render_mod_tb;

    // Testbench signals
    reg pixel_clock;
    reg reset;
    reg [7:0] char_data;
    wire [9:0] char_index;
    wire hsync;
    wire vsync;
    wire [5:0] pixel_data;

    // Instantiate the render_mod module
    render_mod uut (
        .pixel_clock(pixel_clock),
        .reset(reset),
        .char_data(char_data),
        .char_index(char_index),
        .hsync(hsync),
        .vsync(vsync),
        .pixel_data(pixel_data)
    );

    // Clock generation
    initial begin
        $dumpfile("render_mod_tb.vcd");
        $dumpvars(0,render_mod_tb);
        pixel_clock = 0;
        forever #10 pixel_clock = ~pixel_clock; // 50 MHz clock (20 ns period)
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        //char_data = 8'h41; // ASCII 'A'
        char_data = 8'd176; // ibm block

        // Apply reset
        #50 reset = 0;
        #50 reset = 1;

        // Simulate character data changes
        #100 char_data = 8'h42; // ASCII 'B'
        #100 char_data = 8'h43; // ASCII 'C'

        // Run simulation for a while
        #1000;

        // End simulation
        $stop;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | hsync: %b | vsync: %b | pixel_data: %b | char_index: %d",
                 $time, hsync, vsync, pixel_data, char_index);
    end

endmodule