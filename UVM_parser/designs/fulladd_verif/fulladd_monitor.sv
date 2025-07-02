class fulladd_monitor extends uvm_component;
  `uvm_component_utils(fulladd_monitor)

  virtual fulladd_if fulladd_vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual fulladd_if)::get(this, "", "vif", fulladd_vif))
      `uvm_fatal("NOVIF", "Virtual interface not found")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      @(posedge vif.clk);
      $display("[MONITOR] Time=%0t c_out=%0h sum=%0h", $time, fulladd_vif.c_out, fulladd_vif.sum);
    end
  endtask
endclass