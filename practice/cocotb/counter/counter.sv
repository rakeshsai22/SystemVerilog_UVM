module counter (
    inout logic clk,
    input logic rst_n,
    output logic [3:0] count
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= 4'b0000;
        end
        else begin
            count<= count + 1;
        end
    end
    
endmodule