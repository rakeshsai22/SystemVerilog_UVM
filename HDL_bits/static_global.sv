// we can create a global variable in system verilog using static keyword
// this variable is shared between all instances of the class, but its scope is limited to the class.
// and the objects of the class can access the static variable using the class name.
class example;
    static int a = 0;
    int b = 0;
    function void display();
        a++;
        b++;
        $display("a = %0d, b = %0d", a, b);
    endfunction
    
endclass

class Bustran;
    static int count = 0;
    int id;
    function new;
        id = count++;
        endfunction
endclass

Bustran b1,b2;
initial begin
    b1 =new; //  id = 1, count=1
    b2 =new; //  id = 2, count=2
    $display("Second id =%d, count=%d", b2.id, b2.count);
end

    // bit [31:0] addr,crc, data[8];
    // function void display();
    //     $display("addr = %0h, crc = %0h", addr, crc);
    //     $write("data = ");
    // bit [31:0] addr,crc, data[8];
    // endfunction /void displayw()