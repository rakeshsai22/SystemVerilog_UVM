class apb_seq_item extends uvm_sequence_item;

    rand bit [7:0] addr;
    rand bit [7:0] data;
    rand bit write;

    `uvm_object_utils(apb_seq_item)

    function new();
        super.new(name);
        
    endfunction

    function string convert2string();
        return $sformatf("addr=0x%0h data=0x%0h write=0x%0h",addr,data,write);
        
    endfunction

    endclass
    