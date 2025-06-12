class rand_config_seq extends uvm_sequence #(uvm_reg);

    `uvm_object_utils(rand_config_seq)

    function new(string name = "rand_config_seq");
        super.new(name);
        endfunction

    task body();
        simple_reg_block blk;
        uvm_status_e status;
        uvm_reg_data_t exp_data, actual_data;

        if(!uvm_config_db #(simple_reg_block)::get(null,"","reg_blk",blk)) begin
            `uvm_fatal("SEQ","reg_blk not found in config db");
        end

        // randomize the register
        if(!blk.cfg_reg.randomize()) begin
            `uvm_fatal("RAND","RAndomization failed");
            return;
        end

        // ge the expected randomized value
        exp_data = blk.cfg_reg.get();

        // wrtite randomized value
        blk.cfg_reg.write(status,exp_data,UVM_FRONTDOOR, .parent(null));

        // mirror back from dut
        blk.cfg_reg.write(status, UVM_FRONTDOOR);
        actual_data = blk.cfg_reg.get();

        if(actual_data!==exp_data) begin
            `uvm_error("COMPARE",$sformatf("MIsmatch: expected 0x%0h, got 0x%0h",exp_data,actual_data));
        end
        else begin
            `uvm_info("COMPARE","Random write and read matches",UVM_LOW);
        end
        

    endtask

endclass