# JTAG (IEEE 1149.1) TAP Controller Design and Verification

This repository contains a SystemVerilog-based implementation and Universal Verification Methodology (UVM) testbench for verifying a JTAG TAP Controller compliant with the IEEE 1149.1 standard.

## Overview

The JTAG TAP (Test Access Port) Controller enables boundary scan testing and internal state visibility of digital ICs. This project implements:
- RTL for TAP controller state machine.
- Support for mandatory instructions: `EXTEST`, `SAMPLE/PRELOAD`, `BYPASS`, and `IDCODE`.
- Full state transition diagram as defined by IEEE 1149.1.
- A UVM environment that tests functional correctness via constrained-random stimulus and protocol-specific checks.


## Objectives

- Implement a TAP controller FSM with all 16 IEEE-specified states.
- Enable scanning of boundary scan and instruction registers.
- Verify TAP operations using a modular UVM environment.
- Validate correct TMS-controlled transitions and shift/capture/update behavior.

## Interface Signals

- `TCK`: Test Clock (drives FSM transitions)
- `TMS`: Test Mode Select (controls next FSM state)
- `TDI`: Test Data In (shifted in via scan chain)
- `TDO`: Test Data Out (shifted out from scan chain)
- `TRST`: (optional) TAP Controller Reset

## Instructions Supported

| Instruction      | Description                                                                 |
|------------------|-----------------------------------------------------------------------------|
| `BYPASS`         | Connects TDI to TDO through a single-bit pass-through register              |
| `EXTEST`         | Drives values onto I/Os using Boundary Scan Register (BSR)                  |
| `SAMPLE/PRELOAD` | Samples functional data on I/Os or preloads test vectors into the BSR       |
| `IDCODE`         | Outputs device identification code                                          |
| `INTEST`         | Drives core logic signals through the BSR                                   |

## Testbench Features

- UVM testbench with:
  - Configurable sequences
  - Scoreboard and coverage collection
  - Assertion-based protocol checks
- Tests include:
  - State machine transition coverage
  - Register capture/shift/update validation
  - IDCODE and BYPASS chain testing

## Simulation

### Prerequisites

- Simulator: Synopsys VCS / Mentor Questa / Aldec Riviera
- UVM library
- SystemVerilog 2012+ support

### Run Instructions

```bash
# Compile
vcs -sverilog +acc +vpi +vcs+lic+wait -ntb_opts uvm -f filelist.f

# Run simulation
./simv +UVM_TESTNAME=jtag_basic_test
