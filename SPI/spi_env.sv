class spi_env extends uvm_env;
  
  `uvm_component_utils(spi_env)
  
  spi_agent agent;
  
  function new(string name = "spi_env", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Create the SPI agent
    agent = spi_agent::type_id::create("agent", this);
    
    `uvm_info("SPI_ENV", "SPI environment build phase completed", UVM_MEDIUM)
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SPI_ENV", "SPI environment connect phase completed", UVM_MEDIUM)
  endfunction
  
endclass