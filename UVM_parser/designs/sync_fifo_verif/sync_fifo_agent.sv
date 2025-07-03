class sync_fifo_agent extends uvm_agent;
  `uvm_component_utils(sync_fifo_agent)

  sync_fifo_driver      drv;
  sync_fifo_monitor     mon;
  sync_fifo_sequencer   sqr;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon = sync_fifo_monitor::type_id::create("mon", this);
    if (get_is_active() == UVM_ACTIVE) begin
      sqr = sync_fifo_sequencer::type_id::create("sqr", this);
      drv = sync_fifo_driver::type_id::create("drv", this);
    end
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (get_is_active() == UVM_ACTIVE) begin
      drv.seq_item_port.connect(sqr.seq_item_export);
    end
  endfunction

endclass