`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "synchronous_counter_if.sv"
`include "synchronous_counter_pkg.sv"

module tb;

  logic clk;
  synchronous_counter_if vif ();

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
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
    uvm_config_db#(virtual synchronous_counter_if)::set(null, "*", "vif", vif);
    run_test();
  end

endmodule