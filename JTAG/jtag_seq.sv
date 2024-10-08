// import uvm_pkg::*;
// `include "uvm_macros.svh" 

class jtag_seq extends uvm_sequence#(jtag_sequence_item);
  `uvm_object_utils(jtag_seq)
  
  function new(string name = "jtag_seq");
    super.new(name);
  endfunction

  task body();
    jtag_sequence_item tr;
    
    // Generate and send random JTAG sequences to the driver
    repeat(80) begin
      tr = jtag_sequence_item::type_id::create("jtag_seq_item");
      start_item(tr);
      assert(tr.randomize());
      finish_item(tr);
    end
  endtask
endclass

