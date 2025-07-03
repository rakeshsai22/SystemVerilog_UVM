class fulladd_sequencer extends uvm_sequencer #(fulladd_seq_item);
  `uvm_component_utils(fulladd_sequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

endclass