class sync_fifo_monitor extends uvm_component;
  `uvm_component_utils(sync_fifo_monitor)

  virtual sync_fifo_if sync_fifo_vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    if (!uvm_config_db#(virtual sync_fifo_if)::get(this, "", "vif", sync_fifo_vif))
      `uvm_fatal("NOVIF", "Virtual interface not found")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      @(posedge sync_fifo_vif.clk);
      $display("[MONITOR] Time=%0t dout=%0h empty=%0h full=%0h", $time, sync_fifo_vif.dout, sync_fifo_vif.empty, sync_fifo_vif.full);
    end
  endtask
endclass