// import uvm_pkg::*;
// `include "uvm_macros.svh"
class apb_agent extends uvm_agent#(apb_seq_item);
  
  uvm_active_passive_enum is_active = UVM_PASSIVE;
  
//   apb_sequencer seq;
//   apb_driver drv;
  apb_monitor mon_p;
//   bit is_active;
  virtual dut_if vif;
  
  `uvm_component_utils_begin(apb_agent) // here component as we need to store it in the factory, the agent and its objects
//   `uvm_field_enum(uvm_active_passive_enum is_active, UVM_ALL_ON)
//   `uvm_field_object(seq,UVM_ALL_ON)
//   `uvm_field_object(drv,UVM_ALL_ON)
  `uvm_field_object(mon,UVM_ALL_ON)
  `uvm_component_utils_end
  
  
  function new (string name , uvm_component parent);
    super.new(name,parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
//     mon = new("mon",this);
//     mon =apb_monitor::type_id::create("mon",this);
    
    if(get_is_active() == UVM_ACTIVE) begin
      mon_p =apb_monitor::type_id::create("mon_p",this);
//       seq = new("seq",this);
//       seq = apb_sequencer::type_id::create("seq",this);
//       drv = apb_driver::type_id::create("drv",this);
//       drv = new("drv",this);
    end
    
    if (!uvm_config_db #(virtual dut_if)::get(this,"",vif))begin
      `uvm_fatal("build phase","No vif for this agent")
//       uvm_config_db#(virtual dut_if)::set(this,"seq","vif", vif);
//       uvm_config_db#(virtual dut_if)::set(this,"drv","vif",vif);
      uvm_config_db#(virtual dut_if)::set(this,"mon_p","vif",vif);
    end
    
  endfunction
  
  virtual function void connect_phase(uvm_phase phase);
    if(is_active == UVM_ACTIVE)
      drv.seq_item_port.connect(seq.seq_item_export);
  endfunction
  
endclass
  
      
      
