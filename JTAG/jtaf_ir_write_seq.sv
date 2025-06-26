class jtag_ir_write_seq extends uvm_sequence #(jtag_seq_item);

    `uvm_object_utils(jtag_ir_write_seq)

    function new(string name="jtag_ir_write_seq");
        super.new(name);
    endfunction

    task body();
        jtag_seq_item req;
        // to shift_ir
        // 5 tms cycles - 11000
        bit [4:0] tms_to_shift = 5'b11000;
        foreach (tms_to_shift[i]) begin
            req = jtag_seq_item::type_id::create("req");
            req.tms = tms_to_shift[i];
            req.tdi = 0;
            start_item(req);
            finish_item(req);
        end

        // shift the instr lsb first
        foreach (instr[i]) begin
            req = jtag_ir_write_seq::type_id::create("ir_shift");
            req.tms = (i == 3) ? 1:0; // set tms high for last bit (EXIT_IR)
            req.tdi = instr[i];
            start_item(req);
            finish_item(req);
        end

        // EXIT_IR to UPDATE_IR tms = 1 and then 0
        foreach (bit tms in {1,0}) begin
            req = jtag_ir_write_seq::type_id::create("ir_exit_update");
            req.tms = tms;
            req.tdi = 0;
            start_item(req);
            finish_item(req);
            
        end
        `uvm_info(get_type_name(),$sformatf("IR WRITE: 0x%0h",instr),UVM_MEDIUM)
        
    endtask
endclass