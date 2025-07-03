class synchronous_counter_agent extends uvm_agent;
  `uvm_component_utils(synchronous_counter_agent)

  synchronous_counter_driver      drv;
  synchronous_counter_monitor     mon;
  synchronous_counter_sequencer   sqr;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon = synchronous_counter_monitor::type_id::create("mon", this);
    if (get_is_active() == UVM_ACTIVE) begin
      sqr = synchronous_counter_sequencer::type_id::create("sqr", this);
      drv = synchronous_counter_driver::type_id::create("drv", this);
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (get_is_active() == UVM_ACTIVE) begin
      drv.seq_item_port.connect(sqr.seq_item_export);
    end
  endfunction

endclass