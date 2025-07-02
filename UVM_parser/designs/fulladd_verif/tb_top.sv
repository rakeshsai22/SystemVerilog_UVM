`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "fulladd_if.sv"
`include "fulladd_pkg.sv"

module tb;

  logic clk;
  fulladd_if vif (clk);

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;

  // DUT instantiation
  fulladd dut (
    .a(vif.a),
    .b(vif.b),
    .c_in(vif.c_in),
    .c_out(vif.c_out),
    .sum(vif.sum)
  );

  // Connect to UVM
  initial begin
    uvm_config_db#(virtual fulladd_if)::set(null, "*", "vif", vif);
    run_test();
  end

endmodule