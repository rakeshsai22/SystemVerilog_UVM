// Associative array stores entries in a sparse matrix format. 
// these arrs allocate the storage only when it is used, unless like in the dynamic array where the storage is allocated at the time of declaration.
// the index expression is not restricted to a simple integer or string, it can be any data type.
// Associative arrays are not allowed in the class, they can be declared only in the module or program block.
// Associative array implements a lookup table of the elements of its declared type. The data type to be used as an index serves as lookup key and imposes an ordering

//  Usage : When the size of the collection is unknown or the data space is sparse.

// data_type array_name [index_type] ;

int a_arr[*]; // assoc_arr of int type with unspecified index
bit [31:0] b_arr[string]; // assoc_arr of 32-bit type with string index
ev_arr [myclass]; //assoc_arr of event type with myclass index

// num() method returns the number of elements in the associative array
// delete() method removes the element from the associative array
// exists() method checks if the element exists in the associative array
// first(var) method assigns teh value of first index to the variable var
// last(var) method assigns teh value of last index to the variable var
// next(index,var) method assigns the value of the next index to the variable var
// prev(index,var) method assigns the value of the previous index to the variable var
// rand() method returns a random index from the associative array
// size() method returns the size of the associative array
// unique() method returns 1 if the associative array has unique elements, else returns 0
// values() method returns the values of the associative array

module assoc_arr;
    int a_arr[*];
    int index;
    int i =0;

    initial begin
        // allocating arr and assigning vals to it
        repeat(5) begin
            a_arr[index] = index*2;
            index=index+4;
        end
        $display("\t Num of elements in the associative array : %0d",a_arr.num());
        $display("## Assoc arr entries and values ###");
        foreach (a_arr[i]) begin
            $display("a_arr[%0d]= %0d",i,a_arr[i]);
        end

        // first and last index
        $display("first element in assoc arr : %0d",a_arr.first())
        $display("last element in assoc arr : %0d",a_arr.last())

        a_arr.first(index);
        $display("\First element in a_arr \t a_arr[%0d] = %0d ", index,a_arr[index]);

        

    end
endmodule