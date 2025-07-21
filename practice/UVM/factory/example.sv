//  UVM Factory: a large LUT where all the uvm components and objects are registered and created.
//  we use these macros to register our objs and comps in the factory
//  `uvm_component_utils -> to register the components (uvm_driver, uvm_monitor, uvm_agent, uvm_env, uvm_test)
//  `uvm_object_utils -> to register the object (uvm_sequence, uvm_sequence_item, uvm_transaction)

// factory override 
    // substitute of one class with another class without any re-compile

    // Type override 
    // 1. Type override is used to substitute one class with another class
    // 2. all the instances of the original class will be replaced with the new typeoverride class
    // 3. Applicable to both uvm_components and uvm_objects
    // set_type_override_by_type(<"orig_type">, <"override_type">,<replace>)
    // set_type_override_by_name(<"orig_name">, <"override_type">,<replace>)

    // Instance override
    // 1. Instance override is used to substitute one specific instance of a class with another instance of a class
    // 2. Applicable only to uvm_components
    // 3. set_inst_override_by_type(<"orig_type">, <"inst_name">, <"override_type">)
    // 4. set_inst_override_by_name(<"orig_name">, <"inst_name">, <"override_type">)

// example of uvm factory
// 1. create a class
// 2. register the class with uvm factory
// 3. create an instance of the class using uvm factory
// 4. use the instance
// 5. unregister the class with uvm factory

// SV example
class uart_tb;
    uart_generator generator;
    uart_driver driver;

    function new();
        generator = new();
        driver = new();
    endfunction
    task run();
        logic[7:0] data;
        data = 8'hFF;
        generator.write(data);
        driver.read(data);
    endtask

endclass

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

