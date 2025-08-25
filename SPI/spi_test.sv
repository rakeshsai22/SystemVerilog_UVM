class spi_base_test extends uvm_test;
  
  `uvm_component_utils(spi_base_test)
  
  spi_env env;
  virtual spi_if vif;
  
  function new(string name = "spi_base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Create environment
    env = spi_env::type_id::create("env", this);
    
    // Get virtual interface from config database
    if (!uvm_config_db#(virtual spi_if)::get(this, "", "vif", vif))
      `uvm_fatal("SPI_TEST", "Virtual interface not found")
    
    // Set virtual interface for all components
    uvm_config_db#(virtual spi_if)::set(this, "*", "vif", vif);
    
    `uvm_info("SPI_TEST", "SPI test build phase completed", UVM_MEDIUM)
  endfunction
  
  task run_phase(uvm_phase phase);
    spi_base_sequence seq;
    
    phase.raise_objection(this, "Starting SPI base test");
    
    seq = spi_base_sequence::type_id::create("seq");
    seq.start(env.agent.sequencer);
    
    // Wait some time for transactions to complete
    #1000ns;
    
    phase.drop_objection(this, "SPI base test completed");
  endtask
  
endclass

// Test with only write operations
class spi_write_test extends spi_base_test;
  
  `uvm_component_utils(spi_write_test)
  
  function new(string name = "spi_write_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  task run_phase(uvm_phase phase);
    spi_write_sequence seq;
    
    phase.raise_objection(this, "Starting SPI write test");
    
    seq = spi_write_sequence::type_id::create("seq");
    seq.start(env.agent.sequencer);
    
    #1000ns;
    
    phase.drop_objection(this, "SPI write test completed");
  endtask
  
endclass

// Test with only read operations
class spi_read_test extends spi_base_test;
  
  `uvm_component_utils(spi_read_test)
  
  function new(string name = "spi_read_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  task run_phase(uvm_phase phase);
    spi_read_sequence seq;
    
    phase.raise_objection(this, "Starting SPI read test");
    
    seq = spi_read_sequence::type_id::create("seq");
    seq.start(env.agent.sequencer);
    
    #1000ns;
    
    phase.drop_objection(this, "SPI read test completed");
  endtask
  
endclass