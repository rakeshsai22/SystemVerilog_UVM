// `include "mult_repeated_add.v"
// `default_nettype none

module tb_mult;
reg [15:0] data_in;
reg clk, start;
reg rst_n;
wire done;

MUL_datapath DP (eqz,LdA,LdB,LdP,clrP,decB,data_in,clk);
controller CON (LdA,LdB,LdP,clrP,decB,done,clk,eqz,start);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    clk = 1'b0;
    #3 start = 1'b1;
    #500 $finish;
end
initial begin
    #17 data_in = 17;
    #10 data_in = 5;
end

initial begin
    $monitor ($time, "%d %b", DP.y,done);
    $dumpfile ("mul.vcd");
    $dumpvars (0,tb_mult);
end

endmodule
// `default_nettype wire