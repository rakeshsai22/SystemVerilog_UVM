class dff_mon extends uvm_monitor;
  
  `uvm_component_utils(dff_mon)
  virtual dff_intf intf;
//   analysis port
  uvm_analysis_port #(dff_seq_item) item_collected_port;
  dff_seq_item tx;
  
  
  function new(string name="dff_mon",uvm_component parent);
    super.new(name,parent);
    `uvm_info("MONITOR class","constructor", UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_port = new("item_collected_port",this);
    
    if(!uvm_config_db#(virtual dff_intf)::get(this,"","vif",intf))
      `uvm_fatal("no intf in driver","virtual intf get failed from config db");
  endfunction
  
  task run_phase(uvm_phase phase);
    tx=dff_seq_item::type_id::create("tx");
    
  
endclass

    