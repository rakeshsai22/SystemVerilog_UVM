class spi_driver extends uvm_driver #(spi_seq_item);
  
  `uvm_component_utils(spi_driver)
  
  virtual spi_if vif;
  
  function new(string name = "spi_driver", uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual spi_if)::get(this, "", "vif", vif))
      `uvm_fatal("SPI_DRIVER", "Virtual interface not found")
  endfunction
  
  task run_phase(uvm_phase phase);
    spi_seq_item req;
    
    // Initialize signals
    vif.cs_n = 1'b1;
    vif.mosi = 1'b0;
    
    forever begin
      seq_item_port.get_next_item(req);
      drive_transaction(req);
      seq_item_port.item_done();
    end
  endtask
  
  task drive_transaction(spi_seq_item req);
    int i;
    
    `uvm_info("SPI_DRIVER", $sformatf("Driving transaction: %s", req.convert2string()), UVM_MEDIUM)
    
    // Wait for delay cycles
    repeat(req.delay_cycles) @(posedge vif.sclk);
    
    // Assert chip select
    vif.cs_n = 1'b0;
    @(posedge vif.sclk);
    
    // Drive data based on operation type
    case (req.operation)
      req.SPI_WRITE, req.SPI_WRITE_READ: begin
        // Send data bit by bit (MSB first)
        for (i = 7; i >= 0; i--) begin
          vif.mosi = req.data[i];
          @(posedge vif.sclk);
          // If write_read operation, also capture received data
          if (req.operation == req.SPI_WRITE_READ) begin
            req.received_data[i] = vif.miso;
          end
        end
      end
      
      req.SPI_READ: begin
        // For read operation, keep MOSI at 0 and capture MISO
        vif.mosi = 1'b0;
        for (i = 7; i >= 0; i--) begin
          @(posedge vif.sclk);
          req.received_data[i] = vif.miso;
        end
      end
    endcase
    
    // Deassert chip select
    @(posedge vif.sclk);
    vif.cs_n = 1'b1;
    vif.mosi = 1'b0;
    
    `uvm_info("SPI_DRIVER", "Transaction completed", UVM_MEDIUM)
  endtask
  
endclass