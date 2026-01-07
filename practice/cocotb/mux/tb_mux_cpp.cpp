// #include "Vmux2x1.h"
#include <iostream>

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);

    mux_2x1 dut;   // Instantiate the DUT

    dut.a = 0;
    dut.b = 0;
    dut.sel = 0;a
    dut.eval();
    std::cout << "sel=0, out=" << (int)dut.out << std::endl;

    dut.a = 1;
    dut.sel = 1;
    dut.eval();
    std::cout << "sel=1, out=" << (int)dut.out << std::endl;

    return 0;
}

// - V e r i l a t i o n   R e p o r t: Verilator 5.038 2025-07-08 rev UNKNOWN.REV
// - Verilator: Built from 0.025 MB sources in 2 modules, into 0.025 MB in 7 C++ files needing 0.000 MB
// - Verilator: Walltime 0.037 s (elab=0.005, cvt=0.011, bld=0.000); cpu 0.009 s on 1 threads