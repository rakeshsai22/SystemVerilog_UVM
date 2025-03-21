// to randomize the variable inside the module
module scope;
    int var;
    initial begin
        if(randomize(var))
        $display("Randomization successful, var = %0d",var);
        else begin
            $display("Randomization failed, var = %0d",var);
        end
    end
    
endmodule

// randomizing teh object

`define START_RANGE 35
`define END_RANGE 45

class seq_item #(parameter int p1 =10,p2 =20);
    rand bit[7:0] val1;
    rand bit[7:0] val2;
    rand bit[7:0] val3;
    rand bit[7:0] val4;
    rand bit[7:0] val5;
    rand bit[7:0] val6;
    rand bit[7:0] val7;

    constraint val1_c {val1 inside {[10:20]};}
    constraint val2_c {val2 inside {40,70,80};} 
    constraint val3_c {val3 inside {[10:20], 21, 23,[24:30],40,70,80};} // multiple ranges
    constraint val4_c {!(val4 inside {[100:200]});} // negation of the constraint
    constraint val5_c {val5 inside {[val1:val2]};} // val1 and val2 are rand variables
    constraint val6_c {val6 inside {[`START_RANGE:`END_RANGE]};} // `START_RANGE and `END_RANGE are defined as macro
    constraint val7_c {val7 inside {[p1:p2]};} // p1 and p2 are passed as parameter to the class
    
endclass

module constraint_ex;
    seq_item#(100,200) obj;
    initial begin
        obj = new();
        repeat(5) begin
            obj.randomize();
            $display("val1 = %0h, val2 = %0h, val3 = %0h, val4 = %0h, val5 = %0h, val6 = %0h, val7 = %0h", obj.val1, obj.val2, obj.val3, obj.val4, obj.val5, obj.val6, obj.val7);
        end
    end
    
endmodule

// // randomizing the object inside the module
// module scope_rand;
//     seq_item#(100,200) obj;
//     initial begin
//         if(obj.randomize())
//         $display("Randomization successful, obj = %0h",obj);
//         else begin
//             $display("Randomization failed, obj = %0h",obj);
//         end
//     end
// endmodule

