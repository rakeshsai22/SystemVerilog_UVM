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
    `uvm_component_utils(compA)
    uvm_blocking_put_port#(pkt) put_port; // a blocking TLM put port which can send an object of type pkt
    int m_num_txns; // number of transactions to be sent
    function new(string name = "compA",uvm_component parent = null);
        super.new(name,parent);
    endfunction

    // TLM put_port is a class object shoudl be created with new() method in build phase

    virtual function void build_phase (uvm_phase phase);
        super.build_phase(phase);
        put_port = new("put_port",this);
    endfunction

    // will create a packet,randomize it and send it through th eport
    // put() is a blocking method, so the sender will wait until the receiver has received the transaction
    // send N packets
    virtual task run_phase (uvm_phase phase);
        phase.raise_objection(this);
        repeat (m_num_txns) begin
            pkt p = pkt::type_id::create("p");
            assert(p.randomize());
            `uvm_info("compA","Packet sent to compB",UVM_LOW)
            p.print(uvm_default_line_printer);
            // call TLM put() method of put_port class and pass packet
            put_port.put(p);
        end
        phase.drop_objection(this);
    endtask

endclass

// receiver class implementing put method

class compB extends uvm_component;
    `uvm_comoponent_utils(compB)
    uvm_blocking_put_imp #(pkt,compB) put_imp;

    function new(string name="compB",uvm_component parent = null);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        put_imp = new("put_imp",this);
    endfunction
    // implemetnation of put() method in receiver class
    virtual task put(pkt p);
        `uvm_info("compB","Packet received from compA",UVM_LOW)
        p.print(uvm_default_line_printer);
    endtask

endclass

// connect port
// the connection is being done at a higher level. since both components are instantiated directly in the test class mytest, the connection is done in connect phase of the test class.
// if these two components were instantiated in a higher level component, the connection would be done in the build phase of that component or environment.

class mytest extends uvm_test;
    `uvm_component_utils(mytest)
    compA cA;
    compB cB;

    function new(string name="my_test",uvm_comopnent parent=null);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        cA = compA::type_id::create(compA::get_type_name(),this);
        cB = compB::type_id::create("cB",this);
        cA.m_num_txns = 5;
    endfunction
    // connection between compA and compB is done in connect phase
    // put_port is connected to its implementation put_imp
    virtual function void connect_phase(uvm_phase phase);
        cA.put_port.connect(cA.put_imp);
    endfunction
    
endclass

// testbench
// the testbench is the top level component that instantiates the test class and runs the test
module tb;
    mytest test;
    initial begin
        test = mytest::type_id::create("test");
        uvm_config_db#(uvm_object_wrapper)::set(null,"uvm_test_top",".run_phase","*",$sformatf("%s.m_run_phase",test.get_full_name()));
        run_test();
    end
endmodule