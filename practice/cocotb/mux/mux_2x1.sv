// mux 2x1 hdl code 

module mux_2x1 (
    input a,b,sel,
    output out
);
    assign out = sel ? a:b;
    // initial begin
    //     $dumpfile("dump.vcd");
    //     $dumpvars(0,mux_2x1);
    // end
    
endmodule
