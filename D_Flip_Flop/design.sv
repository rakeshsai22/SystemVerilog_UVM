module d_ff (
    input wire clk,
    input wire rst_n, //active low reset (async)
    input wire d,   //data in
    output reg q    //data out
);
    // Sequential logic block
    always @(posedge clk or negedge rst_n) begin
        // Asynchronous reset
        if(!rst_n) begin
            q<=1'b0; //Reset the output
        end
        else begin
            q<=d; //Assign the input to the output on clk edge
        end
    end
    // 
endmodule