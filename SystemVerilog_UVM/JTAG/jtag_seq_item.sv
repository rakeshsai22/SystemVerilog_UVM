class jtag_seq_item extends uvm_sequence_item;
   rand bit [3:0] state;
   rand bit [3:0] next_state;
   rand bit [3:0] IR;
   rand bit [15:0] DR;
   
   // Constructor
  function new(string name = "jtag_seq_item");
      super.new(name);
   endfunction
   
   // Factory method for creating sequence items
   static function jtag_seq_item get_type();
      return new();
   endfunction
   
   // `uvm_object_utils
  `uvm_object_utils_begin(jtag_seq_item)
      `uvm_field_int(state, UVM_ALL_ON)
      `uvm_field_int(next_state, UVM_ALL_ON)
      `uvm_field_int(IR, UVM_ALL_ON)
      `uvm_field_int(DR, UVM_ALL_ON)
   `uvm_object_utils_end
   
   constraint valid_state_transition {
      foreach (state[i]) {
         next_state[i] == state[i+1];
      }
   }
endclass
