class dff_sequence extends uvm_sequence#(dff_seq_item);
  
  `uvm_object_utils(dff_sequence)
  
  dff_seq_item tx;
  
  function new(string name="dff_sequence");
    super.new(name);
    `uvm_info("Sequence class","constructor",UVM_MEDIUM)
  endfunction
  
  task body();
    repeat(3) begin
      
      tx = dff_seq_item::type_id::create("tx");
      
      wait_for_grant();
      tx.randomize();
      send_request(tx);
      wait_for_item_done();
      
    end
  endtask
  
  
  
endclass