module tb_counter;
    logic clk,rst_n;
    logic [3:0] out;

    counter dut (.clk(clk), .rst_n(rst_n), .out(out));

    initial begin
        clk =0;
    end

    always begin
        #5 clk = ~clk;
    end

    initial begin
        rst_n =0;
        repeat(2) @(posedge clk);
        rst_n = 1;

        repeat(20) begin
            @(posedge clk);

            $display("t=%0t count = %0d", $time, count, count);
        end
        $finish;
    end
    endmodule