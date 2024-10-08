// import uvm_pkg::*;
// `include "uvm_macros.svh"
class apb_base_test extends uvm_test;
  
  `uvm_component_utils(apb_base_test) // registering in hte factory
  
  apb_env tenv;
  apb_sequence tseq;
  virtual dut_if vif;
  
  function new(string name , uvm_component parent);
    super.new(name,null);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    $display("uvm_test build phase");
    
    tenv= apb_env::type_id::create("tenv",this);
    if(!uvm_config_db#(virtual dut_if)::get(this,"","vif",vif))
      `uvm_fatal("Build_phase","NO vif specified for this instance")
    uvm_config_db#(virtual dut_if)::set(this,"*","vif",vif);
  endfunction
  
  task run_phase(uvm_phase phase);
    tseq= apb_sequence::type_id::create("tseq",this);
    phase.raise_objection( this, "Starting apb_base_seqin main phase" );
    $display("Starting sequence tseq run_phase",$time);
    tseq.start(tenv.ag.seq);
     phase.drop_objection( this , "Finished apb_seq in main phase" );
    #1000ns;
  endtask
endclass
