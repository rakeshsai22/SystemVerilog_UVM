// Question:
// Write a SystemVerilog module that implements a synchronous FIFO with the following requirements:
// Parameters for depth and data width.
// FIFO should support write_en, read_en, data_in, data_out.
// Output a flag for empty and full.
// Use always_ff for sequential logic and always_comb for combinational logic.
// Follow-up:
// How would you write a SystemVerilog assertion to check that the FIFO is never written when full is high?

module sync_fifo;
    localparam DEPTH;
    localparam DATAWIDTH;

    logic write_en, read_en;
    logic [15:0] data_in;
    logic [15:0] data_out;

    output flag;

    
    
endmodule