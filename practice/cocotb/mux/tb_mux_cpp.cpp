#include "Vmux_2x1.h"
#include "verilated.h"
#include <iostream>

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);

    Vmux_2x1 dut;   // Instantiate the DUT

    dut.a = 0;
    dut.b = 0;
    dut.sel = 0;
    dut.eval();
    std::cout << "sel=0, out=" << (int)dut.out << std::endl;

    dut.a = 1;
    dut.sel = 1;
    dut.eval();
    std::cout << "sel=1, out=" << (int)dut.out << std::endl;

    return 0;
}
