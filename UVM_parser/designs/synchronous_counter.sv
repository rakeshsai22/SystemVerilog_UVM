module synchronous_counter #(parameter SIZE = 4) (
    input  logic              clk,
    input  logic              rst_n,
    input  logic              up,
    output logic [SIZE-1:0]   cnt
);

    always_ff @(posedge clk) begin
        if (!rst_n)
            cnt <= '0;
        else if (up && cnt < (2**SIZE - 1))
            cnt <= cnt + 1;
        else if (!up && cnt > 0)
            cnt <= cnt - 1;
        else
            cnt <= cnt;
    end

endmodule
