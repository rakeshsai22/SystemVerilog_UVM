class apb_agent extends uvm_agent;

    apb_driver drv;
    apb_monitor mon;
    apb_sequencer sqr;
    `uvm_component_utils(apb_agent)

    function new(string name,uvm_component parent);
        super.new(name,parent);
        
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        drv = apb_driver::type_id::create("drv",this);
        sqr = apb_sequencer::type_id::create("sqr",this);
        mon = apb_monitor::type_id::create("mon",this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        drv.seq_item_port.connect(sqr)
        
    endfunction
    
endclass