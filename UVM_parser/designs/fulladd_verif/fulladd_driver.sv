class fulladd_driver extends uvm_driver #(fulladd_seq_item);
  `uvm_component_utils(fulladd_driver)

  virtual fulladd_if fulladd_vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual fulladd_if)::get(this, "", "vif", fulladd_vif))
      `uvm_fatal("NOVIF", "Virtual interface not found")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      fulladd_seq_item fulladd_item;
      seq_item_port.get_next_item(fulladd_item);
      fulladd_vif.a = fulladd_item.a;
      fulladd_vif.b = fulladd_item.b;
      fulladd_vif.c_in = fulladd_item.c_in;
      seq_item_port.item_done();
    end
  endtask
endclass