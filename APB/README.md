# AMBA APB Protocol Verification using UVM

This project implements a Universal Verification Methodology (UVM) testbench to verify the AMBA Advanced Peripheral Bus (APB) protocol. It simulates communication between an APB Master and Slave, validating read and write operations under various timing and state conditions.


## Features

- UVM-based verification of APB Master-Slave communication.
- Supports:
  - Write/Read operations with and without wait states.
  - Constrained-random stimulus generation.
  - Protocol assertions for coverage and checking.
- Configurable test sequences and reusable verification components.

## Functional Coverage

- Write transfer with PSEL, PENABLE, and PWRITE asserted.
- Read transfer with valid data output from slave.
- Timing and sequencing of PREADY and PSLVERR.
- Multiple back-to-back transfers.
- Wait state insertion and resolution.

## Getting Started

### Prerequisites

- Simulator: Synopsys VCS / Mentor ModelSim / Aldec Riviera-PRO
- UVM library (IEEE 1800.2 compliant)
- SystemVerilog compiler

### Running Simulation

1. Compile all files:
    ```bash
    vcs -sverilog -ntb_opts uvm tb/tb_top.sv +incdir+tb +incdir+rtl
    ```

2. Run simulation:
    ```bash
    ./simv +UVM_TESTNAME=apb_basic_test
    ```

3. View waveform (optional):
    ```bash
    dve -vpd vcdplus.vpd &
    ```
