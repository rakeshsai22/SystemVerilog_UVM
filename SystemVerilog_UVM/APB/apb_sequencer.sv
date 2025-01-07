// import uvm_pkg::*;
// `include "uvm_macros.svh"
class apb_sequencer extends uvm_sequencer#(apb_seq_item);
  
  `uvm_component_utils(apb_sequencer)
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction
  
endclass
