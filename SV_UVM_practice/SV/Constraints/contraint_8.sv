module ssn_generator;
  bit [3:0] ssn_arr[][10];
    int ssn_count = 0;
    
class ssn;
    rand bit [3:0] arr[10];
   
    
    constraint ssn_val { 
        foreach(arr[i]) 
            arr[i] inside {[0:9]};
    }
    constraint ssn_first {
        arr[0] != 0;
    }
    
    constraint ssn_cons {
        foreach (arr[i]) {
            if (i < 8)
                !(arr[i] == arr[i+1] && arr[i] == arr[i+2]);
        }
    }

    constraint ssn_duplicates {
        foreach(arr[i]){
          arr.sum(item) with (int'(item == arr[i])) <= 3;
        }
    }
    // [1,0,2,3,3,5,3,7,3,9]
    // [0,0,0,1,1,0,1,0,1,0]<=3

    // constraint no_more_than_3_dupes {
    //     foreach (arr[i]) {
    //         int count = 0;
    //         foreach (arr[j]) {
    //         if (arr[i] == arr[j])
    //             count++;
    //         }
    //         count <= 3;
    //     }
    // }

    
    // function int count_dupes();
    //     count_dup = 0;
    //     foreach (arr[i]) begin
    //         foreach (arr[j]) begin
    //             if (i < j && arr[i] == arr[j]) begin
    //                 count_dup++;
    //             end
    //         end
    //     end
    // endfunction
      
    //   constraint count_dupes {
    //     count_dupes()<3;
    //   }
      
    // // function void post_randomize();
    // //   assert(count_dupes() > 3) else
    // //         $display("Duplicate count violation: %0d", count_dupes());
    // // endfunction
endclass



    initial begin
        ssn s = new();
        
        
        for (int k=0; k<100; k++) begin
            if (s.randomize()) begin
                foreach (s.arr[i]) begin
                  ssn_arr[k][i] = s.arr[i];
                end
                
                $write("SSN %3d: ", k+1);
              
                foreach (s.arr[i]) begin
                  $write("%d", s.arr[i]);
//                     $display("%d", s.arr[i]);
                end
              $display();
            end
            else begin
                $display("Randomization failed", k+1);
            end
        end
    end
endmodule