`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "sync_fifo_if.sv"
`include "sync_fifo_pkg.sv"

module tb;

  logic clk;
  sync_fifo_if vif ();

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk;

  // DUT instantiation
  sync_fifo #(
    .DEPTH(8),
    .DWIDTH(16)
) dut (
    .rstn(vif.rstn),
    .clk(clk),
    .wr_en(vif.wr_en),
    .rd_en(vif.rd_en),
    .din(vif.din),
    .dout(vif.dout),
    .empty(vif.empty),
    .full(vif.full)
  );

  // Connect to UVM
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
    uvm_config_db#(virtual sync_fifo_if)::set(null, "*", "vif", vif);
    run_test();
  end

endmodule