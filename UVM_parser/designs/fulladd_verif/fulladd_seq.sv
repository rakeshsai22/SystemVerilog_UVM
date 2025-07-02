class fulladd_seq extends uvm_sequence #(fulladd_seq_item);
  `uvm_object_utils(fulladd_seq)

  function new(string name = "fulladd_seq");
    super.new(name);
  endfunction

  task body();
    fulladd_seq_item fulladd_item;
    repeat (10) begin
      fulladd_item = fulladd_seq_item::type_id::create("fulladd_item");
      assert(fulladd_item.randomize());
      start_item(fulladd_item);
      finish_item(fulladd_item);
    end
  endtask

endclass