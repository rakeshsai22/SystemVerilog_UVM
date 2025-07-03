class synchronous_counter_test extends uvm_test;
  `uvm_component_utils(synchronous_counter_test)

  synchronous_counter_env     my_env;
  synchronous_counter_seq     my_seq;
  virtual synchronous_counter_if synchronous_counter_vif;

  function new(string name = "synchronous_counter_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(virtual synchronous_counter_if)::get(this, "", "vif", synchronous_counter_vif))
      `uvm_fatal("NO_VIF", "virtual interface not found");

    uvm_config_db#(virtual synchronous_counter_if)::set(this, "my_env", "vif", synchronous_counter_vif);

    my_env = synchronous_counter_env::type_id::create("my_env", this);
  endfunction

  task run_phase(uvm_phase phase);
    string test_type;
    phase.raise_objection(this);

    if (!$value$plusargs("UVM_TESTTYPE=%s", test_type))
      test_type = "default";

    case (test_type)
      "default": begin
        `uvm_info("TEST", "Running default sequence", UVM_MEDIUM)
        my_seq = synchronous_counter_seq::type_id::create("my_seq");
        my_seq.start(my_env.agt.sqr);
      end

      default: begin
        `uvm_fatal("TEST", $sformatf("Unknown test type: %s", test_type))
      end
    endcase

    phase.drop_objection(this);
  endtask

endclass