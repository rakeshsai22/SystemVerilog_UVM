// config_db example

class pkt extends uvm_object;
    rand bit [7:0] mode;
    randc bit [7:0] key;
    int low,high;
    `uvm_object_utils(pkt)
    function new(string name="pkt");
        super.new(name);
    endfunction
    function void pre_randomize();
        low = 1;
        high = 2;
    endfunction
endclass

module tb_top;
    pkt pkt1;
    initial begin
        pkt1 = new();
        repeat(5) begin
            pkt1.randomize();
            $display("mode = %0h, key = %0h", pkt1.mode, pkt1.key);
        end
    end
endmodule

// configuration DB

// * using config_db , objects can share the handle to their data members with other objects. 
// # set() :
//      set() gives others access to the object it has created and controls which conponents have the visibility
//         to the object it has shared.
//      object can be shared globally or made available to one or more specific testbench components
//  # get():
//      with get() componenets check if there is a shared handle matching the used parameters
//          It defines the object type,the name and the hierarchical path to the object searched for

// uvm config_db#(<type>)::set(uvm_component cntxt,             
//                             string         inst_name,        |
//                             string         fieldName,        |
//                             <typevalue>)     value           |
// uvm config_db#(<type>)::get(uvm_component cntxt,             |
//                             string         inst_name,        |
//                             string         fieldName,        |
//                             ref            value)
//      # 
//         * cntxt, inst_name : used to specify the storage location of the object handle
//         * field_name is the name for the object. It does not have to match the object's actual
//              name in the source code. ** But objects using the set() and get() must use exactly
//              the same name, orelse the recieving party (get()) will fail to find the object 
//              from uvm_config_db.
//         * value : is the actual object handle shared through the uvm_config_db
//         * type : is used as a parameter fro the uvm_config_db class to identify the object from the db
