interface dff_if (input clk);
  //   we are using the clk generated in the testbench so we are sending the clk as an input  
  logic rst_n;
  logic d;
  logic q;

  modport DRIVER (
  input q,        //Drv reads the q and clk 
  input clk,
  output rst_n,    // Driver controls the rst_n and data
  output d
  );
  
  modport MONITOR (
    input rst_n,    //Monitor reads the rst_n and data
    input d,
    input q,
    input clk
  );
  // ################################################################################################

          //   UVM Testbench
        // +-------------------+
        // | Driver (DRIVER)   |-----> rst_n, d
        // | Monitor (MONITOR) |<----- q, rst_n, d
        // +-------------------+
        //            |
        //            v
        //       DUT (d_flip_flop)

  // ################################################################################################

  // clocking block
  // clocking cb @(posedge clk);
  //   default input #2 output #1step;
  //   output rst_n,d; //input of DUT
  //   input q; //output of DUT
  // endclocking


endinterface