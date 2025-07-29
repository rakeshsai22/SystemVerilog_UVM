module req_resp_tb;
    
    typedef int unsigned id_t;
    parameter int MAX_ID = 15;
    parameter int TOTAL_REQS = 50;

    id_t active_ids[$];
    id_t issued_ids[$];
    int total_attempts = 0;

    // checking R-ID is in active list
    function bit is_active(id_t id);
        foreach (active_ids[i])
            if(active_ids[i] == id)
                return 1;
        return 0;

    endfunction
    task automatic issue_random_req();
        id_t rid = $urandom_range(0, MAX_ID);
        if(!is_active(rid)) begin
            active_ids.push_back(rid);
            issued_ids.push_back(rid);
            $display("[%0t] [Issued] request id : %0d", $time, rid);
        end
        else begin
            $display("[%0t] [Skipped] request id : %0d is already active", $time, rid);
        end
        total_attempts++;
    endtask

    task automatic gen_response();
        if(active_ids.size() > 0) begin
            int index = $urandom_range(0, active_ids.size()-1);
            id_t res_id = active_ids[index];
            active_ids.delete(index);
            $display("[%0t] [Received] response id : %0d",$time, res_id);
        end
    endtask

    initial begin

        fork
            // request id generation loop
            begin
                while(total_attempts < TOTAL_REQS) begin
                    issue_random_req();
                    #10;
                end
            end

            // response id generation
            begin
                repeat(TOTAL_REQS) begin
                    #($urandom_range(15, 40)); // reponse delay
                    gen_response();
                end
            end
        join

        $display("[%0t] total requests issued : %0d",$time,issued_ids.size());
        $display("[%0t] pending active request ids : %0d", $time, active_ids.size());

        foreach (active_ids[i])
            $display("[%0t] [Pending] request ids: %0d",$time,active_ids[i]);

        $finish;
    end


endmodule