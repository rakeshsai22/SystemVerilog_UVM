// Semapores are synchronization mechanism used to manage access to a shared resources among multiple processes/threads.
//      they prevent race conditions and when multiple process attempt to access or modify the shared resources.

// Key Concepts:
//  Token-based Mechanism:
//      Semaphores operate like a bucket containing a fixed number of "keys" or "tokens." Processes must acquire a key from the semaphore before accessing a shared resource and return the key after use.
//  Mutual Exclusion and Access Control:
//      Semaphores are primarily used for enforcing mutual exclusion, meaning only a specified number of processes (often one) can access a shared resource at a given time. This prevents data corruption or unexpected behavior.
//  Built-in Class:
//      semaphore is a predefined, built-in class in SystemVerilog, providing methods for managing the keys.


module tb_semaphore;

    semaphore key; // built-in class

    initial begin
        key = new(1);
        fork
            personA();
            personB();
            #25 personA();
        join_none

    end

    task getRoom(bit [1:0] id);

        $display("[%0t] trying to get a room for id[%0d] ..",$time, id);
        key.get(1);
        $display("[%0t] Room Key retrieved for id[%0d]",$time,id);
    endtask

    task putRoom(bit[1:0] id);
        $display("[%0t] Leaving room id[%0d]",$time,id);
        key.put(1);
        $display("[%0t] Room Key put back id[%0d]", $time,id);
    endtask

    task personA();
        getRoom(1);
    #20 putRoom(1);
    endtask

    task personB();
        #5 getRoom (2);
        #10 putRoom (2);
    endtask
endmodule


endmodule