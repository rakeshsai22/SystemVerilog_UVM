class sync_fifo_env extends uvm_env;
  `uvm_component_utils(sync_fifo_env)

  sync_fifo_agent agt;

  function new(string name = "sync_fifo_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = sync_fifo_agent::type_id::create("agt", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

endclass