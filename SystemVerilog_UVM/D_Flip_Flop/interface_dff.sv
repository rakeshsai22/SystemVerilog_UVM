interface dff_intf (input logic clk);
  //   we are using the clk generated in the testbench so we are sending the clk as an input
  
  logic rst;
  logic d;
  logic q;
  
endinterface