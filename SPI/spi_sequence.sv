class spi_base_sequence extends uvm_sequence #(spi_seq_item);
  
  `uvm_object_utils(spi_base_sequence)
  
  function new(string name = "spi_base_sequence");
    super.new(name);
  endfunction
  
  task body();
    spi_seq_item req;
    
    // Generate 10 random SPI transactions
    repeat(10) begin
      req = spi_seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize());
      finish_item(req);
      `uvm_info("SPI_SEQUENCE", $sformatf("Generated transaction: %s", req.convert2string()), UVM_MEDIUM)
    end
  endtask
  
endclass

// Specific sequence for write operations
class spi_write_sequence extends spi_base_sequence;
  
  `uvm_object_utils(spi_write_sequence)
  
  function new(string name = "spi_write_sequence");
    super.new(name);
  endfunction
  
  task body();
    spi_seq_item req;
    
    // Generate 5 write transactions
    repeat(5) begin
      req = spi_seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize() with {operation == req.SPI_WRITE;});
      finish_item(req);
      `uvm_info("SPI_WRITE_SEQ", $sformatf("Generated write transaction: %s", req.convert2string()), UVM_MEDIUM)
    end
  endtask
  
endclass

// Specific sequence for read operations
class spi_read_sequence extends spi_base_sequence;
  
  `uvm_object_utils(spi_read_sequence)
  
  function new(string name = "spi_read_sequence");
    super.new(name);
  endfunction
  
  task body();
    spi_seq_item req;
    
    // Generate 5 read transactions
    repeat(5) begin
      req = spi_seq_item::type_id::create("req");
      start_item(req);
      assert(req.randomize() with {operation == req.SPI_READ;});
      finish_item(req);
      `uvm_info("SPI_READ_SEQ", $sformatf("Generated read transaction: %s", req.convert2string()), UVM_MEDIUM)
    end
  endtask
  
endclass