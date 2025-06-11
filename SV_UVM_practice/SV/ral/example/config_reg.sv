class config_reg extends uvm_reg;

    rand uvm_reg_field mode_fld;
    rand uvm_reg_field enable_fld;

    `uvm_object_utils(config_reg)

    function new(string name="config_reg");
        //8'b reg
        super.new(name, 8, UVM_NO_COVERAGE); 
        
    endfunction //new()

    virtual function void build();
        mode_fld = uvm_reg_field::type_id::create("mode_fld");
        mode_fld.configure(this,2,0,"RW", 0,1,1,0) //size:2, lsb_pos:0

        enable_fld = uvm_reg_field::type_id::create("enable_fld");
        enable_fld.configure(this,1,2, "RW", 0,1,1,0); //size:1, lsb_pos:2
        
    endfunction

    endclass //config_reg extends uvm_reg