module MUL_datapath(
    eqz,LdA,LdB,LdP,clrP,decB,data_in,clk
);
    input LdA,LdB,LdP,clrP,decB,clk;
    input [15:0] data_in;
    output eqz;
    wire [15:0] x,y,z,Bout,Bus;

    PIPO1 A (x,Bus,LdA,clk);
    PIPO2 P (y,z,LdP,clrP,clk);
    CNTR B (Bout,Bus,LdB,decB,clk);
    ADD AD (z,x,y);
    EQZ COMP (eqz,Bout);
    
endmodule

module PIPO1 (
    dout,din,ld,clk
);
    input [15:0] din;
    input ld,clk;
    output reg [15:0] dout;

    always @(posedge clk)
        if (ld) dout <= din;
endmodule

module ADD (
    out,in1,in2
);
    input [15:0] in1,in2;
    output reg [15:0] out;

    always @(*) begin
        out = in1+in2;
    end
endmodule

module PIPO2(
    dout,din,ld,clr,clk
);
    input [15:0] din;
    input ld,clk;
    output reg [15:0] dout;
    always @(posedge clk) begin
        if (clr) begin
            dout <= 16'b0;
        end
        else if (ld) begin
            ld<=din;
        end
    end
endmodule

module EQZ(
    eqz,data
);
    input [15:0] data;
    output eqz;
    assign eqz = (data == 0);
    
endmodule