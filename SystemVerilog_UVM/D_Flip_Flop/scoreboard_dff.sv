class dff_scoreboard extends uvm_scoreboard;
  
  `uvm_object_utils(dff_scoreboard)
  uvm_analysis_imp#(dff_seq_item,dff_scoreboard) item_collected_export;
  dff_seq_item tx_q[$];
  
  
  function new(string name="dff_scoreboard",uvm_component parent);
    super.new(name,parent)
    `uvm_info("Scoreboard class","constructor",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_collected_export = new("item_cokkected_export",this);
  endfunction
  
  virtual function void write(dff_seq_item tx);
    
    tx_q.push_back(tx);
  endfunction
  
endclass