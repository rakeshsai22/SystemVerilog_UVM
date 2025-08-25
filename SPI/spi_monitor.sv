class spi_monitor extends uvm_monitor;
  
  `uvm_component_utils(spi_monitor)
  
  virtual spi_if vif;
  uvm_analysis_port #(spi_seq_item) analysis_port;
  
  function new(string name = "spi_monitor", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual spi_if)::get(this, "", "vif", vif))
      `uvm_fatal("SPI_MONITOR", "Virtual interface not found")
    analysis_port = new("analysis_port", this);
  endfunction
  
  task run_phase(uvm_phase phase);
    spi_seq_item trans;
    
    forever begin
      // Wait for chip select to be asserted
      @(negedge vif.cs_n);
      
      // Create new transaction
      trans = spi_seq_item::type_id::create("trans");
      
      // Monitor the transaction
      monitor_transaction(trans);
      
      // Send transaction to analysis port
      analysis_port.write(trans);
      
      `uvm_info("SPI_MONITOR", $sformatf("Monitored transaction: %s", trans.convert2string()), UVM_MEDIUM)
    end
  endtask
  
  task monitor_transaction(spi_seq_item trans);
    bit [7:0] mosi_data = 8'h00;
    bit [7:0] miso_data = 8'h00;
    int i;
    bit data_detected = 0;
    
    // Wait for first clock edge after CS assertion
    @(posedge vif.sclk);
    
    // Capture 8 bits of data
    for (i = 7; i >= 0; i--) begin
      if (!vif.cs_n) begin  // Only capture if CS is still active
        mosi_data[i] = vif.mosi;
        miso_data[i] = vif.miso;
        data_detected = 1;
        @(posedge vif.sclk);
      end else begin
        break;  // CS deasserted early
      end
    end
    
    // Determine operation type based on observed signals
    if (data_detected) begin
      if (mosi_data != 8'h00) begin
        if (miso_data != 8'h00) begin
          trans.operation = trans.SPI_WRITE_READ;
        end else begin
          trans.operation = trans.SPI_WRITE;
        end
      end else begin
        trans.operation = trans.SPI_READ;
      end
      
      trans.data = mosi_data;
      trans.received_data = miso_data;
    end
    
    // Wait for CS to be deasserted
    @(posedge vif.cs_n);
  endtask
  
endclass