class synchronous_counter_seq_item extends uvm_sequence_item;
  rand logic  clk;
  rand logic  rst_n;
  rand logic  up;

  `uvm_object_utils(synchronous_counter_seq_item)

  function new(string name = "synchronous_counter_seq_item");
    super.new(name);
  endfunction

endclass