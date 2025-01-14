module dff_sync(
    input clk,rst,
    input d,
    output reg q
);
  always@(posedge clk) begin
    if (rst) q<=0;
    else q<=d;
  end

endmodule

module dff_async(
    input clk,rst,
    input d,
    output reg q
);
    always@(posedge clk or posedge rst) begin
        if(rst) q<=0;
        else q<=d;
    end
endmodule


module tb;

    reg clk;
    reg rst;
    reg d;
    wire q_sync;
    wire q_async;

    // Instantiate the synchronous D flip-flop
    dff_sync dff_sync_inst(
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q_sync)
    );

    // Instantiate the asynchronous D flip-flop
    dff_async dff_async_inst(
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q_async)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    initial begin
        clk = 0;
        rst = 0;
        d = 0;
        rst = 1;
        #10;
        rst = 0;

        // test vectors
        d = 1;
        #10;
        d = 0;
        #10;
        d = 1;
        #10;
        d = 0;
        #10;
        $finish;
    end

    initial begin
        $monitor("Time=%0t clk=%b rst=%b d=%b q_sync=%b q_async=%b", $time, clk, rst, d, q_sync, q_async);
        $display("Time=%0t clk=%b rst=%b d=%b q_sync=%b q_async=%b", $time, clk, rst, d, q_sync, q_async);
    end
    initial begin
        $dumpfile("tb_dff.vcd");
        $dumpvars(0, tb);
    end

endmodule