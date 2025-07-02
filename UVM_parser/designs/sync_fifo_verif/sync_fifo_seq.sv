class sync_fifo_seq extends uvm_sequence #(sync_fifo_seq_item);
  `uvm_object_utils(sync_fifo_seq)

  function new(string name = "sync_fifo_seq");
    super.new(name);
  endfunction

  task body();
    sync_fifo_seq_item req;
    repeat (10) begin
      req = sync_fifo_seq_item::type_id::create("req");
      assert(req.randomize());
      start_item(req);
      finish_item(req);
    end
  endtask

endclass