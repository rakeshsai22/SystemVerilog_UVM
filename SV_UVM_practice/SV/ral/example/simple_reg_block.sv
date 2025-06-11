class simple_reg_block extends uvm_reg_block;

    rand config_reg cfg_reg;

    `uvm_object_utils(simple_config_reg)

    function new (string name="simple_reg_block");
        super.new(name,UVM_NO_COVERAGE); // why no coverage?
    endfunction

    virtual function void build();
        default_map = create_map("default_map",0,1,UVM_LITTLE_ENDIAN); //little endian?
        cfg_reg = config_reg::type_id::create("cfg_reg");
        cfg_reg.build();
        cfg_read.configure(this,null,"cfg_reg");
        cfg.lock_model();
        default_map.add_reg(cfg_reg, 'h0, "RW");
        endfunction
    
endclass