module test;
    int a [10]; // unpacked type
    // queue
    // int e; // int is a packed type
    int c[$];
    int d[$];
    int out [$];

    initial begin
        for (int i=0;i<11;i++) begin
            a[i]=i;
        end
        $display("array a = %p",a);
        // we can also use a = '{0,1,2,3,4,5,6,7,8,9,10}; for declration and initialization
        // for (int i=0;i<11;i++) begin
        //     $display("a[%0d] = %0d",i,a[i]);
        // end
        // foreach (a[i]) begin
        //     $display("a=%d",a[i])
        // end

        c=a.find_first with(item>2) // find the first element greater than 2 in array a
        
        c = a.find_first(x) with (x>2);
        #1;
        c =a.find(x) with (x>2); // find the elements greater than 2 in array a
        $display("c=%p",c)
        c =a.find_index with (item == 2); // find the index of element 2 in array a
        $display("value at index 2 is %p",c)
        
    end



    
endmodule