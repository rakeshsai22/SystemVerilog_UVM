class rid_sequence extends uvm_sequence #(rid_seq_item);
    
    typedef bit [7:0] id_t;
    id_t active_ids[$];

    `uvm_object_utils(rid_sequence)

    function new(string name = "rid_sequence");
        super.new(name);
    endfunction

    // called by driver when a response is received

    function void release_rid(id_t rid);
        int idx = active_ids.find_first_index(x->x == rid);
        if(idx != -1) begin
            active_ids.delete(idx);
        end

    endfunction

    virtual task body();
        repeat(50) begin
            rid_seq_item req;
            req = rid_seq_item::type_id::create("req");

            // randomize a non active rid

            do begin
                assert(req.randomize());
            end
            while (active_ids.find(req.rid) != -1) begin
                active_ids.push_back(req.rid);
                `uvm_info("RID_SEQ", $sformatf("Issuing rid : %0d", req.rid), UVM_MEDIUM)

                start_item(req);
                finish_item(req);
            end

        endtask
endclass
