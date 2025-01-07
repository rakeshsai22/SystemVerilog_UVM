// import uvm_pkg::*;
// `include "uvm_macros.svh"

class jtag_env extends uvm_env;

  jtag_agent jagt;
  
  `uvm_component_utils(jtag_env)
  
  virtual dut_if vif;

  function new(string name = "jtag_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Create an instance of jtag_agent
    jagt = jtag_agent::type_id::create("jagt", this);
    
    // Retrieve vif handle from the configuration database
    if (!uvm_config_db#(virtual dut_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("jtag_env", "No vif specified for env");
    end
    uvm_config_db#(virtual dut_if)::set(this,"jagt","vif",vif);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

endclass

