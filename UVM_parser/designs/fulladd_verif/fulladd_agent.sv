class fulladd_agent extends uvm_agent;
  `uvm_component_utils(fulladd_agent)

  fulladd_driver     fulladd_drv;
  uvm_sequencer #(fulladd_seq_item) fulladd_sqr;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    fulladd_drv = fulladd_driver::type_id::create("fulladd_drv", this);
    fulladd_sqr = uvm_sequencer#(fulladd_seq_item)::type_id::create("fulladd_sqr", this);
  endfunction

  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    fulladd_drv.seq_item_port.connect(fulladd_sqr.seq_item_export);
  endfunction
endclass