// program counter register

module pc_reg (
    input wire clk,
    input wire rst,
    input [31:0] next_pc_reg_i,
    output [31:0] next_pc_reg_o
);
    reg next_pc_reg;
    assign next_pc_reg_o = next_pc_reg;
    always@(posedge clk or posedge rst) begin
        if(rst) begin
            next_pc_reg<=31'b0;
        end
        else begin
            next_pc_reg<=next_pc_reg_i;
            end

    end
endmodule
}