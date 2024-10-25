// Code your testbench here
// or browse Examples
`timescale 1ns/1ns
`include "uvm_macros.svh"
import uvm_pkg::*;

`include "interface_dff.sv"
module top;

  logic clk;
  
  dff dut(
    .clk(intf.clk),
    .rst(intf.rst),
    .d(intf.d),
    .q(intf.q)
  );
  
  dff_intf intf(.clk(clk));
//   setting interfce to uvm config db for a lower level components
  initial begin
    uvm_config_db#(virtual dff_intf)::set(null,"*","vif",intf);
  end
  
//   generating the clk
  
  initial
    clk=0;
    always #10 clk=~clk;
  
  initial begin
    $monitor($time,"clk = %d",clk);
    #100 $finish;
  end
  
  
  
endmodule