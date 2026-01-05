#include <iostream>
#include "Vcounter.h"
#include "verilated.h"

// Advance one full clock cycle
void tick(Vcounter* dut, vluint64_t& sim_time) {
    // falling edge
    dut->clk = 0;
    dut->eval();
    sim_time++;

    // rising edge (posedge happens here)
    dut->clk = 1;
    dut->eval();
    sim_time++;
}

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);

    // Create DUT
    Vcounter* dut = new Vcounter;
    vluint64_t sim_time = 0;

    // Initialize signals
    dut->clk   = 0;
    dut->rst_n = 0;   // assert reset
    dut->eval();

    // Hold reset for 2 cycles
    tick(dut, sim_time);
    tick(dut, sim_time);

    // Release reset
    dut->rst_n = 1;

    // Run counter
    for (int i = 0; i < 10; i++) {
        tick(dut, sim_time);
        std::cout << "Cycle " << i
                  << " Count = " << (int)dut->count
                  << std::endl;
    }

    // Cleanup
    dut->final();
    delete dut;
    return 0;
}

// - V e r i l a t i o n   R e p o r t: Verilator 5.038 2025-07-08 rev UNKNOWN.REV
// - Verilator: Built from 0.025 MB sources in 2 modules, into 0.021 MB in 6 C++ files needing 0.000 MB
// - Verilator: Walltime 3.540 s (elab=0.003, cvt=0.007, bld=3.520); cpu 0.009 s on 1 threads

