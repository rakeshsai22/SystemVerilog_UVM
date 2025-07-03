class sync_fifo_test extends uvm_test;
  `uvm_component_utils(sync_fifo_test)

  sync_fifo_env     my_env;
  sync_fifo_seq     my_seq;
  virtual sync_fifo_if sync_fifo_vif;

  function new(string name = "sync_fifo_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(virtual sync_fifo_if)::get(this, "", "vif", sync_fifo_vif))
      `uvm_fatal("NO_VIF", "virtual interface not found");

    uvm_config_db#(virtual sync_fifo_if)::set(this, "my_env", "vif", sync_fifo_vif);

    my_env = sync_fifo_env::type_id::create("my_env", this);
  endfunction

  task run_phase(uvm_phase phase);
    string test_type;
    phase.raise_objection(this);

    if (!$value$plusargs("UVM_TESTTYPE=%s", test_type))
      test_type = "default";

    case (test_type)
      "default": begin
        `uvm_info("TEST", "Running default sequence", UVM_MEDIUM)
        my_seq = sync_fifo_seq::type_id::create("my_seq");
        my_seq.start(my_env.agt.sqr);
      end

      default: begin
        `uvm_fatal("TEST", $sformatf("Unknown test type: %s", test_type))
      end
    endcase

    phase.drop_objection(this);
  endtask

endclass