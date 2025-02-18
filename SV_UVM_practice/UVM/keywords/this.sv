// this keyword example

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
