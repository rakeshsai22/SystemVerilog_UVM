// Code your testbench here
// or browse Examples

// UVM package contains a class library of:
// 1. uvm_component: to construct a class based hierarchical structure
// 2. uvm_objects: used as data structures for configuration of tb
// 3. uvm_transactions: used in stimulus generation and analysis

// Testbench : top module with DUT and tb connections to DUT

// Top module
// 	DUT connections
// Initial block: calling run_test() starting the execution of UVM phases.
`timescale 1ns/1ns

`include "uvm_macros.svh"
`include "my_testbench_pkg.svh"

import uvm_pkg::*;
import my_testbench_pkg::*;


module top;
//   import uvm_pkg::*;
  
  logic pclk;
  logic prst;
  logic [31:0] paddr;
  logic pwrite;
  logic [31:0] pwdata;
  logic [31:0] prdata;
  logic psel;
  logic penable;
  
 
  dut_if apb_if();
//    apb_slave dut(.pclk(apb_if.pclk),
//                .prst(apb_if.prst),
//               .paddr(apb_if.paddr),
//               .pwrite(apb_pwrite),
//               .pwdata(apb_if.pwdata),
//               .prdata(apb_if.prdata),
//               .psel(apb_if.psel),
//               .penable(apb_if.penable));
  
  apb_slave dut(.dif(apb_if));
  
  initial begin 
    apb_if.pclk = 1;
  end
  
  always begin
      #5 apb_if.pclk = ~apb_if.pclk; 
  end
  
  initial begin
    apb_if.prst = 0;
    repeat(1) @(posedge apb_if.pclk)
      apb_if.prst = 1;
  end
  
  initial begin
    $display("Inside TOP:: before confg_db");
  end
  
  initial begin
    uvm_config_db#(virtual dut_if)::set( null, "uvm_test_top", "vif", apb_if);
    run_test("apb_base_test");
  end
  
 initial begin 
   $dumpfile("dump.vcd");
   $dumpvars;
 end
 
  
  // assertions ##############################
//   property apb_rd;
//     @(posedge apb_if.pclk)
//     if (apb_if.penable && !apb_if.pwrite && apb_if.psel) begin
//       if(!apb_if.pready) // Wait for pready to be high
//         $display("APB ready is 0");
//     end

//   endproperty

//   apb_rd_check: assert property (apb_rd);
// //   assert property (apb_rd);

//   property apb_wr;
//     @(posedge apb_if.pclk)
//     if(apb_if.penable && apb_if.pwrite && apb_if.psel)
//       ##0 apb_if.paddr;
//   endproperty

//   apb_wr_check: assert property (apb_wr);
      


  
endmodule
