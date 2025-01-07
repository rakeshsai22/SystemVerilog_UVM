`timescale 1ns/1ns
`include "uvm_macros.svh"
`include "jtag_pkg.svh"
import uvm_pkg::*;
import jtag_pkg::*;
// `include "jtag_pkg.svh"

// `include "jtag_interface.sv"

module top;


  
  // Instantiate DUT interface
  dut_if jif();
  
  // Instantiate DUT and connect interface signals
  jtag dut (
    .TCK(jif.TCK),
    .TDI(jif.TDI),
    .TMS(jif.TMS),
    .RST_N(jif.RST_N),
    .TDO(jif.TDO)
  );
    
    
  initial begin
    jif.TCK = 1;
  end
  
  always begin
    #5 jif.TCK = ~jif.TCK;
  end
  
  initial begin
    jif.RST_N = 0;
    repeat(1)@(posedge jif.TCK)
      jif.RST_N = 1;
  end
  
  
  initial begin
    $display("Inside TOP:: before confg_db");
    uvm_config_db#(virtual dut_if)::set( null, "uvm_test_top", "vif", jif);
    $display("Run test call");
    run_test("base_test");
  end
  
  initial begin
   $dumpfile("dump.vcd");
   $dumpvars(0,top);
  end
    
    
//    run_test("basic_test");

endmodule
