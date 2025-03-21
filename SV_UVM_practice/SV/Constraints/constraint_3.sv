// 4 bit dynamic arr : size of arr- 15 to 20 .
// even numbers in odd locations and odd numbers in even locations

class pattern_1;
    rand bit [3:0] a[];
    int i;
    constraint arr_size {a.size() inside {[15:20]};}
    constraint odd_pos { foreach (a[i]) {
        if (i%2 == 0)
            a[i] %2 == 1
        else
            a[i]%2 == 0
    }}

    function void display();
        $display("size of arr = %0d",a.size());
        foreach(a[i]) begin
            $write("\n arr a : %0d",a[i]);
        end
        endfunction

endclass

module top;
    pattern_1 p1 = new();

    initial begin
        repeat(5) begin
            p1.randomize();
            p1.display();
    end
    end
    endmodule

// output:
// size of arr = 15

//  arr a[0] : 11
//  arr a[1] : 0
//  arr a[2] : 15
//  arr a[3] : 6
//  arr a[4] : 3
//  arr a[5] : 8
//  arr a[6] : 3
//  arr a[7] : 8
//  arr a[8] : 7
//  arr a[9] : 14
//  arr a[10] : 9
//  arr a[11] : 0
//  arr a[12] : 7
//  arr a[13] : 10
//  arr a[14] : 7
// ....

// cosntraint for two  random variables such that one var 
// should not match other and total number of bits toggled in one var should be 5 with respect to the other

class pattern_2;
    rand bit [7:0] a,b;

    constraint match {a != b;}
    constraint ones {$countones(a) == 5;}

endclass

module top;
    pattern_2 p1;

    initial begin
        p1=new();
        repeat(4) begin
            p1.randomize();
            $display("A : %0d \n",p1.a);
            $display("B : %0d \n",p1.b);
        end

    end
    endmodule