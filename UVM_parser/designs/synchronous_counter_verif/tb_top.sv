`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;

module tb;

  logic clk;
  synchronous_counter_if vif (clk);

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;

  // DUT instantiation
  synchronous_counter #(
    .SIZE(4)
) dut (
    .clk(clk),
    .rst_n(vif.rst_n),
    .up(vif.up),
    .cnt(vif.cnt)
  );

  // Connect to UVM
  initial begin
    uvm_config_db#(virtual synchronous_counter_if)::set(null, "*", "vif", vif);
    run_test();
  end

endmodule