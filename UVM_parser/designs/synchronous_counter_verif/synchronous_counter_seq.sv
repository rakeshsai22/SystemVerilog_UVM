class synchronous_counter_seq extends uvm_sequence #(synchronous_counter_seq_item);
  `uvm_object_utils(synchronous_counter_seq)

  function new(string name = "synchronous_counter_seq");
    super.new(name);
  endfunction

  task body();
    synchronous_counter_seq_item req;
    repeat (10) begin
      req = synchronous_counter_seq_item::type_id::create("req");
      assert(req.randomize());
      start_item(req);
      finish_item(req);
    end
  endtask

endclass