class sync_fifo_seq_item extends uvm_sequence_item;
  rand logic rstn;
  rand logic clk;
  rand logic wr_en;
  rand logic rd_en;
  rand logic [16-1:0] din;

  `uvm_object_utils(sync_fifo_seq_item)

  function new(string name = "sync_fifo_seq_item");
    super.new(name);
  endfunction

endclass