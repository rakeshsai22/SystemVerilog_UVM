class synchronous_counter_monitor extends uvm_component;
  `uvm_component_utils(synchronous_counter_monitor)

  virtual synchronous_counter_if synchronous_counter_vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual synchronous_counter_if)::get(this, "", "vif", synchronous_counter_vif))
      `uvm_fatal("NOVIF", "Virtual interface not found")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      @(posedge synchronous_counter_vif.clk);
      $display("[MONITOR] Time=%0t cnt=%0h", $time, synchronous_counter_vif.cnt);
    end
  endtask
endclass