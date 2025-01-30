// example of uvm factory
// 1. create a class
// 2. register the class with uvm factory
// 3. create an instance of the class using uvm factory
// 4. use the instance
// 5. unregister the class with uvm factory

module example;
    class my_class;
        int a;
        function new(int a);
            this.a = a;
        endfunction
    endclass

    initial begin
        my_class obj1 = new(10);
        $display("obj1.a = %0d", obj1.a);
    end
    initial begin
        my_class obj2 = new(20);
        $display("obj2.a = %0d", obj2.a);
    end

    endmodule

    // type_id create
    // uvm_factory factory = uvm_factory::get();
    // my_class obj1;

