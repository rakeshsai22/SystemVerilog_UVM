module tb_counter_sv;
  logic clk, rst_n;
  logic [3:0] count;

  counter dut (.clk(clk), .rst_n(rst_n), .count(count));

  // clock
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    rst_n = 0;
    repeat (2) @(posedge clk);
    rst_n = 1;
    repeat (20) begin
      @(posedge clk);
      $display("t=%0t count=%0d", $time, count, count);
    end

    $finish;
  end
endmodule

// - V e r i l a t i o n   R e p o r t: Verilator 5.038 2025-07-08 rev UNKNOWN.REV
// - Verilator: Built from 0.040 MB sources in 3 modules, into 0.041 MB in 8 C++ files needing 0.000 MB
// - Verilator: Walltime 4.532 s (elab=0.004, cvt=0.007, bld=4.497); cpu 0.010 s on 1 threads
// t=25 count=1
// t=35 count=2
// t=45 count=3 
// t=55 count=4 
// t=65 count=5 
// t=75 count=6 
// t=85 count=7 
// t=95 count=8 
// t=105 count=9 
// t=115 count=10
// t=125 count=11
// t=135 count=12
// t=145 count=13
// t=155 count=14
// t=165 count=15
// t=175 count=0
// t=185 count=1
// t=195 count=2
// t=205 count=3
// t=215 count=4
// - tb_counter_sv.sv:52: Verilog $finish
// - S i m u l a t i o n   R e p o r t: Verilator 5.038 2025-07-08
// - Verilator: $finish at 220ps; walltime 0.000 s; speed 1.243 us/s
// - Verilator: cpu 0.000 s on 1 threads; alloced 0 MB