class dff_env extends uvm_env;
  
  `uvm_component_utils(dff_env)
  
  dff_agent agent;
  dff_scoreboard scbd;
  
  
  function new(string name="dff_env", uvm_component parent);
    super.new(name,parent)
    `uvm_info("ENV class","constructor",UVM_MEDIUM)
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
//     lower components
    agent = dff_agent::type_id::create("agent",this);
    scbd = dff_scoreboard::type_id::create("scbd",this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
//     connection between monitor and scbd using analysis port
    agent.mon.item_collected_port.connect(scb.item_collected_export);
  endfunction
  
  
endclass