interface synchronous_counter_if #(
  parameter SIZE = 4
) ();
  logic clk;
  logic rst_n ;
  logic up ;
  logic [SIZE-1:0] cnt ;
endinterface