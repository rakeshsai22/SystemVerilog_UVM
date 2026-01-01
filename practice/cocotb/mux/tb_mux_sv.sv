module tb_mux_sv;
    logic a, b, sel;
    logic out;

    mux_2x1 dut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_mux_sv);

        a = 0;
        b = 0;
        sel = 0;  
                    
        #5;
        a = 1; 
        #5;
        sel = 1;

        $finish;
    end
endmodule
