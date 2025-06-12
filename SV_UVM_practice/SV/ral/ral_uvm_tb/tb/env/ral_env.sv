class my_env extends uvm_env;

    simple_reg_block reg_blk;
    `uvm_component_utils(my_env)

    function new(string name,uvm_component parent);
        super.new(name,parent);
    endfunction //new()

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        reg_blk = simple_reg_block::type_id::create("reg_blk", this);
        reg_blk.build();
        reg_blk.lock_model();
        reg_blk.set_hdl_path_root("top.dut"); //rtl path for backdoor

    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        //adapter connection
    endfunction

endclass //my_env extends superClass