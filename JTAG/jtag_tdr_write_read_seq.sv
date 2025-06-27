class jtag_tdr_write_read_seq extends uvm_sequence #(jtag_seq_item);
    
    `uvm_object_utils(jtag_tdr_write_read_seq)
    
    rand bit [3:0] instr;
    rand bit [15:0] data_in;

    function new(string name="jtag_tdr_write_read_seq");
        super.new(name);
    endfunction

    task body();
        jtag_seq_item ir,wr,rd;

        // loadIR
        ir = jtag_seq_item::type_id::create("ir");
        ir.data_type = "INSTRUCTION";
        ir.data = new[4];
        for (int i=0; i<4; i++) begin
            ir.data[i] = instr[i];
        end
        start_item(ir);
        finish_item(ir);

        // write tdr
        wr = jtag_seq_item::type_id::create("wr");
        wr.data_type = "DATA";
        wr.data = new[16];
        for (int i=0; i<16; i++) begin
            wr.data[i] = data_in[i];
        end
        start_item(wr);
        finish_item(wr);

        // ReadTDR
        rd = jtag_seq_item::type_id::create("rd");
        rd.data_type="DATA";
        rd.data = new[16];
        foreach (rd.data[i]) begin
            rd.data[i] = 0;
        end
        start_item(rd);
        finish_item(rd);

        // checking tdo
        bit expected[16];
        for(int i=0;i<16;i++) begin
            expected[i] = data_in[i];
        end
        self_check_tdo(get_type_name(),rd.data_tdo,expected);

    endtask

    task automatic self_check_tdo(string name,bit actual[],bit expected[]);
        int errors =0;
        if(actual.size() !== expected.size()) begin
            `uvm_error(name,$sformatf("Size mismatch: expected = 0x%0d, got = 0x%0d",expected.size(),actual.size()))
            return;
        end

        for (int i=0; i<expected.size(); i++) begin
            if(actual[i]!== expected[i]) begin
                errors++;
                `uvm_error(name,$sformatf("Mismatch at bit %0d : expected = %0b, got = %0b",i,expected[i],actual[i]))

            end
        end
        if(errors == 0) begin
            `uvm_info(name,"Self-checking PASS : tdo matches written DR.",UVM_LOW)
        end

    endtask


endclass