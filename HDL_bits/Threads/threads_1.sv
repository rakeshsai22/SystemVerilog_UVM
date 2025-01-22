// Threads / process are oieces of code that gets executed as a separate entity.
// in verilog, each initial & always block is spawned off as a separate thread that runs in parallel from zero time.
//  A fork / join block also created different threads that run in parallel.  

//  fork-join types:
    // 1. join : finishes only after all the child threads finish
    // 2. join_any : finishes as soon as any of the child threads finishes
    // 3. join_none : finishes soon after child threads are spawned.

//  Threads are used in testbenches to create parallel activities like stimulus generation, checking, etc.

//  In system verilog, threads are created using fork-join blocks.
//  Example

module tb_top;
    initial begin
        #1 display ("[%0t ns] Start fork",time);
        // forkthread 1: print this after 5ns from start of fork
        fork
            #5 $display("[%0t ns] Thread1: execution complete",$time);
            begin
                #2 $display ("[%0t ns] Thread2: execution spawned",$time);
                #4 $display ("[%0t ns] Thread2: execution complete",$time);
            end
            #10 $display("[%0t ns] Thread3: execution complete",$time);
        join
        $display ("[%ot ns] End of fork",$time);
    end
    
endmodule