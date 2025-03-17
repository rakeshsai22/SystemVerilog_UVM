// TLM: Transaction Level Modeling ,is a modeling style for building highly abstract models of components and systems.
// TLM is a way to model the communication between components in a system.
// In thi scheme, data is represented as transactions(class objects that contain random ,protocol specific information) which flow in and out oft different components via special ports called TLM interfaces. This adds a high level of abstraction suitable for verificaiton environments.


class simple_pkt extends uvm_object;
    `uvm_object_utils (simple_packet)
    rand bit[7:0] addr;
    rand bit[7:0] data;
    bit rwb;

    contraint c_addr{addr >8'h2a;}; // addr should be >  0x2a
    constraint c_data{data inside {[8'h14:8'he9]}}; // data should be btw 0x14 and 0xe9

    function new(string name="simple_pkt");
        super.new(name);
        endfunction
endclass

// simple_pkt class object will be a transaction that can be sent from twocomponents via TLM interface ports "port" and "export".

// testbench
module tb;
    simple_pkt pkt;
    initial begin
        pkt = simple_pkt::type_id::create("pkt");
        if(pkt.randomize())
            $display("Randomization successful, pkt = %0h",pkt);
        else
            $display("Randomization failed, pkt = %0h",pkt);
    end
endmodule