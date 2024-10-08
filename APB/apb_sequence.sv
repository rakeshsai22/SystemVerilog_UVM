import uvm_pkg::*;
`include "uvm_macros.svh"
class apb_sequence extends uvm_sequence#(apb_seq_item);
  
  `uvm_object_utils(apb_sequence)
  
  function new (string name = "apb_sequence");
    super.new(name);
  endfunction
  
//   task body();
//     apb_seq_item tr;
//     repeat(10) begin
// //       creating random transactions and sent to driver
//      //tr = new();
//       tr=apb_seq_item::type_id::create("tr");
//       start_item(tr);
// // //       #100ns;
// //       //uvm_info("apb_sequence","new transaction started");
// //       assert(tr.randomize with {tr.pwrite ==1;
// //                                 tr.addr == 'h10;
// //                                 tr.data == 'h10;
// //                                });
// //       finish_item(tr);
// //      // uvm_info("apb_sequence","transaction finished");
// //     end
// //     #100ns;
// //     begin
// //        start_item(tr);
// // //       #100ns;
// //       //uvm_info("apb_sequence","new transaction started");
// //       assert(tr.randomize with {tr.pwrite ==0;
// //                                 tr.addr == 'h10; 
// //                                });
//       finish_item(tr);
//     end
//   endtask
  
    task body();
    apb_seq_item tr;
    //create 5 random APB read/write transaction and send to driver
      repeat (5) begin
      tr=new();
      start_item(tr);
      assert(tr.randomize());
      finish_item(tr);
    end
  endtask
endclass
