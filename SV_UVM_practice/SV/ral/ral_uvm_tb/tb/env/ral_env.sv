class my_env extends uvm_env;

    simple_reg_block reg_blk;
    apb_agent agent;
    my_reg_adapter adapter;

    `uvm_component_utils(my_env)

    function new(string name,uvm_component parent);
        super.new(name,parent);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // apb agent creation
        agent= apb_agent::type_id::create("agent",this);

        // ral block creation
        reg_blk = simple_reg_block::type_id::create("reg_blk", this);
        reg_blk.build();
        reg_blk.lock_model();
        reg_blk.set_hdl_path_root("top.dut"); //rtl path for backdoor

        // adapter creation
        adapter= my_reg_adapter::type_id::create("adapter");

        // sharing reg blk through configdb for sequences
        uvm_config_db #(simple_reg_block)::set(this,"*","reg_blk",reg_blk);

    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        //adapter connection :: reg model to sequencer
        reg_blk.default_map.set_sequencer(agent.sqr,adapter);
    endfunction

endclass //my_env extends superClass