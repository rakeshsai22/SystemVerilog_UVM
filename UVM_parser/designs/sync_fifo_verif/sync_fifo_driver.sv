class sync_fifo_driver extends uvm_driver #(sync_fifo_seq_item);
  `uvm_component_utils(sync_fifo_driver)

  virtual sync_fifo_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual sync_fifo_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "Virtual interface not found")
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      sync_fifo_seq_item req;
      seq_item_port.get_next_item(req);
      vif.rstn = req.rstn;
      vif.clk = req.clk;
      vif.wr_en = req.wr_en;
      vif.rd_en = req.rd_en;
      vif.din = req.din;
      seq_item_port.item_done();
    end
  endtask
endclass