// to generate unique values for the variables/elements in an array (fixed array, associative array, dynamic array, queue, stack, list, etc)

// syntax : constraint <name> {unique {array or varuiable name};}

typedef enum  { r,a,n,d,o,m } scale_e;

class seq_item;
    rand bit [3:0] arr_s[5];
    rand bit [3:0] arr_d[];
    rand bit [7:0] arr_a[scale_e];

    rand bit [2:0] val1,val2,val3,val4;
    scale_e scale;

    constraint c_arr_s {unique {arr_s};}
    constraint c_arr_d {unique {arr_d};}
    
endclass