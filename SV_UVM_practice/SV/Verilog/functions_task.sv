// functions and tasks example

// static functions/tasks
// automatic tasks/funcitons

// static functions
module static_functions;
    function int add(int a, int b);
        return a+b;
    endfunction
    function int sub(int a, int b);
        return a-b;
    endfunction
    function int mul(int a, int b);
        return a*b;
    endfunction
    function int div(int a, int b);
        return a/b;
    endfunction
endmodule

// automatic functions
module automatic_functions;
    function int add(int a, int b);
        return a+b;
    endfunction
    function int sub(int a, int b);
        return a-b;
    endfunction
    function int mul(int a, int b);
        return a*b;
    endfunction
    function int div(int a, int b);
        return a/b;
    endfunction
endmodule

// static tasks
module static_tasks;
    task add(int a, int b);
        $display("a+b = %0d", a+b);
    endtask
    task sub(int a, int b);
        $display("a-b = %0d", a-b);
    endtask
    task mul(int a, int b);
        $display("a*b = %0d", a*b);
    endtask
    task div(int a, int b);
        $display("a/b = %0d", a/b);
    endtask
endmodule

// automatic tasks
module automatic_tasks;
    task add(int a, int b);
        $display("a+b = %0d", a+b);
    endtask
    task sub(int a, int b);
        $display("a-b = %0d", a-b);
    endtask
    task mul(int a, int b);
        $display("a*b = %0d", a*b);
    endtask
    task div(int a, int b);
        $display("a/b = %0d", a/b);
    endtask
endmodule
