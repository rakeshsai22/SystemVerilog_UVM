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

      rand int len,range,num;
//       int j =0;
//       rand int bwidth = $clog2(range+1);

//       rand int [bwidth:0]arrs[][];
      rand int unsigned arrs[][];
      
      constraint val {
        len inside {[1:8]};
        range inside {63};
        num inside {10};
      }
      
//       constraint 

      constraint arr_shape {
        arrs.size() == num;
        foreach(arrs[j]){
          arrs[j].size() == len;
        }
      }

//         constraint arr_range {
//           foreach (arrs[k]){
//             arrs[k][i] inside {[0:range]};
//           }
//         }
        constraint arr_vals {
          foreach(arrs[j]) {
            foreach(arrs[j][i]){
              arrs[j][i] inside {[0:range]};
            }
            foreach(arrs[j][i]){
            	if((arrs[j][i]%2))
              		arrs[j].sum(item) with (int'(item == arrs[j][i])) <= 3;
              
                else
                  arrs[j].sum(item) with (int'(item == arrs[j][i])) <= 2;
              
            }
        }
              }
              
         
     	function void print();
          foreach(arrs[j]) begin
            $write("Array %0d:",j);
            foreach (arrs[j][i]) begin
              $write(" %0d",arrs[j][i]);
              
            end
            $display();
          end
          endfunction

          
    endclass
          
          module top();
            initial begin
              rand_array a = new();
              if(!a.randomize()) begin
                $display("Randomization failed");
              end
              else begin
                a.print();
              end
              
              $finish;
            end
          endmodule

//     initial begin

//         rand_array a = new();

//         for(int k=0;k<10;k++) begin
//             if(a.randomize) begin
//                 foreach (a.arr[i]) begin
//                     arr_gen[k][i] = a.arr[i];
//                 end

//               $write("Array %0d :",k);

//                 foreach (a.arr[i]) begin
//                   $write("%d", a.arr[i]);
//                 end
//                 $display();
//             end
//             else begin
//                 $display("Randomization failed");
//             end
//         end
//     end


// endmodule

// ===============================================================
// Output
// ---------------------------------------------------------------

  // Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Aug 28 17:35 2025
  // Array 0: 23 47 54 48 4 
  // Array 1: 22 43 37 40 59 
  // Array 2: 47 0 21 51 5 
  // Array 3: 45 26 30 23 8 
  // Array 4: 33 19 17 18 56 
  // Array 5: 35 54 26 42 18 
  // Array 6: 25 47 3 6 12 
  // Array 7: 6 14 63 30 4 
  // Array 8: 12 32 43 41 39 
  // Array 9: 58 43 32 35 48 
  // $finish called from file "testbench.sv", line 92.
  // $finish at simulation time                    0
  //           V C S   S i m u l a t i o n   R e p o r t 
  // Time: 0 ns
  // CPU Time:      0.910 seconds;       Data structure size:   0.0Mb
  // Thu Aug 28 17:35:56 2025