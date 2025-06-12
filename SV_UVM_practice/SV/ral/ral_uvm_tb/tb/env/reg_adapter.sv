class my_reg_adapter extends uvm_reg_adapter;

    `uvm_object_utils(my_reg_adapter)

    function new(string name="my_reg_adapter");
        super.new(name);
        supports_byte_enable = 0;
        provides_responses = 1;
    endfunction

    virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
        // convert uvm_reg_bus_op to your bus transaction(like apb_seq_item)
        apb_seq_item item = apb_seq_item::type_id::create("item");
        item.addr = rw.addr;
        item.data = rw.data;
        item.write = (rw.kind == UVM_WRITE);
        return item;
    endfunction
    virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
        apb_seq_item item;
        if(!$cast(item,bus_item)) begin
            `uvmfatal("ADAPT","Wrong bus item type");
        end
        rw.kind = item.write ? UVM_WRITE : UVM_READ;
        rw.addr = item.addr;
        rw.data = item.ata;
        rw.status = UVM_IS_OK;
    endfunction
    
endclass