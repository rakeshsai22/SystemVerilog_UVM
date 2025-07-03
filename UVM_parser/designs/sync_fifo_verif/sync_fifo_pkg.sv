package sync_fifo_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "sync_fifo_seq_item.sv"
  `include "sync_fifo_seq.sv"
  `include "sync_fifo_sequencer.sv"
  `include "sync_fifo_driver.sv"
  `include "sync_fifo_monitor.sv"
  `include "sync_fifo_agent.sv"
  `include "sync_fifo_env.sv"
  `include "sync_fifo_test.sv"

endpackage : sync_fifo_pkg