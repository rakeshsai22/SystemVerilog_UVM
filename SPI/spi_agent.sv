class spi_agent extends uvm_agent;
  
  `uvm_component_utils(spi_agent)
  
  spi_driver      driver;
  spi_monitor     monitor;
  spi_sequencer   sequencer;
  
  function new(string name = "spi_agent", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    
    // Always create monitor
    monitor = spi_monitor::type_id::create("monitor", this);
    
    // Create driver and sequencer only if agent is active
    if (get_is_active() == UVM_ACTIVE) begin
      sequencer = spi_sequencer::type_id::create("sequencer", this);
      driver = spi_driver::type_id::create("driver", this);
    end
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    
    // Connect driver to sequencer if both exist
    if (get_is_active() == UVM_ACTIVE) begin
      driver.seq_item_port.connect(sequencer.seq_item_export);
    end
  endfunction
  
endclass