// this : is used to refer to the class properties,object/parameters and methods of the current instance of the class.
// Can be used to avoid ambiguity between class properties and method parameters.
// can only be used within non-static methods,constraints and covergroups.

// "this" is a built-in pre-defined object handle that refers to the current instance/object of a class. It is used

class pkt;
    bit [31:0] addr;

    function new (bit [31:0] _addr);
        this.addr = _addr; // addr variable in pkt class should be assigned with local variable addr in new()
    endfunction
    
endclass

module test;
    pkt p1 = new(32'h0000_0001);
    pkt p2 = new(32'h0000_0002);

    initial begin
        $display("p1.addr = %h", p1.addr);
        $display("p2.addr = %h", p2.addr);
    end
endmodule