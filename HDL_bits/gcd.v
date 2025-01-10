module GCD_datapath (
    gt,lt,eq,ldA,ldB,sel1,sel2,sel_in,data_in,clk
);
    input ldA,ldB,sel1,sel2,sel_in,clk;
    input [15:0] data_in;
    output gt,lt,eq;
    wire [15:0] Aout,Bout,X,Y,Bus,SubOut;

    PIPO A (Aout,Bus,ldA,clk);
    PIPO B (Bout,Bus,ldB,clk);
    MUX MUX_in1 (X,Aout,Bout,sel1);
    MUX MUX_in2 (Y,Aout,Bout,sel2);
    MUX MUX_load (Bus,data_in,SubOut,sel_in);
    SUB SB (SubOut,X,Y);
    COMPARE COMP(lt,gt,eq,Aout,Bout);
endmodule

module PIPO (
    data_out,data_in,ld,clk
);
  input [15:0] data_in;
  input ld,clk;
  output reg [15:0] data_out;

  always @(posedge clk)
    if (ld) data_out <= data_in;

endmodule

module SUB (
    out,in1,in2
);
    input [15:0] in1,in2;
    output reg [15:0] out;

    always @(*) begin
        out = in1-in2;
    end
    
endmodule

module MUX (
    out,in1,in2,sel
);
    input [15:0] in1,in2;
    input sel;
    output reg [15:0] out;

    always @(*) begin
        if (sel) begin
            out = in1;
        end
        else begin
            out = in2;
        end
    end
endmodule

module COMPARE (
    lt,gt,eq,in1,in2
);
    input [15:0] in1,in2;
    output lt,gt,eq;

    assign lt = (in1 < in2);
    assign gt = (in1 > in2);
    assign eq = (in1 == in2);
endmodule

module name(
    port_list
);
    
endmodule