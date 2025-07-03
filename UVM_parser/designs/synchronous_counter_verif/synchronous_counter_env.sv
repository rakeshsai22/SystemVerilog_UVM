class synchronous_counter_env extends uvm_env;
  `uvm_component_utils(synchronous_counter_env)

  synchronous_counter_agent agt;

  function new(string name = "synchronous_counter_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = synchronous_counter_agent::type_id::create("agt", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
  endfunction

endclass