// Virtual methods

// a virtual method or task from the base class can be overridden by a method of its child class having the same method name and arguments
// all the corresponding methods in derived classes become virtual

// Base class   Extended Class      Method called (using base class handle)
//  NV              NV                  Extended
//  NV              V                   Extended
//  V               NV                  Base
//  V               V                   Base

// ?? virtual class / abstract class 

class base_trans;
    bit [31:0] data;
    int id;

    function void display();
        $display("[NV] Base: value of data = %0d and id = %0d", data,id);
    endfunction


    // ############### Base Virtual method ############################## 

    virtual function void display_base_virtual();
        $display("[V] Base: value of data = %0d and id = %0d", data,id);
    endfunction
    
    // ############### Base Non-Virtual method ############################## 

    function void display_child_virtual();
        $display("[NV] Base: value of data = %0d and id = %0d", data,id);
    endfunction
    
endclass

class sub_trans extends base_trans;
     bit [31:0] data;
     int id;

     function void display();
        $display("[NV] Child: value of data = %0d and id = %0d", data,id);
     endfunction

     // ############### Child Non-Virtual method ############################## 

     function void display_base_virtual();
        $display("[NV] Child: value of data = %0d and id = %0d", data,id);
    endfunction

    // ############### Child Virtual method ############################## 

    virtual function void display_child_virtual();
        $display("[V] Child: value of data = %0d and id = %0d", data,id);
    endfunction
endclass

module virtual_example;
    initial begin
        base_trans b1;
        sub_trans s1;
        s1 = new();

        b1 = s1; // assigning the child class handle to the base class;
        s1.data = 10;
        s1.id = 2;

        b1.data = 5;
        b1.id = 1;

        b1.display(); // results in base class method (no virtual used)
        b1.display_base_virtual();
        b1.display_child_virtual();
    end

endmodule




