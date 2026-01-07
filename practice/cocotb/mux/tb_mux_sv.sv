module tb_mux_sv;
    logic a, b, sel;
    logic out;

    mux_2x1 dut (
        .a(a), .b(b), .sel(sel), .out(out)
    );

    initial begin
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

// - V e r i l a t i o n   R e p o r t: Verilator 5.038 2025-07-08 rev UNKNOWN.REV
// - Verilator: Built from 0.039 MB sources in 3 modules, into 0.021 MB in 8 C++ files needing 0.000 MB
// - Verilator: Walltime 5.933 s (elab=0.005, cvt=0.012, bld=5.901); cpu 0.009 s on 1 threads
