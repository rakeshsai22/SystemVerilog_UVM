class my_test extends uvm_test
    `uvm_component_utils(my_test)

    my_env env;

    function new(string name, uvm_component parent);
        super.new(name,parent);
        
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = my_env::type_id::create("env",this);
    endfunction

    task run_phase(uvm_phase phase);
        reg_vseq vseq = reg_vseq::type_id::create("vseq");
        phase.raise_objection(this);
        vseq.start(null); //env.agent.seqr
        phase.drop_objection(this);

        endtask
        endclass