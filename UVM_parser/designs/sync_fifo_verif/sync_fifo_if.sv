interface sync_fifo_if(input logic clk);
  logic rstn ;
  logic wr_en ;
  logic rd_en ;
  logic [DWIDTH-1:0] din ;
  reg [DWIDTH-1:0] dout ;
  logic empty ;
  logic full ;
endinterface