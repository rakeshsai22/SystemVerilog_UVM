`timescale 1ns/1ps

`include "uvm_macros.svh"
`include "spi_pkg.svh"

import uvm_pkg::*;
import spi_pkg::*;

module top;

  // Clock and reset signals
  logic sclk;
  logic rst_n;
  
  // Instantiate SPI interface
  spi_if spi_interface();
  
  // Connect interface signals
  assign spi_interface.sclk = sclk;
  assign spi_interface.rst_n = rst_n;
  
  // Instantiate DUT
  spi_slave dut (
    .sclk(spi_interface.sclk),
    .mosi(spi_interface.mosi),
    .miso(spi_interface.miso),
    .cs_n(spi_interface.cs_n),
    .rst_n(spi_interface.rst_n)
  );
  
  // Clock generation
  initial begin
    sclk = 1'b0;
    forever #10 sclk = ~sclk;  // 25MHz clock
  end
  
  // Reset generation
  initial begin
    rst_n = 1'b0;
    repeat(2) @(posedge sclk);
    rst_n = 1'b1;
  end
  
  // UVM testbench setup
  initial begin
    `uvm_info("TOP", "Starting SPI testbench", UVM_LOW)
    
    // Set virtual interface in config database
    uvm_config_db#(virtual spi_if)::set(null, "uvm_test_top", "vif", spi_interface);
    
    // Start UVM test
    run_test("spi_base_test");
  end
  
  // Dump waveforms
  initial begin
    $dumpfile("spi_test.vcd");
    $dumpvars(0, top);
  end
  
  // Simulation timeout
  initial begin
    #100000ns;
    `uvm_fatal("TOP", "Simulation timeout!")
  end

endmodule