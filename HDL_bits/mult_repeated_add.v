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

module CNTR (
    dout,din,ld,dec,clk
);
  input [15:0] din;
  input ld,clk,dec;
  output reg [15:0] dout;
  always @(posedge clk) begin
    if (ld) dout<=din;
    else if (dec) begin
        dout <= dout - 1;
    end
  end  
endmodule

module controller (
    LdA,LdB,LdP,clrP,decB,done,clk,eqz,start
);
    input clk,eqz,start;
    output reg LdA,LdB,LdP,clrP,decB,done;
    reg [2:0] state;
    parameter 
    s0 = 3'b000,
    s1 = 3'b001,
    s2 = 3'b010,
    s3 = 3'b011,
    s4 = 3'b100;

    always @(posedge clk) begin
        case (state)
            s0: if(start) state<=s1;
            s1: state<=s2;
            s2: state<=s3;
            s3: #2 if(eqz) state <= s4;
            s4: state<=s4;
            default: state<=s0;
        endcase
    end
    always @(state) begin
        case (state)
            s0: begin #1 LdA = 0; LdB =0; LdP = 0;clrP = 0;decB=0; end
            s1: begin #1 LdA = 1; end
            s2: begin #1 LdA = 0; LdB = 1; clrP = 1; end
            s3: begin #1 LdB = 0; LdP = 1; LdP = 0; decB = 0; end
            s4: begin #1 done = 1; LdB = 0; LdP = 0; decB = 0; end
            default begin #1 LdA =0; LdB = 0; LdP = 0; clrP =0; decB =0 ; end
        endcase
    end

endmodule