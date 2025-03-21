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

// output : A: 121 B : 209		 A: 206 B : 86		 A: 171 B : 144		 A: 143 B : 13


// Write a constraint such that when rand bit[3:0] a is randomized,
// the value of “a” should not be same as 5 previous occurrences of the
// value of “a”.

class pattern_3;
    rand bit [3:0] a;
    int queue_a[$:7];

    cosntraint a_1 {!(a inside {queue_a});}

    function void post_randomize();
        queue_a.push_front(a);
        $display("value of a=%0d\n",a);
        if(queue_a.size() == 6)
            queue_a.pop_back();
        $display("previous occurences = %0p",queue_a);
    endfunction
    
endclass

module top;
    pattern_3 p1;

    initial begin
        p1=new();
        repeat(3) begin
            p1.randomize();
    end
    end
    endmodule

// output : 
// Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Mar 21 14:07 2025
// value of a=13
// previous occurences = '{13} 
// value of a=3
// previous occurences = '{3, 13} 
// value of a=8
// previous occurences = '{8, 3, 13} 
// value of a=4
// previous occurences = '{4, 8, 3, 13} 
// value of a=2
// previous occurences = '{2, 4, 8, 3, 13} 
// value of a=6
// previous occurences = '{6, 2, 4, 8, 3} 
// value of a=9
// previous occurences = '{9, 6, 2, 4, 8} 
// value of a=3
// previous occurences = '{3, 9, 6, 2, 4} 



// Notes:
// Queue: follows first in first out principle
// similar to a one dimensional unpacked array that grows and shrinls automatically

// A bounded queue has a specific size and can hold a limited number of entries
// datatype <name_of_queue> [$:N]

// Unbounded queue can have unlimited number of entries
// datatype <name_of_queue> [$]