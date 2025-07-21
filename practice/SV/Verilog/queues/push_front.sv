// Code your testbench here
// or browse Examples

module bounded_queue;
  
  int queue[$:2];
  
  initial begin
    queue = {4,5,6};
    queue.push_back(10);
    $display("after push back: queue=%p",queue);
    queue.push_front(10);
    $display("after push front: queue=%p",queue);
  end
endmodule


// output 

// Warning-[DT-OOBBQ] Out of bound addition in bounded queue
// testbench.sv, 10
//   Addition of new element beyond the upper bound (3) of the queue shall be 
//   ignored.
//   Please make sure that the queue is not full or the index is within the 
//   bounds of the queue.

// after push back: queue='{4, 5, 6} 

// Warning-[DT-HEBQD] Highest-numbered element of bounded queue deleted
// testbench.sv, 12
//   Addition of new element in bounded queue exceeded the queue's bound.
//   It would cause deletion of highest-numbered element of queue.

// after push front: queue='{10, 4, 5} 
//            V C S   S i m u l a t i o n   R e p o r t 
// Time: 0 ns
// CPU Time:      0.450 seconds;       Data structure size:   0.0Mb
// Fri May 30 01:39:21 2025