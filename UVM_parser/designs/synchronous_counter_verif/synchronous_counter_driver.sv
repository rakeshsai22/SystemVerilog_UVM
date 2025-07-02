class synchronous_counter_driver extends uvm_driver #(synchronous_counter_seq_item);
  `uvm_component_utils(synchronous_counter_driver)

  virtual synchronous_counter_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual synchronous_counter_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Virtual interface not found")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      synchronous_counter_seq_item req;
      seq_item_port.get_next_item(req);
      vif.clk = req.clk;
      vif.rst_n = req.rst_n;
      vif.up = req.up;
      seq_item_port.item_done();
    end
  endtask
endclass