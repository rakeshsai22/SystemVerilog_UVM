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

module top();

  localparam int len 	= 16; // length of the arr
  localparam int range 	= 63; // range of values in the arr
  localparam int bwidth = $clog2(range+1);
  localparam int num 	=10;
  
  bit[bwidth-1:0] arr_gen[num][len];

    class rand_array;

      rand bit [bwidth:0]arr[len];

        constraint arr_range {
          foreach (arr[i]){
                arr[i] inside {[0:range]};
          }
        }
        constraint arr_duplicates {
            foreach(arr[i]){
              if((arr[i]%2))
                    arr.sum(item) with (int'(item == arr[i])) <= 3;
              
                else
                    arr.sum(item) with (int'(item == arr[i])) <= 2;
              
            }
        }
    endclass

    initial begin

        rand_array a = new();

        for(int k=0;k<10;k++) begin
            if(a.randomize) begin
                foreach (a.arr[i]) begin
                    arr_gen[k][i] = a.arr[i];
                end

              $write("Array %0d :",k);

                foreach (a.arr[i]) begin
                  $write("%d", a.arr[i]);
                end
                $display();
            end
            else begin
                $display("Randomization failed");
            end
        end
    end


endmodule