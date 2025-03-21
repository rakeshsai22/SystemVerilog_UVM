class pattern;
    rand int a[];
    constrinat size {a.size==10;}
    constraint mirror {foreach(a[i]) if(i%2==0) a[i]==0; else a[i]==(i+1)/2;}

endclass

module top;
    pattern p1;
    initial begin
        p1=new();
        p1.randomize();
        foreach(p1.a[i]) 
            $display("%0d",p1.a[i]);
            $write("%0d",p1.a[i]); 
            $strobe("%0d",p1.a[i]); 
    end
    
endmodule

// Contraint to generate unique numbers between 99 and 100

module pattern2;
    class pattern_2;
        rand int val;
        real out_val;
        constraint val_c {val inside {[990:1000]};}
        function void post_randomize();
            out_val = val/10.0;
            $display("val=%2f",out_val);
        endfunction
    endclass

    initial begin
        pattern_2 p2;
        p2 = new();
        repeat(10) begin
            p2.randomize();
        end
    end
    
endmodule

// Ouptut: 
// val=99.200000 // val=99.200000// val=99.600000// val=99.800000// val=99.200000// val=99.100000// val=100.000000// val=99.200000// val=99.600000// val=99.300000

// pattern 3 : divisible by 5

class pattern_3;
    rand int val;
    constraint val_a {val inside {[5:50]};}
    constraint val_c {val%5 == 0;}
endclass

module top;
    initial begin
        pattern_3 p1;
        p1 =new();
        repeat(4) begin
            p1.randomize();
            $display("val=%0d",p1.val);
        end
    end
    endmodule

// Output: // val=20 // val=45 // val=20 // val=40


// patter 4: derive odd numbers within the range of 1 to 10

class pattern_4;
    randc bit [3:0] val;
    randc unsigned int uval;
    constraint val_a {val inside {[1:10]};
                        val % 2 == 1;}
    constraint val_a {uval inside {[1:10]};
                        uval % 2 == 1;}
endclass

module top;
    pattern_4 p1 =new();
    initial begin
        repeat (5) begin
            p1.randomize()
            if (p1.val % 2 == 1)
                $display("odd numbers %0d",p1.val);
            else 
                $display("even number %0d",p1.val);
        end
    end
    
endmodule

// ############################################################################################################################################################################
// Notes:

// 1. $write() is used to print the values of array without newline character at the end of the string.
// 2. $strobe() is used to print the final values of array at the end of the simulation.
// 3. $display() is used to print the values of array with newline character at the end of the string.

//         foreach(p1.a[i]) 
//             // $display("%0d",p1.a[i]); // display appends newline character to the end of the string
//             // output: 0
//             // 1
//             // 0
//             // 2
//             // 0
//             // 3
//             // 0
//             // 4
//             // 0
//             // 5
//             $write("%0d",p1.a[i]); // write does not append newline character to the end of the string
//             // output: 0 1 0 2 0 3 0 4 0 5
//             $strobe("%0d",p1.a[i]); // strobe prints the final values at the end of the simulation
//             // $display outputs values immediately when called while $strobe outputs values after 
//             // all processes in the current time step have completed. When both tasks are used in 
//             // the same time unit, $strobe will reflect changes made by nonblocking assignments that 
//             // occur before its execution, while $display will show values as they were at the moment it was called.

// Pattern 4:
// we can use randc for unique values which gives out cyclic random values

// 2-state variable types example: for declaring packet length we like it to be numerical value rather than x or z
// when a 4 state var is converted to a 2 state var the unknown(x) and high impedance(z) states are converted to zeros
// Byte:
//      8 bit signed integer.
        // uses two's compliment to represent negative values
        // range for a byte : -128 to 127
// 
// Shortint: 
            // 2-state, 16 bit signed integer

// Int:
        // 2-state, 32-bit signed integer datatype
// Longint:
            // 2-state, 64-bit signed integer