`include "command_mod.v"
`include "render_mod.v"
`include "simple_dual_two_clocks.v"

module top_level_mod (
    input cpu_clock,
    input pixel_clock,
    input reset,
    input ce,
    input rw, // 1 for write, 0 for read
    input [3:0] addr,
    inout [7:0] data_inout, // Changed to inout
    output [5:0] pixel_data, // 6 bits for RGB color output
    output hsync,
    output vsync
);

    // Internal signals
    wire [9:0] char_index;
    wire [15:0] char_data;
    wire [11:0] text_addr;
    wire [15:0] text_data;
    wire text_enable;
    wire [7:0] data_out; // Internal data_out signal from command_mod

    // Drive the inout signal
    assign data_inout = (!rw && ce) ? data_out : 8'bz; // Drive data_out during read, high-Z otherwise

    // Instantiate command_mod
    command_mod cmd_mod (
        .cpu_clock(cpu_clock),
        .reset(reset),
        .ce(ce),
        .rw(rw),
        .addr(addr),
        .data_in(data_inout), // Connect inout signal
        .data_out(data_out),
        .text_addr(text_addr),
        .text_data(text_data),
        .text_enable(text_enable)
    );

    // Instantiate render_mod
    render_mod rend_mod (
        .pixel_clock(pixel_clock),
        .reset(reset),
        .char_data(char_data[7:0]), // Use lower byte of char_data
        .char_index(char_index),
        .hsync(hsync),
        .vsync(vsync),
        .pixel_data(pixel_data)
    );

    // Instantiate shared memory (simple_dual_two_clocks)
    simple_dual_two_clocks shared_memory (
        .clka(cpu_clock),
        .ena(text_enable),
        .wea(1'b1), // Write enable for text module
        .addra(text_addr),
        .dia(text_data), // Lower byte of text_data
        .clkb(pixel_clock),
        .enb(1'b1), // Always enabled for render_mod
        .addrb(char_index),
        .dob(char_data) // Character data for render_mod
    );

endmodule