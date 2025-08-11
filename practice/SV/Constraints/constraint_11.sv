// Fill the 1Kx32 memory with below data ( 1024x32)
//        bit 0 = 1,  bit [4:1] = 4‘hE,  bit[12:7] = 6’h2A,  bit[15:13] = 3’h4;
// using constraints

class mem_word_item extends uvm_sequence_item;
  rand bit [31:0] data;
  constraint c {
    data[0]      == 1;
    data[4:1]    == 4'hE;
    data[12:7]   == 6'h2A;
    data[15:13]  == 3'h4;
    // data[6:5], data[31:16] unconstrained -> random for coverage
  }
  `uvm_object_utils(mem_word_item)
  function new(string name="mem_word_item"); super.new(name); endfunction
endclass


