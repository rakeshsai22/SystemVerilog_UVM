class drv_dff extends uvm_driver#(dff_seq_item);
  
  `uvm_component_utils(drv_dff)
  virtual dff_intf intf
 
  
  function new(string name="drv_dff", uvm_component parent);
    super.new(name,parent)
    `uvm_info("DRIVER class","constructor",UVM_MEDIUM)
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    if(!uvm_config_db#(virtual dff_intf)::get(this,"","vif",intf))
      `uvm_fatal("no intf in driver","virtual intf get failed from config db");
  endfunction
  
  task run_phase(uvm_phase phase);
    forever begin
      `uvm_info("DRIVER Class","run_phase",UVM_MEDIUM)
      
      seq_item_port.get_next_item(tx);
      drive(tx);
      seq_item_port.item_done();
    end
  endtask
  
  task drive(dff_seq_item tx);
    @(posedge intf.clk)
    intf.rst <= tx.rst;
    intf.d <= tx.d;
    intf.q <= tx.q;
    
  endtask
      
endclass