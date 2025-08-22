# SPI Protocol Verification using UVM

This project implements a Universal Verification Methodology (UVM) testbench to verify the Serial Peripheral Interface (SPI) protocol. It simulates communication between an SPI Master and Slave, validating read and write operations.

## Features

- UVM-based verification of SPI Master-Slave communication
- Supports:
  - Write operations (MOSI data transmission)
  - Read operations (MISO data reception) 
  - Write-Read operations (full duplex communication)
  - Configurable delay cycles between transactions
- Constrained-random stimulus generation
- Reusable verification components following UVM methodology

## SPI Interface Signals

- **SCLK**: Serial Clock - Master generated clock signal
- **MOSI**: Master Out Slave In - Data from master to slave
- **MISO**: Master In Slave Out - Data from slave to master  
- **CS_N**: Chip Select (active low) - Slave selection signal
- **RST_N**: Reset (active low) - System reset

## Components

### UVM Components
- **spi_seq_item**: Transaction class modeling SPI operations
- **spi_sequencer**: Manages sequence execution
- **spi_driver**: Drives signals to DUT based on sequence items
- **spi_monitor**: Observes and collects transactions from interface
- **spi_agent**: Encapsulates driver, monitor, and sequencer
- **spi_env**: Top-level verification environment
- **spi_sequence**: Test sequences for stimulus generation
- **spi_test**: UVM test classes

### Design Under Test (DUT)
- **spi_slave**: Simple SPI slave with memory for testing

## Test Scenarios

1. **spi_base_test**: Random mix of read/write operations
2. **spi_write_test**: Focused on write operations only
3. **spi_read_test**: Focused on read operations only

## Getting Started

### Prerequisites
- SystemVerilog simulator (ModelSim, VCS, Xcelium, etc.)
- UVM library support
- Basic understanding of SPI protocol and UVM methodology

### Running Simulation

1. Compile all files:
   ```bash
   # Example with ModelSim
   vlog +incdir+. *.sv *.svh
   ```

2. Run simulation:
   ```bash
   # Run base test
   vsim -c top +UVM_TESTNAME=spi_base_test
   
   # Run specific tests
   vsim -c top +UVM_TESTNAME=spi_write_test
   vsim -c top +UVM_TESTNAME=spi_read_test
   ```

3. View waveforms:
   ```bash
   # VCD file is generated automatically
   gtkwave spi_test.vcd
   ```

## Functional Coverage

- SPI write transactions with MOSI data
- SPI read transactions with MISO data  
- Full-duplex write-read transactions
- Chip select assertion/deassertion timing
- Various data patterns and delay scenarios
- Multiple back-to-back transactions

## File Structure

```
SPI/
├── spi_interface.sv     # SPI interface definition
├── spi_seq_item.sv      # Transaction class
├── spi_sequencer.sv     # Sequencer component
├── spi_driver.sv        # Driver component
├── spi_monitor.sv       # Monitor component
├── spi_agent.sv         # Agent component
├── spi_env.sv          # Environment component
├── spi_sequence.sv      # Test sequences
├── spi_test.sv         # Test classes
├── spi_pkg.svh         # Package file
├── design.sv           # SPI slave DUT
├── testbench.sv        # Top-level testbench
└── README.md           # This file
```