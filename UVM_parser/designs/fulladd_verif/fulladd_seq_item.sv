class fulladd_seq_item extends uvm_sequence_item;
  rand logic [3:0] a;
  rand logic [3:0] b;
  rand logic  c_in;

  `uvm_object_utils(fulladd_seq_item)

  function new(string name = "fulladd_seq_item");
    super.new(name);
  endfunction

endclass