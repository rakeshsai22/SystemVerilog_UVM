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
