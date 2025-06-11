module simple_config_reg (
    input logic clk,
    input logic rst_n,
    input logic wr_en,
    input logic [7:0] wr_data,
    output logic [1:0] mode_o,
    output logic enable_o
);
    logic [7:0] config_reg;
    always @(posedge clk or posedge rst) begin
        if(rst)
            config_reg<=8'b0000;
        else if (wr_en)
            config_reg <=wr_data;
        
    end
    
endmodule