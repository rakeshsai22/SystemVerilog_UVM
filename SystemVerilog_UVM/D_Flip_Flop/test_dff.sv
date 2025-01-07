class dff_test extends uvm_test;
  
  `uvm_component_utils(dff_test)
//   registering the class in the factory
//   since test class is a uvm_component
  
  dff_env env;
  
  function new(string name="dff_test", uvm_component parent);
    super.new(name,parent);
    `uvm_info("Test class","constructor",UVM_MEDIUM)
    
  endfunction
  
//   build_phase
  function void build_phase(uvm_phase phase);
    super.buld_phase(phase);
//     create lower components
    env = dff_env::type_id::create("env",this);
    seq = dff_sequence::type_id::create("seq",this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("test class","connect phase",UVM_MEDIUM)
  endfunction
  
  //   end of elaboration phase - gives uvm tree
  virtual function void end_of_elaboration();
    `uvm_info("Test class","eloboration phase",UVM_MEDIUM)
    print();
  endfunction
  
  endfunction
  task run_phase(uvm_phase phase);
    `uvm_info("test class","run_phase",UVM_MEDIUM)
    phase.raise_objection(this); // stay in run_phase untill the drop objection
    seq.start(env.agent.seqr); // starting the sequences from sequencer-> sequence
    phase.drop_objection(this);
    
    endtask
  
endclass
  