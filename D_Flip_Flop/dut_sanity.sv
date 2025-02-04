// Before integrating UVM, a sanity check for the design

module dut_sanity;
    reg clk, rst_n, d;
    wire q;

    // Instantiate the DUT
    d_ff dut(.clk(clk),.rst_n(rst_n),.d(d),.q(q));

    // Clock generation
    intial begin
        clk =0;
        forever #5 clk=~clk;
    end

    // Stimulus
    inital begin
        rst_n =1;
        d=0;

        // Test rest
        rst_n = 0; #10;
        rst_n =1; #10;

        // Test data
        d=1; #20; // q->1 after clk edge
        d =0; #20; // q->0 after clk edge
        $finish;
    end
    // Monitor
    initial begin
        $monitor("Time=%0t : rst_n = %b, d =%b, q=%b",$time,rst_n,d,q);
    end
endmodule

// Testbench for the design
// Compare this snippet from EDA/verilog/D_Flip_Flop/design.sv
module tb_d_ff;
    reg clk, rst_n, d;
    wire q;

    // Instantiate the DUT
    d_ff dut(.clk(clk),.rst_n(rst_n),.d(d),.q(q));

    // Clock generation
    initial begin
        clk =0;
        forever #5 clk=~clk;
    end

    // Stimulus
    initial begin
        rst_n =1;
        d=0;

        // Test rest
        rst_n = 0; #10;
        rst_n =1; #10;

        // Test data
        d=1; #20; // q->1 after clk edge
        d =0; #20; // q->0 after clk edge
        $finish;
    end
    // Monitor
    initial begin
        $monitor("Time=%0t : rst_n = %b, d =%b, q=%b",$time,rst_n,d,q);
    end
endmodule