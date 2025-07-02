class fulladd_test extends uvm_test;
  `uvm_component_utils(fulladd_test)

  fulladd_env fulladd_env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    fulladd_env = fulladd_env::type_id::create("fulladd_env", this);
  endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);

    fulladd_seq my_seq;
    my_seq = fulladd_seq::type_id::create("my_seq");
    my_seq.start(fulladd_env.fulladd_agt.fulladd_sqr);

    phase.drop_objection(this);
  endtask

endclass