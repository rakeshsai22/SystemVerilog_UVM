// to generate unique values for the variables/elements in an array (fixed array, associative array, dynamic array, queue, stack, list, etc)

// syntax : constraint <name> {unique {array or varuiable name};}

typedef enum  { r,a,n,d,o,m } scale_e;

class seq_item;
    rand bit [3:0] arr_s[5]; //static arr
    rand bit [3:0] arr_d[]; //dynamic arr
    rand bit [7:0] arr_a[scale_e]; //associative arr

    rand bit [2:0] val1,val2,val3,val4;
    scale_e scale;

    constraint c_arr_s {unique {arr_s};} // unique constraint for static array
    constraint c_arr_d { unique {arr_d}; 
        arr_d.size() ==5;}  
    constraint value_a_c { unique {arr_a};
        arr_a.size == scale.num();}
    constraint val_c {unique {val1,val2,val3,val4};}
    
endclass

module cons_unique;
    seq_item item;
    initial begin
        item =new();

        repeat(3) begin
            item.randomize();
            $display("val1 =%0d, val2 = %0d, val3 = %0d, val4 = %0d",item.val1,item.val2,item.val3,item.val4);

            foreach (item.arr_s[i]) begin
                $display("arr_s[%0d] = %0d",i,item.arr_s[i]);
            end
            foreach (item.arr_d[i]) begin
                $display("arr_d[%0d] = %0d",i,item.arr_d[i]);
            end
            foreach (item.arr_a[i]) begin
                $display("arr_a[%0d] = %0d",i,item.arr_a[i]);
            end
        end
    end
    
endmodule

// testbench
module tb;
    cons_unique u_cons_unique();
endmodule

