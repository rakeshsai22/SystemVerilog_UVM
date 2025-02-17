// Async FIFO : a ffio buffer where th erad and write are controlled by independent clock domains which are not synchronized.

// Use cases:
// 1. interfacing between two clock domains: transferring data between a high speed processing unit and a slower peripheral unit.
// 2. Buffering data between two clock domains: to handle variations in data flow rates between producer and consumer componenets.
// 3. Bridging between two clock domains: bridging data between two clock domains to avoid data loss due to clock domain crossing.


//  EMty condition: rd_ptr == wr_ptr   
//  Full condition: wr_ptr[FIFO_DEPTH],]