class synchronous_counter_driver extends uvm_driver #(synchronous_counter_seq_item);
  `uvm_component_utils(synchronous_counter_driver)

  virtual synchronous_counter_if synchronous_counter_vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual synchronous_counter_if)::get(this, "", "vif", synchronous_counter_vif))
      `uvm_fatal("NOVIF", "Virtual interface not found")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      synchronous_counter_seq_item synchronous_counter_item;
      seq_item_port.get_next_item(synchronous_counter_item);
      synchronous_counter_vif.clk = synchronous_counter_item.clk;
      synchronous_counter_vif.rst_n = synchronous_counter_item.rst_n;
      synchronous_counter_vif.up = synchronous_counter_item.up;
      seq_item_port.item_done();
    end
  endtask
endclass