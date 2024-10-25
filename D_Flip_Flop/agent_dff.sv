class dff_agent extends uvm_agent;
  
  `uvm_component_utils(dff_agent)
  
  dff_drv drv;
  dff_sequencer sqr;
  dff_mon mon;
  
  function new(string name="dff_agent",uvm_component parent);
    super.new(name,parent)
    `uvm_info("Agent class","constructor",UVM_MEDIUM)
  endfunction
  
//   build_phase
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
//     create lower_components
    drv = dff_drv::type_id::create("drv",this);
    sqr = dff_sequencer::type_id::create("sqr",this);
    mon = dff_mon::type_id::create("mon",this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drv.seq_item_port.connect(seqr.seq_item_export);
  endfunction
  
  
endclass