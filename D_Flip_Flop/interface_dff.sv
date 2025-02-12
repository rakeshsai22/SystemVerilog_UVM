interface dff_if (input clk);
  //   we are using the clk generated in the testbench so we are sending the clk as an input  
  logic rst_n;
  logic d;
  logic q;

  // modport DRIVER (
  // input q,        //Drv reads the q and clk 
  // input clk,
  // output rst_n,    // Driver controls the rst_n and data
  // output d
  // );
  
  // modport MONITOR (
  //   input rst_n,    //Monitor reads the rst_n and data
  //   input d,
  //   input q,
  //   input clk
  // );

  // cb for driving inputs
  clocking drv_cb @(posedge clk);
    output rst_n, d;
  endclocking

    // cb for monitoring outputs
    clocking mon_cb @(posedge clk);
      input q;
    endclocking

    // modport for driver
  modport DRIVER(clocking drv_cb);
    // modport for monitor
  modport MONITOR(clocking mon_cb);
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
// Difference between a clocking block and a modport is that a clocking block 
// is used to define the timing of the signals and modport is used to define the interface of the signals.

// Modport : is like a sub-interface to an interface connection. Without modport, interface connections have 
// universal access to all signals in the interface.

// CLocking block : groups signals and creates a set of corresponding signlas that are used for sampling and 
// driving values synchronous to a particlular clk edge.

endinterface