 // Stimulus Modeling and Genration
// import uvm_pkg::*;
// `include "uvm_macros.svh"

class apb_seq_item extends uvm_sequence_item;

  `uvm_object_utils(apb_seq_item)
//   	`uvm_field_int(addr,UVM_ALL_ON)
//   	`uvm_field_int(data,UVM_ALL_ON)
//   	`uvm_field_enum(apb_dir, pwrite,UVM_ALL_ON)
//   	`uvm_field_int(penable,UVM_ALL_ON)
//   	`uvm_field_int(pready,UVM_ALL_ON)
//   	`uvm_field_int(pslverr,UVM_ALL_ON)
//   `uvm_object_utils_end
  
  typedef enum bit {READ,WRITE} apb_dir; // APB Direction
  rand bit [31:0] addr; // 32 bit addresss
  rand bit [31:0] data; // 32 bit data for read or write 
  rand bit pwrite;
  rand bit [31:0]pwdata;
  bit [31:0] prdata;
  
  
//   typedef enum {WRITE,READ} apb_dir;
  

  constraint padr{addr[31:0] inside{[0:255]};};
  constraint pdat{data[31:0] inside {[0:255]};};
  
  
  function new (string name = "apb_seq_item");
    super.new(name);
  endfunction
  
  
endclass
  
  
  
