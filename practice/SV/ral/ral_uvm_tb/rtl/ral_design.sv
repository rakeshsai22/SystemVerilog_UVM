module simple_config_reg (
    input logic clk,
    input logic rst_n,
    input logic wr_en,
    input logic [7:0] wr_data,
    output logic [1:0] mode_o,
    output logic enable_o
);
    logic [7:0] config_reg;
    // config reg stores the control bits for the DUT, these bits determine how our dut behaves at runtime
    // so if wr_data= 8'b0000 0101 =>   enable = 1 and mode = 01 >> configures dut in mode 1 and enables it.
    always @(posedge clk or negedge rst) begin
        if(!rst_n)
            config_reg<=8'b0000;
        else if (wr_en)
            config_reg <=wr_data;
        
    end

    assign mode_o = config_reg[1:0] //mode fiels
    assign enable_o = config_reg[2] //enable
    
endmodule