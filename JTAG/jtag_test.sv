// import uvm_pkg::*;
// `include "uvm_macros.svh"
// `include "jtag_pkg.svh"


class base_test extends uvm_test;
    `uvm_component_utils(base_test)

    function new(string name = "base_test", uvm_component parent = null);
      super.new(name, parent);
    endfunction
    
    jtag_env env;
    // jtag_seq seq;
    jtag_ir_write_seq seq;
    virtual dut_if vif;


    function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      $display("uvm_test build phase");
      env = jtag_env::type_id::create("env", this);
      
      if(!uvm_config_db#(virtual dut_if)::get(this,"","vif",vif))
        `uvm_fatal("JTAG_TEST", "Virtual interface is not set")
        uvm_config_db#(virtual dut_if)::set(this,"*","vif",vif);
//         uvm_config_db#(virtual dut_if)::set(this,"env.agt.*","dut_vif",vif);
      
        endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection( this, "Starting jtag_ir_write_seq" );
    seq = jtag_ir_write_seq::type_id::create("seq");
    seq.instr = 4'b0010; //IDCODE -- testing
    seq.start(env.jagt.sqr);
    phase.drop_objection( this , "Finished jtag_ir_write_seq" );
  endtask
  


endclass