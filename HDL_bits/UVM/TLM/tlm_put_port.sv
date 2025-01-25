// Any component can send a transaction to another component through TLM "put" port. The receiving component should define an implemetnation of the "put" port.
// The port can be either blocking or non-blocking.which will decide whether the put method will block execution in the sending component until the transaction is received by the receiving component.

// TLM port example

class pkt extends uvm_object;
    rand bit[7:0] addr;
    rand bit[7:0] data;

    `uvm_object_utils_begin(pkt)
    `uvm_field_int(addr,UVM_ALL_ON)
    `uvm_field_int(data,UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name="pkt");
        super.new(name);
    endfunction
    
endclass

// Sender class with uvm_blocking_put_port

// compA has a uvm_blocking_put_port parameterized to accept a data object of type pkt.

class compA extends uvm_component;
    uvm_blocking_put_port#(pkt) put_port;
    pkt pkt_obj;

    `uvm_component_utils(compA)

    function new(string name="compA",uvm_component parent=null);
        super.new(name,parent);
    endfunction

    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        pkt_obj = new();
        pkt_obj.randomize();
        `uvm_info(get_type_name(),$sformatf("Sending pkt object with addr=%0h,data=%0h",pkt_obj.addr,pkt_obj.data),UVM_MEDIUM);
        put_port.put(pkt_obj);
        phase.drop_objection(this);
    endtask

endclass