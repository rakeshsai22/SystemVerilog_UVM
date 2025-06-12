class config_reg extends uvm_reg;

    rand uvm_reg_field mode_fld;
    rand uvm_reg_field enable_fld;

    `uvm_object_utils(config_reg)

    function new(string name="config_reg");
        //8'b reg
        // super.new(name, 8, UVM_NO_COVERAGE);
        super.new(name, 8, UVM_CVR_ALL); 
        
    endfunction //new()

    virtual function void build();

    // configure(parent,size,lsb_pos, access, volatile, reset, has_reset, is_rand)
        mode_fld = uvm_reg_field::type_id::create("mode_fld");
        mode_fld.configure(this,2,0,"RW", 0,1,1,1); //size:2, lsb_pos:0 is_rand :1

        enable_fld = uvm_reg_field::type_id::create("enable_fld");
        enable_fld.configure(this,1,2, "RW", 0,1,1,1); //size:1, lsb_pos:2 is_rand:1
        
    endfunction

    function void reset();
        uvm_status_e status;
        this.write(status, 8'h00, UVM_FRONTDOOR, .parent(null));

    endfunction

    endclass //config_reg extends uvm_reg