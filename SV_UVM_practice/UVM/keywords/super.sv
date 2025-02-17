class parent_trans;
    bit [31:0] data;

    function void display();
        $display("Base class data = %0h", data);
    endfunction
    
endclass

class child_trans extends parent_trans;
    bit [31:0] data;

    function void display();
        super.data = 32'hGOOD;
        super.display();
        $display("Derived class data = %0h", data);
    endfunction

    endclass

module class_example;   
    initial begin
        child_trans c_obj;
        c_obj = new();
        c_obj.data = 32'hEDGE;
        c_obj.display();
    end
    
endmodule

// out: Base class data = GOOD
// out: Derived class data = EDGE

// super with argumets
// Super keyword cannot be used in multiple inheritance
class parent;
    bit [31:0] data;

    function new(bit [31:0] data);
        this.data = data;
        $display("Base class data = %0h", data);
        endfunction

endclass

class child extends parent;
    bit [31:0] data;

    function new(bit [31:0] data_p, data_c);
        super.new(data_p) // data_p is passed to parent class, data_c is passed to child class
        this.data = data_c;
        $display("Derived class data = %0h", data);
        endfunction
    endclass

module class_example;
    initial begin
        child c_obj;
        c_obj = new(32'hGOOD, 32'hEDGE);
    end
endmodule

// constructor new without arguments 

class parent;
    bit [31:0] data;
    int id;

    function void display();
        $display("Base class data = %0h, id = %0d", data, id);
    endfunction
endclass

class child extends parent;
    bit [31:0] data;
    function void display();
        $display("Child class data = %0h, id = %0d", data, id);
    endfunction
    
endclass

moduel class_example;
    initial begin
        parent p_obj;
        child c_obj;
        c_obj = new(); // super.new() is automatically called adn parent class handle is created
        c_obj.data = 32'hEDGE;
        c_obj.id = 10;

        p_obj = c_obj; // p_obj is created in the memory and c_obj is copied to p_obj
        p_obj.data = 32'hGOOD;
        p_obj.id = 20;
        p_obj.display(); // we would get parent class data and id not the child class data and id like polymorphism
        c_obj.display(); // we would get child class data and id
    end