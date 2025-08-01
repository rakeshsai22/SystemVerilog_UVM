class fulladd_test extends uvm_test;
  `uvm_component_utils(fulladd_test)

  fulladd_env     fulladd_env;
  fulladd_seq     my_seq;
  virtual fulladd_if fulladd_vif;

  function new(string name = "fulladd_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(virtual fulladd_if)::get(this, "", "vif", fulladd_vif))
      `uvm_fatal("NO_VIF", "virtual interface not found");

    uvm_config_db#(virtual fulladd_if)::set(this, "fulladd_env", "vif", fulladd_vif);

    fulladd_env = fulladd_env::type_id::create("fulladd_env", this);
  endfunction

  task run_phase(uvm_phase phase);
    string test_type;
    phase.raise_objection(this);

    if (!$value$plusargs("UVM_TESTTYPE=%s", test_type))
      test_type = "default";

    case (test_type)
      "default": begin
        `uvm_info("TEST", "Running default sequence", UVM_MEDIUM)
        my_seq = fulladd_seq::type_id::create("my_seq");
        my_seq.start(fulladd_env.fulladd_agt.fulladd_sqr);
      end

      default: begin
        `uvm_fatal("TEST", $sformatf("Unknown test type: %s", test_type))
      end
    endcase

    phase.drop_objection(this);
  endtask

endclass