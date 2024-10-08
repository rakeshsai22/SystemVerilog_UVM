import uvm_pkg::*;
`include "uvm_macros.svh"
class apb_monitor extends uvm_monitor;
  
  virtual dut_if vif;
  apb_seq_item req;
  uvm_analysis_port#(apb_seq_item) apb_ap;

  `uvm_component_utils(apb_monitor)
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
    apb_ap = new("apb_ap",this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dut_if)::get(this,"","vif",vif)) begin
      `uvm_error("build_phase","No vif specified for monitor")
    end
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      do begin 
        @(vif.pclk);
      end
      while (this.vif.mon_clk.psel !==1'b1 || this.vif.mon_clk.penable !==1'b0);
      req = apb_seq_item::type_id::create("req",this);
      req.pwrite = (this.vif.mon_clk.pwrite) ? apb_seq_item::WRITE : apb_seq_item::READ;
      req.addr = this.vif.mon_clk.paddr;
      
      @(this.vif.mon_clk);
      if(this.vif.mon_clk.penable!=1'b1) begin
        `uvm_error("Build Phase","SETUP not followed by Enable signal");
      end
      if(req.pwrite == apb_seq_item::READ) begin
        req.data = this.vif.mon_clk.prdata;
      end
      else if (req.pwrite == apb_seq_item::WRITE) begin
        req.data = this.vif.mon_clk.pwdata;
      end
      
      uvm_report_info("Monitor",$psprintf("Transaction recieved by APB monitor",req.convert2string()));
      apb_ap.write(req);
    end
  endtask
  
endclass
