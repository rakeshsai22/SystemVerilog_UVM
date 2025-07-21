// task A: runs for 50us
task sub_run_a();
    while($time < 50us) begin
        #1us;
        $display("sub_run_a(): ping at time %d",$time);
    end
endtask

// task b: this task runs for 5us
task sub_run_b();
    #5us;
    $display("sub_run_b() finished");
    
endtask : sub_run_b

// task c: runs for 10us

task sub_run_c();
    #10us;
    $display("sub_run_c() finished()");
endtask: sub_run_c

task run();

    fork
        sub_run_a();
    join_none

    fork
        sub_run_b();
        sub_run_c();
    join_any


    $display("time before disable fork: %d", $time);

    disable fork;

    #10us;

endtask : run

module top;
    initial begin
        run();
    end
endmodule

// Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Mar 26 03:41 2025
// sub_run_a(): ping at time                    1
// sub_run_a(): ping at time                    2
// sub_run_a(): ping at time                    3
// sub_run_a(): ping at time                    4
// sub_run_b() finished
// time before disable fork:                    5
//            V C S   S i m u l a t i o n   R e p o r t 

// 1.assuming we start at time 0, how much time elapses before we reach "disable fork"
// 5us


// 2.when we execute the "disable fork", which tasks get killed?
// task a
