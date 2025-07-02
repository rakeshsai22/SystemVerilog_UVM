class fulladd_env extends uvm_env;
  `uvm_component_utils(fulladd_env)

  fulladd_agent   fulladd_agt;
  fulladd_monitor fulladd_mon;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    fulladd_agt = fulladd_agent::type_id::create("fulladd_agt", this);
    fulladd_mon = fulladd_monitor::type_id::create("fulladd_mon", this);
  endfunction

endclass