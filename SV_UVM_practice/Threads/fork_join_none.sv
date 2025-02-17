module tb_none;
    initial begin
        $display("[%0t] Main Thread: Fork join_none start",$time);
        fork
            print(20,"Thread1_0");
            print(30,"Thread1_1");
            print(10,"Thread1_2");
        join_none
        $display("[%0t]Main Thread:Fork join_none has ended",$time);
    end

    task automatic print(int _time, string t_name);
        #(_time) $display("[%0t] %s",$time,t_name);
        endtask
    
endmodule

// Nested fork join_none example
module tb_none;
    initial begin
        $display("[%0t] Main Thread: Fork join_none start",$time);
        fork
            begin
                fork
                    print(20,"Thread1_0");
                    print(30,"Thread1_1");
                join_none
                $display("[%0t] Nested Fork join_none has ended",$time);
            end
            print(10,"Thread1_2");
        join_none
        $display("[%0t]Main Thread:Fork join_none has ended",$time);
    end

    task automatic print(int _time,string t_name);
        #(_time) $display("[%0t] %s",$time,t_name);
    endtask
endmodule

//  OUTPUT:[0] Main Thread: Fork join going to start
// [0] Main Thread: Fork join has finished
// [0] Nested fork has finished
// [10] Thread2
// [20] Thread1_0
// [30] Thread1_1


//  why automatic here?
// without automatic, the same display task with different string tags will produce same display message
//  because the task will have a single copy of the variable t_name in teh simulation memory

module tb;
    initial begin
        $display("[%0t] Main Thread: Fork join_none start",$time);
        fork
            print(20,"Thread1_0");
            print(30,"Thread1_1");
            print(10,"Thread1_2");
        join_none
        $display("[%0t]Main Thread:Fork join_none has ended",$time);

    end

    task print(int _time, string t_name);
        #(_time) $display("[%0t] %s",$time,t_name);
    endtask
    
endmodule
// OUTPUT:
// [0] Main Thread: Fork join going to start
// [0] Main Thread: Fork join has finished
// [10] Thread2
// [20] Thread2
// [30] Thread2