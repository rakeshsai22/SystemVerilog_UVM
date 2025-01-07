// import uvm_pkg::*;
// `include "uvm_macros.svh"
class apb_env extends uvm_env;
  
  apb_agent ag;
//   apb_agent agp;
//   apb_scorebd scbd;
  
  
  `uvm_component_utils(apb_env)

  
  virtual dut_if vif;
  
  function new(string name ,uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ag=apb_agent::type_id::create("ag",this);
    //     agp=apb_agent::type_id::create("agp",this);
       
    
//     uvm_config_db#(uvm_active_passive_enum)::set(this,"agp","is_active",UVM_PASSIVE)
    
//     or we can also use 
    //     set_config_int("agp","is_active",UVM_PASSIVE) // but this might give a warning while using UVM 1.2
    
    if(!uvm_config_db#(virtual dut_if)::get(this,"","vif",vif)) begin
      `uvm_fatal("build_phase","No vif specified for env");
    end
    uvm_config_db#(virtual dut_if)::set(this,"ag","vif",vif);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction
     
endclass
