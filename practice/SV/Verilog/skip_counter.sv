module counter_skip_bit (
    input  logic clk,
    input  logic rst_n,
    output logic [7:0] count
);
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= 8'b0;
        else if (count == 8'd3)  //skip 4 
            count <= 8'd5;
        else
            count <= count + 1;
    end
endmodule
