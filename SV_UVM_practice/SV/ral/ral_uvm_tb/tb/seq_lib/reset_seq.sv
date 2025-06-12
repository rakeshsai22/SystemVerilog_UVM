class reset_seq extends uvm_sequence #(uvm_reg);

    `uvm_object_utils(reset_seq)

    function new(string name="reset_seq");
        super.new(name);
    endfunction

    task body();
        simple_reg_block blk;
        uvm_status_e status;
        uvm_reg_data_t data;

        if(!uvm_config_db #(simple_reg_block)::get(null,"", "reg_blk",blk)) begin
            `uvm_fatal("SEQ","reg_blk not found in config db");
        end

        // reset the reg through frontdoor
        blk.cfg_reg.reset();

        // Mirror from dut into ral model
        blk.cfg_reg.mirror(status, UVM_FRONTDOOR);

        // get the mirrored value and check
        data = blk.cfg_reg.get();

        if (data == 8'h00) begin
            `uvm_error("MIRROR",$sformat("expected 0x00, got 0x%0h ",data));
        end
        else begin
            `uvm_info("MIRROR","Reset value matched (0x00)",UVM_LOW);
        end

        // predict()
        // blk.cfg_reg.predict(8'hAB);

    endtask
endclass
