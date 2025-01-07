// import uvm_pkg::*;
// `include "uvm_macros.svh" 

class jtag_sqr extends uvm_sequencer #(jtag_seq_item);
    
  `uvm_component_utils(jtag_sqr)
    
  function new(string name = "jtag_sequencer", uvm_component parent = null);
    super.new(name, parent);
  endfunction
    
endclass
