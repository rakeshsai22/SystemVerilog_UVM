import uvm_pkg::*;
`include "uvm_macros.svh"

class jtag_mon extends uvm_monitor;
  `uvm_component_utils(jtag_mon)

  virtual dut_if vif;

  function new(string name = "jtag_mon", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual dut_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal(get_type_name(), "Did not get handle to vif")
    end
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      // Monitor the JTAG signals (e.g., vif.TCK, vif.TMS, vif.TDI, vif.TDO)
      $display("Monitoring TCK=%b, TMS=%b, TDI=%b, TDO=%b", vif.TCK, vif.TMS, vif.TDI, vif.TDO);

      // Delay to simulate monitoring activity
      #10ns;
    end
  endtask
endclass
