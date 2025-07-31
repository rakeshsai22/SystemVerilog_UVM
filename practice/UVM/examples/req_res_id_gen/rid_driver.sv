class rid_driver extends uvm_driver #(rid_seq_item);

    `uvm_component_utils(rid_driver)

    function new(string name = "rid_driver");
        super.new(name);
    endfunction

    virtual task run_phase(uvm_phase phase);
        
        forever begin
            rid_seq_item req;
            seq_item_port.get_next_item(req);

            `uvm_info("RID-DRIVER", $sformatf("Driving R-ID: %0d", req.rid),UVM_MEDIUM)

            fork
                automatic bit [7:0] rid = req.rid;
                begin
                    #($urandom_range(20,60));
                    `uvm_info("RID-DRIVER", $sformatf("Received response for R-ID: %0d",rid),UVM_MEDIUM)
                    if($cast(rid_sequence m_seq, re.get_sequence())) begin
                        m_seq.release_rid(rid);
                    end
                end
            join_none

            seq_item_port.item_done();
            // seqitem finsih
            
        end

    endtask
endclass