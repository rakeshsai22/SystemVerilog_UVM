module auto_ex(
    clk,rst
);
// in a task/function in a module, the variables are not static, so they are re-initialized every time the task/function is called
//  in a task/functoin in module which has a variable declared , it will be implicitly static. There will be single copy of that variable for all the instances of the module.
    task display();
        int count;
        count = count+1;
        $display("count = %0d", count)
    endtask


// if we call the above task for multiple times,there will be single copy of count shared among all variables.
// if we want an individual copy per task call, we need to declare the task as automatic.

task automatic display_out();
    int count;
    count = count+1;
    $display("count = %0d", count)
endtask

initial begin
    display();
    display();
    display_out();
    display_out();
end

    reg clk,rst;
    initial begin
        clk = 0;
        rst = 0;
        #10 rst = 1;
        #10 rst = 0;
        #10 $finish;
end
endmodule

// if we want to have a static variable in a task/function, we need to declare the task/function as static.
//  static task display_out();
//     static int count;
//     count = count+1;
//     $display("count = %0d", count)
// endtask
//  static function int get_count();
//     static int count;
//     count = count+1;
//     return count;
// endfunction
//  initial begin
//     display_out();
//     display_out();
//     $display("count = %0d", get_count());
//     $display("count = %0d", get_count());
// end

