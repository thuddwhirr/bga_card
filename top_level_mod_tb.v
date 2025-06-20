`timescale 1ns / 1ps
`include "top_level_mod.v"


module top_level_mod_tb;

    // Testbench signals
    reg cpu_clock;
    reg pixel_clock;
    reg reset;
    reg ce;
    reg rw; // 1 for write, 0 for read
    reg [3:0] addr;
    reg [7:0] data_in;
    wire [5:0] pixel_data;
    wire hsync;
    wire vsync;
    wire [7:0] data_inout;

    // Bidirectional data_inout signal
    reg [7:0] data_in_driver;
    assign data_inout = (rw && ce) ? data_in_driver : 8'bz; // Drive during write, high-Z otherwise

    // Instantiate the top-level module
    top_level_mod uut (
        .cpu_clock(cpu_clock),
        .pixel_clock(pixel_clock),
        .reset(reset),
        .ce(ce),
        .rw(rw),
        .addr(addr),
        .data_inout(data_inout),
        .pixel_data(pixel_data),
        .hsync(hsync),
        .vsync(vsync)
    );

    // Clock generation
    initial begin
        cpu_clock = 0;
        forever #50 cpu_clock = ~cpu_clock; // 10 MHz clock (10 ns period)
    end

    initial begin
        pixel_clock = 0;
        forever #10 pixel_clock = ~pixel_clock; // 50 MHz clock (20 ns period)
    end

    

    // Test sequence
    initial begin
        $dumpfile("top_level_mod_tb.vcd");
        $dumpvars(0,top_level_mod_tb);
        // Initialize inputs
        reset = 1;
        ce = 0;
        rw = 0;
        addr = 0;
        data_in_driver = 0;

        // Apply reset
        #20 reset = 0;
        #20 reset = 1;

        // Write text data to multiple rows
        write_char(0, 8'hB0); // Write 'A' to row 0, column 0
        write_char(1, 8'hB1); // Write 'B' to row 0, column 1
        write_char(80, 8'hB0); // Write 'C' to row 1, column 0
        write_char(81, 8'hB1); // Write 'D' to row 1, column 1




        // Wait for rendering to process
        #1000000;

        // End simulation
        $finish;
    end

    // Task to write a character to a specific position
    task write_char(input [11:0] position, input [7:0] char);
        begin
            ce = 1;
            rw = 1;

            // Write CMD_REG (set command to write character)
            addr = 4'd0; // CMD_REG
            data_in_driver = 8'd0; // Command 0 (write character)
            #10;

            // Write ARG0_REG (character data)
            addr = 4'd1; // ARG0_REG
            data_in_driver = char;
            #10;

            // Write ARG2_REG (row address)
            addr = 4'd3; // ARG2_REG
            data_in_driver = position / 80; // Row
            #10;

            // Write ARG3_REG (column address)
            addr = 4'd4; // ARG3_REG
            data_in_driver = position % 80; // Column
            #10;

            ce = 0;
            #10;
        end
    endtask

    // Monitor outputs
    initial begin
        $monitor("Time: %0t | hsync: %b | vsync: %b | pixel_data: %b",
                 $time, hsync, vsync, pixel_data);
    end

endmodule