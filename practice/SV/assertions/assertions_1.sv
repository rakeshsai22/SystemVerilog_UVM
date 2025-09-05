module tb;
  bit a;
  bit clk;

  // This sequence states that a should be high on every posedge clk
//   sequence s_a;
//     @(posedge clk) $rose(a==0);
  
//     @(posedge clk) $rose(a);
//   endsequence

  // When the above sequence is asserted, the assertion fails if 'a'
  // is found to be not high on any posedge clk
  assert property(@(posedge clk) $rose(a));
    

  always #5 clk = ~clk;
    always@(posedge clk) begin
      a=1;
    end

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars(0, tb);     

	#50ns $finish;
  end
endmodule