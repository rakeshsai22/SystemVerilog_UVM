module top;

  // Check this import matches your VC package name
  import packet_pkg::*;

  logic clk = 1'b0;
  logic reset = 1'b0;

  // Declare a handle on your top level VC component class
  packet_vc pvc;
  always
    #10 clk <= ~clk;

  // 4-Port Switch interface instances for every port
  port_if port0(clk,reset);
  port_if port1(clk,reset);
  port_if port2(clk,reset);
  port_if port3(clk,reset);

  // DUT instantiation using interface ports
  switch_port sw1 (.port0, .port1, .port2, .port3, .clk, .reset);

   initial begin
    $timeformat(-9,2," ns",8);
    reset = 1'b0;
    @(negedge clk);
    reset = 1'b1;
    @(negedge clk);
    reset = 1'b0;

    // insert your VC instantiation, configuration and run code here:
    pvc = new("pvc0", null);
    pvc.configure(port0, 0);
    pvc.run(3);
    #1000;
    $finish;
   end

 // Monitors to capture Switch output data
 initial begin : monitors
   fork
     port0.monitor(0);
     port1.monitor(1);
     port2.monitor(2);
     port3.monitor(3);
   join
 end

endmodule

