// Question:
// Write a SystemVerilog module that implements a synchronous FIFO with the following requirements:
// Parameters for depth and data width.
// FIFO should support write_en, read_en, data_in, data_out.
// Output a flag for empty and full.
// Use always_ff for sequential logic and always_comb for combinational logic.
// Follow-up:
// How would you write a SystemVerilog assertion to check that the FIFO is never written when full is high?

module sync_fifo #(
    parameter DATAWIDTH,
    parameter DEPTH
) (
    input logic clk,rst_n,
    input logic [DATAWIDTH-1:0] data_in,
    input logic [DATAWIDTH-1:0] data_out,
    input logic write_en,
    input logic read_en,
    output logic full,
    output logic empty
);
    logic [$clog2(DEPTH)-1:0] wptr,rptr;
    logic [DATAWIDTH-1:0] sync_fifo [DEPTH];

    
    always_ff @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            wptr<=0;
            rptr<=0;
            data_out<=0;
        end
        if (write_en && !full) begin
            sync_fifo[wptr] <= data_in;
            wptr <= wptr+1;
        end
        if (read_en && !empty) begin
            data_out <= sync_fifo[rptr];
            rptr<=rptr+1;
        end
        else begin
            empty > full ? $display("FIFO is empty") : $display("FIFO is full");
        end
    end

    assign full = ((wptr+1) == rptr);
    assign empty = (wptr == rptr);

    
endmodule