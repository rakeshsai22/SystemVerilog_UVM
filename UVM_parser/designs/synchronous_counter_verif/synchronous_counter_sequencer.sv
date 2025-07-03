class synchronous_counter_sequencer extends uvm_sequencer #(synchronous_counter_seq_item);
  `uvm_component_utils(synchronous_counter_sequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

endclass