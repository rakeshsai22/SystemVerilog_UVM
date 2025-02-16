// interface for the FIFO module

interface fifo_if;
    // Inputs
    logic clk;
    logic rst_n;
    logic wr_en;
    logic rd_en;
    logic cs;
    logic [31:0] data_in;
    // Outputs
    logic [31:0] data_out;
    logic empty;
    logic full;
endinterface