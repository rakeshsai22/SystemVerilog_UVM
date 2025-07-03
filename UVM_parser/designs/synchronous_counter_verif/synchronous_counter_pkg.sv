package synchronous_counter_pkg;
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  `include "synchronous_counter_seq_item.sv"
  `include "synchronous_counter_seq.sv"
  `include "synchronous_counter_sequencer.sv"
  `include "synchronous_counter_driver.sv"
  `include "synchronous_counter_monitor.sv"
  `include "synchronous_counter_agent.sv"
  `include "synchronous_counter_env.sv"
  `include "synchronous_counter_test.sv"

endpackage : synchronous_counter_pkg