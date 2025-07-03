class sync_fifo_seq extends uvm_sequence #(sync_fifo_seq_item);
  `uvm_object_utils(sync_fifo_seq)

  function new(string name = "sync_fifo_seq");
    super.new(name);
  endfunction

  task body();
    sync_fifo_seq_item sync_fifo_item;
    repeat (10) begin
      sync_fifo_item = sync_fifo_seq_item::type_id::create("sync_fifo_item");
      assert(sync_fifo_item.randomize());
      start_item(sync_fifo_item);
      finish_item(sync_fifo_item);
    end
  endtask

endclass