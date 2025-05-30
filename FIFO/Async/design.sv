// Async FIFO : a ffio buffer where th erad and write are controlled by independent clock domains which are not synchronized.

// Use cases:
// 1. interfacing between two clock domains: transferring data between a high speed processing unit and a slower peripheral unit.
// 2. Buffering data between two clock domains: to handle variations in data flow rates between producer and consumer componenets.
// 3. Bridging between two clock domains: bridging data between two clock domains to avoid data loss due to clock domain crossing.


//  EMty condition: rd_ptr == wr_ptr   
//  Full condition: wr_ptr[FIFO_DEPTH],]


// Code your design here

module examplfsm(input logic clk,
                 input logic rst,
                 input logic X,
                 output logic Y);
  
  typedef enum logic [2:0]{A,B,C,D,E} State;
  State currentState, nextState;
  
  always_ff @(posedge clk)
    if(rst) currentState <= A;
  else currentState<= nextState;
  
  always_comb
    case (currentState)
      A:{nextState,Y} = X?{C,1'b0}:{B,1'b1};
//       A:if(X) nextState = C;
//       	else nextState = B;
      B:if(X) nextState = D;
      	else nextState = B;
      C:if(X) nextState = C;
      	else nextState = E;
      D:if(X) nextState = C;
      	else nextState = E;
      E:if(X) nextState = D;
      	else nextState = B;
      default: nextState = A;
    endcase
//   assign Y = (currentState == D | currentState == E);
        
endmodule
        