// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples

// ===============================================================
// Question
// ---------------------------------------------------------------
// Generate NUM arrays, each of length LEN. Every element is an
// unsigned value in [0:RANGE]. Impose a duplicate policy:
//   - Odd values may appear at most 3 times in an array.
//   - Even values may appear at most 2 times in an array.
// Print each generated array.

// module top();

//   int len 	= 16; // length of the arr
//   int range 	= 63; // range of values in the arr
//   int bwidth = $clog2(range+1);
//   int num 	=10;
  
//   bit[bwidth-1:0] arr_gen[num][len];

    class rand_array;

      rand int len,range;
//       int j =0;
//       rand int bwidth = $clog2(range+1);

//       rand int [bwidth:0]arrs[][];
      rand int unsigned arr[];
      
      constraint val {
        len inside {[1:16]};
        range inside {16};
      }
      
//       constraint 

      constraint arr_shape {
          arr.size() == len;
      }

        constraint arr_vals {
          foreach(arr[j]) {  
//             arr[j] inside {[range-2:range]};
            arr[j] inside {[0:range]};
            
            if((arr[j]%2))
              	arr.sum(item) with (int'(item == arr[j])) <= 3;
              
                else
                  arr.sum(item) with (int'(item == arr[j])) <= 2;
              
            }
        }
              

          
    endclass
          
          module top();
            initial begin
              rand_array a = new();
              repeat(5) begin
                if(a.randomize()) begin
                  $write("Array:");
                  foreach(a.arr[j]) begin
                    $write(" %0d",a.arr[j]);
                  end
                  $display();
                end
                else begin
                  $display("Randomization failed");
                end
              end
              
              $finish;
            end
          endmodule


// Contains Synopsys proprietary information.
// Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Aug 29 02:00 2025
// Array: 13 2 11 8 15 5 
// Array: 13 4 12 8 11 14 
// Array: 2 11 6 12 12 4 15 7 6 
// Array: 16 2 2 5 13 1 5 4 7 14 
// Array: 16 7 10 9 
// $finish called from file "testbench.sv", line 78.
// $finish at simulation time                    0
//            V C S   S i m u l a t i o n   R e p o r t 
// Time: 0 ns
// CPU Time:  