// Code your design here
module top;
    string fruits[$] = {"apple","mango"};

    initial begin
        // size()
      $display("size of queue fruits: %p :: %0d",fruits,fruits.size());
        // insert()
      fruits.insert(1,"orange");
      $display("insert orange fruits: %p",fruits);
        // delete at a given index
      fruits.delete(2);
      $display("delete element at index 3 in fruits : %p ",fruits);
        // pop_front()
      $display("pop element %s queue fruits : %p",fruits.pop_front(),fruits);
    end

endmodule

// output : 
// Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Mar 21 13:29 2025
// size of queue fruits: '{"apple", "mango"}  :: 2
// insert orange fruits: '{"apple", "orange", "mango"} 
// delete element at index 3 in fruits : '{"apple", "orange"}  
// pop element apple queue fruits : '{"orange"} 