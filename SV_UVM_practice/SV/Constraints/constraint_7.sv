// generate an array of size 6 where all the elements are between 10 and 20, and all are unique

class unique_arr;
    rand bit [7:0] arr[6];
    integer i=3'b0;
    constraint val_range {
        foreach (arr[i])
            arr[i] inside {[10:20]};
    }

    constraint uniq_elements {
        unique{arr};
    }

endclass //unique_arr

module test;

    initial begin
        unique_arr a = new();
        if (a.randomize) begin
            $display("array = %p",a.arr);
        end
        else
            $display("rand failed");


    end
    
endmodule