class sync_fifo_sequencer extends uvm_sequencer #(sync_fifo_seq_item);
  `uvm_component_utils(sync_fifo_sequencer)

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

endclass