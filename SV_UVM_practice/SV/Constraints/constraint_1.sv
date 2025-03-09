// Code your design here
class randvar;
  rand bit [7:0] var1,var3,var3,var4;
  randc bit[7:0] var2; //non-repeated values
  
  rand bit[7:0] A;
  rand bit [8:0] B;
  
  constraint A_c {A inside {[25:50]};}
  constraint A_c2 {A > 40;}
  constraint const_3 {var1<var2;
                     var2<var3;
                     var3<var4;}
  constraint const_4{B inside {[1:34],127,[129:156],[192:202],[257:260]};}
  constraint const_5{var1 <= 43;
                    var1 >= 34;}
  constraint const_6{var1 inside {[0:50]};}
  
  function void print_val(string comment = "Initial values");
    $display("%s: A = %0d, B = %0d, var1 = %0d, var2= %0d, var3 = %0d, var4 = %0d",comment,A,B,var1,var2,var3,var4);
  endfunction
endclass


module test;
  
  function void fail();
      $display("Randomization failed for the selected case");
    endfunction
//   task fail();
//     $display("randomization gailed");
//   endtask
  
  initial begin
    randvar r =new();
    
    int x =1;
    
    r. print_val("default values");
    
      
    
//     cannot use a function/task directly inside a initial block, why?
//     function void fail();
//       $display("Randomization failed for the selected case");
//     endfunction
    
    case (x)
      
      1: begin
        if(r.randomize()) 
          r.print_val("after randomizing all");
        else
          fail();
      end
      2: begin
        if(r.randomize(A))
          r.print_val("after randomizing only A");
        else 
          fail();
      end
      3: begin
        if(r.randomize(var1,var4))
          r.print_val("after randomizing two vars : var1,var4");
        else 
          fail();
      end
      4: begin
        if(r.randomize(var1,var2,var4))
          r.print_val("after randomizing three varsity: var1,var3,var4");
        else
          fail();
      end
      default:begin
        $display("plese select proper rand case");
      end
    endcase
  end
endmodule



// module rand_all;
//   initial begin
//     integer x;
//     randvar r1 = new();
//     if (r1.randomize()) begin
//       $display("rand all : var1 = %0d,  var2= %0d, var3 = %0d,var4 = %0d",r1.var1,r1.var2,r1.var3,r1.var4);
//     end
//     else 
//       $display("Randomization failed");
//   end
// endmodule

// module rand_one;
//   initial begin
//     randvar r2 = new();
//     if (r2.randomize(var2)) begin
//       $display("rand_one: var2 = %0d",r2.var2);
//     end
//     else
//       $display("Randomization of Var2 failed");
//   end
// endmodule


// module rand_two;
//   initial begin
//     randvar r3 = new();
//     if(r3.randomize(var1,var4)) begin
//       $display("rand_two: var1=%0d, var4=%0d",r3.var1,r3.var4);
//     end
//     else
//       $display("Randomization of var1 and var4 failed");
//   end
// endmodule

// module rand_three;
//   initial begin
//     randvar r4 =new();
    
//     if(r4.randomize(var1,var3,var4)) begin
//       $display("radn_three : var1=%0d,var3=%0d,var4=%0d",r4.var1,r4.var3,r4.var4);
//     end
//     else
//       $display("Ranfomization failed");
//   end
// endmodule






    





 


// ############################## OUTPUTS ########################################


// Output:
// default values: A = 0, var1 = 0, var2= 0, var3 = 0, var4 = 0
// Chronologic VCS simulator copyright 1991-2023
// Contains Synopsys proprietary information.
// Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Mar  9 06:52 2025
// default values: A = 0, B = 0, var1 = 0, var2= 0, var3 = 0, var4 = 0
// after randomizing all: A = 42, B = 258, var1 = 37, var2= 91, var3 = 109, var4 = 124
//            V C S   S i m u l a t i o n   R e p o r t 
// Time: 0 ns
// CPU Time:      0.410 seconds;       Data structure size:   0.0Mb

// ############################## OUTPUTS ########################################


    