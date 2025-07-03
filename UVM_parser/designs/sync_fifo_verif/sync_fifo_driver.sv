class sync_fifo_driver extends uvm_driver #(sync_fifo_seq_item);
  `uvm_component_utils(sync_fifo_driver)

  virtual sync_fifo_if sync_fifo_vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual sync_fifo_if)::get(this, "", "vif", sync_fifo_vif))
      `uvm_fatal("NOVIF", "Virtual interface not found")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      sync_fifo_seq_item sync_fifo_item;
      seq_item_port.get_next_item(sync_fifo_item);
      sync_fifo_vif.rstn = sync_fifo_item.rstn;
      sync_fifo_vif.clk = sync_fifo_item.clk;
      sync_fifo_vif.wr_en = sync_fifo_item.wr_en;
      sync_fifo_vif.rd_en = sync_fifo_item.rd_en;
      sync_fifo_vif.din = sync_fifo_item.din;
      seq_item_port.item_done();
    end
  endtask
endclass