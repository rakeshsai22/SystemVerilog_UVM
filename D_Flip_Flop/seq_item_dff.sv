class dff_seq_item extends uvm_seq_item;
  
  `uvm_object_utils(dff_seq_item)
  
  function new(string name="dff_seq_item");
    super.new(name)
    `uvm_info("Sequence Item class","constructor",UVM_MEDIUM)
  endfunction
  
  
endclass