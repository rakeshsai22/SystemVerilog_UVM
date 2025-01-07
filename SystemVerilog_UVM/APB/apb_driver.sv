// import uvm_pkg::*;
// `include "uvm_macros.svh"
class apb_driver extends uvm_driver#(apb_seq_item);
  
  
//   function apb_seq_item_atomic_gen::new(~);
//   this.addr=0;
//   this.data=0;
//   this.dir=IDLE;
//   endfunction:new
  
    
  `uvm_component_utils(apb_driver)
  virtual dut_if vif;
  
  
  
  function new(string name, uvm_component parent);
    super.new(name,parent);
  endfunction
 
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual dut_if):: get(this,"","vif",vif)) begin
//       * - to include every other 
      `uvm_error("build_phase",{"driver virtual interface is not set"})
    end
  endfunction
  
     
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    this.vif.master_clk.psel<=0;
    this.vif.master_clk.penable<=0;
    
    
    forever begin
      apb_seq_item req;
      @(this.vif.master_clk)
      //       drv getting item from seq_item
      seq_item_port.get_next_item(req);
      //       uvm_info("apb_driver", "Got new item");
      uvm_report_info("APB_DRIVER ", "Got Transaction");
 
//       send_to_dut(req);
      case (req.pwrite) 
        apb_seq_item:: READ : drv_read(req.addr,vif.prdata); 
        apb_seq_item::WRITE: drv_write(req.addr,req.data);
      endcase
//       item done
      seq_item_port.item_done();
    end
    
  endtask
  
  virtual protected task drv_read(input bit [31:0] addr, output logic [31:0] data);
    this.vif.master_clk.paddr<= addr;
    this.vif.master_clk.pwrite <= 0;
    this.vif.master_clk.psel<= 1;
    // enable signal in the next pclk cycle(posedge)
    @ (this.vif.master_clk);
    this.vif.master_clk.penable <= 1;
    // next pclk edge the data is read :: 2 clk cycles
    @ (this.vif.master_clk);
    data = this.vif.master_clk.prdata;
    uvm_report_info("APB_drv_read","Read Op completed");
    this.vif.master_clk.psel <= 0;
    this.vif.master_clk.penable <= 0;
  endtask
  
  virtual protected task drv_write(input bit [31:0]addr, input bit [31:0] data); // sending data and addr so input bit
    this.vif.master_clk.paddr <= addr;
     // writing data
    this.vif.master_clk.pwdata <= data;
    this.vif.master_clk.pwrite <= 1;
    this.vif.master_clk.psel <= 1;
    @ (this.vif.master_clk);
    this.vif.master_clk.penable<=1;
    @ (this.vif.master_clk);
    uvm_report_info("apb_write","Write Op completed");
    this.vif.master_clk.psel <= 0;
    this.vif.master_clk.penable <= 0;
  endtask
  
//   virtual protected task drv_idle();
    
endclass
    
