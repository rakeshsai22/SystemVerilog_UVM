class spi_seq_item extends uvm_sequence_item;
  
  `uvm_object_utils(spi_seq_item)
  
  // SPI transaction fields
  rand bit [7:0] data;          // 8-bit data to transmit
  bit [7:0] received_data;      // Data received during transaction
  rand bit [3:0] delay_cycles;  // Number of clock cycles to wait
  
  typedef enum {SPI_WRITE, SPI_READ, SPI_WRITE_READ} spi_operation_t;
  rand spi_operation_t operation;
  
  // Constraints
  constraint data_c {
    data inside {[8'h00:8'hFF]};
  }
  
  constraint delay_c {
    delay_cycles inside {[0:15]};
  }
  
  constraint operation_c {
    operation inside {SPI_WRITE, SPI_READ, SPI_WRITE_READ};
  }
  
  function new(string name = "spi_seq_item");
    super.new(name);
  endfunction
  
  // Copy function for cloning transactions
  function void do_copy(uvm_object rhs);
    spi_seq_item item;
    if (!$cast(item, rhs))
      `uvm_fatal("SPI_SEQ_ITEM", "Cast failed in do_copy")
    super.do_copy(rhs);
    this.data = item.data;
    this.received_data = item.received_data;
    this.delay_cycles = item.delay_cycles;
    this.operation = item.operation;
  endfunction
  
  // Convert to string for printing
  function string convert2string();
    string s;
    s = $sformatf("Operation: %s, Data: 0x%02h, Received: 0x%02h, Delay: %0d", 
                  operation.name(), data, received_data, delay_cycles);
    return s;
  endfunction
  
endclass