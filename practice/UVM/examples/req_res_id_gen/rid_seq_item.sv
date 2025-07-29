class rid_seq_item extends uvm_sequence_item;

    rand bit [7:0] rid;

    `uvm_object_utils(rid_seq_item)

    function new(string name = "rid_seq_item");
        super.new(name);

    endfunction

    function string convert2string();
        return $sformatf("rid_seq_item : rid = %0d",rid);
    endfunction

endclass

