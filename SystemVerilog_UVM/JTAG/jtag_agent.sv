// import uvm_pkg::*;
// `include "uvm_macros.svh" 

class jtag_agent extends uvm_agent;
    
    // uvm_active_passive_enum is_active = UVM_ACTIVE;
    
  jtag_sqr jseq;
  jtag_drv jdrv;
  jtag_mon jmon;
  virtual dut_if vif;
  
    
    `uvm_component_utils(jtag_agent)
    
    function new(string name="jtag_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      
      jmon = jtag_mon::type_id::create("jmon", this);
      
      if (get_is_active() == UVM_ACTIVE) begin
        jseq = jtag_sqr::type_id::create("jseq", this);
        jdrv = jtag_drv::type_id::create("jdrv", this);
      end
      
      if(!uvm_config_db#(virtual dut_if)::get(this,"","vif",vif)) begin
        `uvm_fatal("Agent: build phase","no vif specified for this agent")
      end
      uvm_config_db#(virtual dut_if)::set(this,"jseq","vif",vif);
      uvm_config_db#(virtual dut_if)::set(this,"jdrv","vif",vif);
      uvm_config_db#(virtual dut_if)::set(this,"jmon","vif",vif);      
    endfunction
    
    virtual function void connect_phase(uvm_phase phase);
//         super.connect_phase(phase);
        if (is_active == UVM_ACTIVE) begin
          jdrv.seq_item_port.connect(jseq.seq_item_export);
        end
    endfunction
    
endclass
