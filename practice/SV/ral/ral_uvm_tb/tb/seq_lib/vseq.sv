class reg_vseq extends uvm_sequence #(uvm_sequence_item);

    `uvm_object_utils(reg_vseq)

    function new(string name = "reg_vseq");
        super.new(name);
    endfunction

    task body();
        reset_seq rseq = reset_seq::type_id::create("rseq");
        rand_config_seq randseq = rand_config_seq::type_id::create("randseq");

        rseq.start(null);
        randseq.start(null);
    endtask

    endclass