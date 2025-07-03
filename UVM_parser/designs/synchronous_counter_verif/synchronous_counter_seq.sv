class synchronous_counter_seq extends uvm_sequence #(synchronous_counter_seq_item);
  `uvm_object_utils(synchronous_counter_seq)

  function new(string name = "synchronous_counter_seq");
    super.new(name);
  endfunction

  task body();
    synchronous_counter_seq_item synchronous_counter_item;
    repeat (10) begin
      synchronous_counter_item = synchronous_counter_seq_item::type_id::create("synchronous_counter_item");
      assert(synchronous_counter_item.randomize());
      start_item(synchronous_counter_item);
      finish_item(synchronous_counter_item);
    end
  endtask

endclass