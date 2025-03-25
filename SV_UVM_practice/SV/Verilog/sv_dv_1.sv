// Count number of ones in the number when converted to binary
module top;
    initial begin
        static int num = $urandom();
        static int count;
      $display("num = 32'h%0h",num);
      $display("num = 32'b%b",num);

      while (num > 0) begin
            if (num%2 == 1) begin
                count+=1;
            end
            num=num/2;
      end

        
        $display("count = %0d",count);

    end

    
endmodule

// Output
// CPU time: .363 seconds to compile + .440 seconds to elab + .455 seconds to link
// Chronologic VCS simulator copyright 1991-2023
// Contains Synopsys proprietary information.
// Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Mar 25 02:03 2025
// num = 32'h4207cc47
// num = 32'b01000010000001111100110001000111
// count = 13
//            V C S   S i m u l a t i o n   R e p o r t 
// Time: 0 ns
// CPU Time:      0.490 seconds;       Data structure size:   0.0Mb
// Tue Mar 25 02:03:30 2025

// #####################################################################################################################


// Queues
// write sv code to remove entries in queue q that have to_remove ==1
// to check that no entry has to_remove == 1

class widget;
    int id;
    bit to_remove;
endclass

module top;
    widget q[$];
    initial begin
        widget w;
        int num = $urandom_range(20,40);
        for (int i=0; i<num; i++) begin
            w = new;
            w.id = i;
            w.to_remove = $urandom_range(0,1);
            q.push_back(w);
            $display("widget id:%02d, to_remove: %b",q[$].id,q[$].to_remove);
        end

        for (int i=q.size()-1; i>=0; i--) begin
            if (q[i].to_remove == 1) begin
                q.delete(i);
            end
        end
        // q = q.find with (item.to_remove == 0);
        foreach(q[i]) begin
            if (q[i].to_remove == 1) begin
                $display("widget id:%02d is not okay", i);
            end
            else
                $display("widget id:%02d is ok",i);
        end
    end
            
    endmodule


// output

// Contains Synopsys proprietary information.
// Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Mar 25 02:25 2025
// widget id:00, to_remove: 0
// widget id:01, to_remove: 0
// widget id:02, to_remove: 1
// widget id:03, to_remove: 0
// widget id:04, to_remove: 1
// widget id:05, to_remove: 1
// widget id:06, to_remove: 0
// widget id:07, to_remove: 1
// widget id:08, to_remove: 0
// widget id:09, to_remove: 1
// widget id:10, to_remove: 1
// widget id:11, to_remove: 0
// widget id:12, to_remove: 0
// widget id:13, to_remove: 1
// widget id:14, to_remove: 1
// widget id:15, to_remove: 0
// widget id:16, to_remove: 0
// widget id:17, to_remove: 1
// widget id:18, to_remove: 0
// widget id:19, to_remove: 0
// widget id:20, to_remove: 0
// widget id:21, to_remove: 1
// widget id:22, to_remove: 1
// widget id:23, to_remove: 0
// widget id:24, to_remove: 1
// widget id:25, to_remove: 0
// widget id:26, to_remove: 1
// widget id:27, to_remove: 0
// widget id:28, to_remove: 0
// widget id:29, to_remove: 1
// widget id:30, to_remove: 1
// widget id:31, to_remove: 0
// widget id:32, to_remove: 0
// widget id:33, to_remove: 1
// widget id:34, to_remove: 0
// widget id:00 is ok
// widget id:01 is ok
// widget id:02 is ok
// widget id:03 is ok
// widget id:04 is ok
// widget id:05 is ok
// widget id:06 is ok
// widget id:07 is ok
// widget id:08 is ok
// widget id:09 is ok
// widget id:10 is ok
// widget id:11 is ok
// widget id:12 is ok
// widget id:13 is ok
// widget id:14 is ok
// widget id:15 is ok
// widget id:16 is ok
// widget id:17 is ok
// widget id:18 is ok
//            V C S   S i m u l a t i o n   R e p o r t 
// Time: 0 ns
// CPU Time:      0.340 seconds;       Data structure size:   0.0Mb
// Tue Mar 25 02:25:44 2025