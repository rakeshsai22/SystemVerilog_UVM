class reg_sample_configReg extends uvm_reg;
   // 0: uart skewection disabled
    // 1: uart skewection enabled
    rand uvm_reg_field uart_enable;
    // 0: Defective pixel skewection disabled
    // 1: Defective pixel skewection enabled
    rand uvm_reg_field i2c_enable;
    // 0: bad status disabled
    // 1: bad status enabled
    rand uvm_reg_field dma_enable;
    // 0: Compression in uartC disabled
    // 1: Compression in uartC enabled
    rand uvm_reg_field uartc_compress_enable;
    // 0: Black level skewection in uartC disabled
    // 1: Black level skewection in uartC enabled
    rand uvm_reg_field uartc_blc_enable;   
    
     `uvm_object_utils(reg_sample_configReg)
  
   function new(string name = "");
        super.new(name, 8, UVM_NO_COVERAGE);
    endfunction: new
  
  virtual function void build();
    // 0: uart skewection disabled
    // 1: uart skewection enabled
    uart_enable = uvm_reg_field::type_id::create("uart_enable");
        uart_enable.configure(.parent(this), .size(1), .lsb_pos(0),
                             .access("RW"), .volatile(0), .reset(1'h1), .has_reset(1),
                             .is_rand(1), .individually_accessible(1));

        // 0: Defective pixel skewection disabled
        // 1: Defective pixel skewection enabled
        i2c_enable = uvm_reg_field::type_id::create("i2c_enable");
        i2c_enable.configure(.parent(this), .size(1), .lsb_pos(1),
                             .access("RW"), .volatile(0), .reset(1'h1), .has_reset(1),
                             .is_rand(1), .individually_accessible(1));

        // 0: bad status disabled
        // 1: bad status enabled
        dma_enable = uvm_reg_field::type_id::create("dma_enable");
        dma_enable.configure(.parent(this), .size(1), .lsb_pos(2),
                             .access("RW"), .volatile(0), .reset(1'h1), .has_reset(1),
                             .is_rand(1), .individually_accessible(1));

        // 0: Compression in uartC disabled
        // 1: Compression in uartC enabled
        uartc_compress_enable = uvm_reg_field::type_id::create("uartc_compress_enable");
        uartc_compress_enable.configure(.parent(this), .size(1), .lsb_pos(3),
                                       .access("RW"), .volatile(0), .reset(1'h1), .has_reset(1),
                                       .is_rand(1), .individually_accessible(1));

        // 0: Black level skewection in uartC disabled
        // 1: Black level skewection in uartC enabled
        uartc_blc_enable = uvm_reg_field::type_id::create("uartc_blc_enable");
        uartc_blc_enable.configure(.parent(this), .size(1), .lsb_pos(4),
                                  .access("RW"), .volatile(0), .reset(1'h1), .has_reset(1),
                                  .is_rand(1), .individually_accessible(1));

  endfunction
endclass : reg_sample_configReg
  //------------------------------------------------------------------------------
// Class: reg_uartc_addr_offset_9_8Reg
//------------------------------------------------------------------------------
class reg_uartc_addr_offset_9_8Reg extends uvm_reg;
    // Additional digital skewection offset in linear domain
    rand uvm_reg_field uartc_addr_offset_9_8;
  `uvm_object_utils(reg_uartc_addr_offset_9_8Reg)
    // Function: new
    function new(string name = "");
        super.new(name, 8, UVM_NO_COVERAGE);
    endfunction: new

    // Function: build
    virtual function void build();
        // Additional digital skewection offset in linear domain
        uartc_addr_offset_9_8 = new("uartc_addr_offset_9_8");
        uartc_addr_offset_9_8.configure(.parent(this), .size(2), .lsb_pos(0),
                                               .access("RW"), .volatile(0), .reset(2'h0), .has_reset(1),
                                               .is_rand(1), .individually_accessible(1));

    endfunction : build

endclass : reg_uartc_addr_offset_9_8Reg

// Class: reg_uartc_addr_offset_7_0Reg
//------------------------------------------------------------------------------
class reg_uartc_addr_offset_7_0Reg extends uvm_reg;
    // Additional digital skewection offset in linear domain
    rand uvm_reg_field uartc_addr_offset_7_0;
     `uvm_object_utils(reg_uartc_addr_offset_7_0Reg)
    // Function: new
    function new(string name = "");
        super.new(name, 8, UVM_NO_COVERAGE);
    endfunction: new

    // Function: build
    virtual function void build();
        // Additional digital skewection offset in linear domain
        uartc_addr_offset_7_0 = new("uartc_addr_offset_7_0");
        uartc_addr_offset_7_0.configure(.parent(this), .size(8), .lsb_pos(0),
                                               .access("RW"), .volatile(0), .reset(8'h00), .has_reset(1),
                                               .is_rand(1), .individually_accessible(1));

    endfunction : build

endclass : reg_uartc_addr_offset_7_0Reg

// Class: reg_i2c_configReg
//------------------------------------------------------------------------------
class reg_i2c_configReg extends uvm_reg;
    // 0: Static done disabled
    // 1: Static done enabled
    rand uvm_reg_field st_done_enable;
    // 0: Dynamic done disabled
    // 1: Dynamic done enabled
    rand uvm_reg_field dyn_done_enable;
    // 0: Dynamic skewection disabled
    // 1: Dynamic skewection enabled
    rand uvm_reg_field dyn_skew_enable;
    // 0: Directional skewection disabled
    // 1: Directional skewection enabled
    rand uvm_reg_field dir_skew_enable;
    // 0: Replace with max/min of 3x3 neighbors
    // 1: Replace with average value of 3x3 neighbors
    rand uvm_reg_field avg_skew;
    // 0: skewect to (max+threshold or min-threshold) of 3x3 neighbors
    // 1: skewect to max/min of 3x3 neighbors
    rand uvm_reg_field soft_skew;
    // 0: 3x3 timing
    // 1: 5x5 timing (Default)
    rand uvm_reg_field det_timing_size;
    // 0: 3x3 timing
    // 1: 5x5 timing (Default)
    rand uvm_reg_field contr_timing_size;

    `uvm_object_utils(reg_i2c_configReg)
    // Function: new
    function new(string name = "i2c_config");
       super.new(name, 8, UVM_NO_COVERAGE); 
    endfunction: new

    // Function: build
    virtual function void build();
        // 0: Static done disabled
        // 1: Static done enabled
        st_done_enable = new("st_done_enable");
        st_done_enable.configure(.parent(this), .size(1), .lsb_pos(0),
                                      .access("RW"), .volatile(0), .reset(1'h1), .has_reset(1),
                                      .is_rand(1), .individually_accessible(1));

        // 0: Dynamic done disabled
        // 1: Dynamic done enabled
        dyn_done_enable = new("dyn_done_enable");
        dyn_done_enable.configure(.parent(this), .size(1), .lsb_pos(1),
                                       .access("RW"), .volatile(0), .reset(1'h1), .has_reset(1),
                                       .is_rand(1), .individually_accessible(1));

        // 0: Dynamic skewection disabled
        // 1: Dynamic skewection enabled
        dyn_skew_enable = new("dyn_skew_enable");
        dyn_skew_enable.configure(.parent(this), .size(1), .lsb_pos(2),
                                  .access("RW"), .volatile(0), .reset(1'h1), .has_reset(1),
                                  .is_rand(1), .individually_accessible(1));

        // 0: Directional skewection disabled
        // 1: Directional skewection enabled
        dir_skew_enable = new("dir_skew_enable");
        dir_skew_enable.configure(.parent(this), .size(1), .lsb_pos(3),
                                  .access("RW"), .volatile(0), .reset(1'h0), .has_reset(1),
                                  .is_rand(1), .individually_accessible(1));

        // 0: Replace with max/min of 3x3 neighbors
        // 1: Replace with average value of 3x3 neighbors
        avg_skew = new("avg_skew");
        avg_skew.configure(.parent(this), .size(1), .lsb_pos(4),
                           .access("RW"), .volatile(0), .reset(1'h1), .has_reset(1),
                           .is_rand(1), .individually_accessible(1));

        // 0: skewect to (max+threshold or min-threshold) of 3x3 neighbors
        // 1: skewect to max/min of 3x3 neighbors
        soft_skew = new("soft_skew");
        soft_skew.configure(.parent(this), .size(1), .lsb_pos(5),
                            .access("RW"), .volatile(0), .reset(1'h0), .has_reset(1),
                            .is_rand(1), .individually_accessible(1));

        // 0: 3x3 timing
        // 1: 5x5 timing (Default)
        det_timing_size = new("det_timing_size");
        det_timing_size.configure(.parent(this), .size(1), .lsb_pos(6),
                                  .access("RW"), .volatile(0), .reset(1'h1), .has_reset(1),
                                  .is_rand(1), .individually_accessible(1));

        // 0: 3x3 timing
        // 1: 5x5 timing (Default)
        contr_timing_size = new("contr_timing_size");
        contr_timing_size.configure(.parent(this), .size(1), .lsb_pos(7),
                                    .access("RW"), .volatile(0), .reset(1'h1), .has_reset(1),
                                    .is_rand(1), .individually_accessible(1));

    endfunction : build

endclass : reg_i2c_configReg

// Class: reg_i2c_directional_threshold_9_8Reg
// Direction skewection threshold
//------------------------------------------------------------------------------
class reg_i2c_directional_threshold_9_8Reg extends uvm_reg;
    rand uvm_reg_field dir_skew_threshold_9_8;
   
     `uvm_object_utils(reg_i2c_directional_threshold_9_8Reg)
    // Function: new
    function new(string name = "i2c_directional_threshold_9_8");
      super.new(name, 8, UVM_NO_COVERAGE);
    endfunction: new
  

    // Function: build
    virtual function void build();
        dir_skew_threshold_9_8 = new("dir_skew_threshold_9_8");
        dir_skew_threshold_9_8.configure(.parent(this), .size(2), .lsb_pos(0),
                                         .access("RW"), .volatile(0), .reset(2'h0), .has_reset(1),
                                         .is_rand(1), .individually_accessible(1));

    endfunction : build

endclass : reg_i2c_directional_threshold_9_8Reg

// Class: reg_dma_configReg
//------------------------------------------------------------------------------
class reg_dma_configReg extends uvm_reg;
    // Dark offset mode 
    // 0: No dark offset
    // 1: Static dark offset
    // 2: Dynamic dark offset (Default)
    // 3: Static and dynamic offset
// 
    // Note: Dynamic dark offset should be disabled if either PD or FD OB outlier threshold is set to zero.
    rand uvm_reg_field loopback_mode;
    // 0: 512 OB pixels (2x OB rows) used for averaging
    // 1: 1024 OB pixels (4x OB rows) used for averaging (Default)
    rand uvm_reg_field num_ob_rows;

     `uvm_object_utils(reg_dma_configReg)
    // Function: new
    function new(string name = "dma_config");
      super.new(name, 8, UVM_NO_COVERAGE);
    endfunction: new

    // Function: build
    virtual function void build();
        // Dark offset mode 
        // 0: No dark offset
        // 1: Static dark offset
        // 2: Dynamic dark offset (Default)
        // 3: Static and dynamic offset
// 
        // Note: Dynamic dark offset should be disabled if either PD or FD OB outlier threshold is set to zero.
        loopback_mode = new("loopback_mode");
        loopback_mode.configure(.parent(this), .size(2), .lsb_pos(0),
                                   .access("RW"), .volatile(0), .reset(2'h2), .has_reset(1),
                                   .is_rand(1), .individually_accessible(1));

        // 0: 512 OB pixels (2x OB rows) used for averaging
        // 1: 1024 OB pixels (4x OB rows) used for averaging (Default)
        num_ob_rows = new("num_ob_rows");
        num_ob_rows.configure(.parent(this), .size(1), .lsb_pos(2),
                              .access("RW"), .volatile(0), .reset(1'h1), .has_reset(1),
                              .is_rand(1), .individually_accessible(1));

    endfunction : build

endclass : reg_dma_configReg

// Class: reg_dma_pass_gate_9_8Reg
// PD OB outlier threshold [9:8]
//------------------------------------------------------------------------------
class reg_dma_pass_gate_9_8Reg extends uvm_reg;
    rand uvm_reg_field dma_pass_gate_9_8;

    `uvm_object_utils(reg_dma_pass_gate_9_8Reg)
    // Function: new
    function new(string name = "dma_pass_gate_9_8");
      super.new(name, 8, UVM_NO_COVERAGE);
    endfunction: new

    // Function: build
    virtual function void build();
        dma_pass_gate_9_8 = new("dma_pass_gate_9_8");
        dma_pass_gate_9_8.configure(.parent(this), .size(2), .lsb_pos(0),
                                               .access("RW"), .volatile(0), .reset(2'h3), .has_reset(1),
                                               .is_rand(1), .individually_accessible(1));

    endfunction : build

endclass : reg_dma_pass_gate_9_8Reg

// Class: reg_dma_pass_gate_7_0Reg
// PD OB outlier threshold [7:0]
//------------------------------------------------------------------------------
class reg_dma_pass_gate_7_0Reg extends uvm_reg;
    rand uvm_reg_field dma_pass_gate_7_0;

    `uvm_object_utils(reg_dma_pass_gate_7_0Reg)
    // Function: new
    function new(string name = "dma_pass_gate_7_0");
       super.new(name, 8, UVM_NO_COVERAGE);
    endfunction: new

    // Function: build
    virtual function void build();
        dma_pass_gate_7_0 = new("dma_pass_gate_7_0");
        dma_pass_gate_7_0.configure(.parent(this), .size(8), .lsb_pos(0),
                                               .access("RW"), .volatile(0), .reset(8'hff), .has_reset(1),
                                               .is_rand(1), .individually_accessible(1));

    endfunction : build

endclass : reg_dma_pass_gate_7_0Reg

// Class: reg_pass_avgReg
// dma PD dark average[7:0], signed 2's complement format
//------------------------------------------------------------------------------
class reg_pass_avgReg extends uvm_reg;
    rand uvm_reg_field pass_avg;
   
  `uvm_object_utils(reg_pass_avgReg)
    // Function: new
    function new(string name = "pass_avg");
        super.new(name, 8, UVM_NO_COVERAGE);
    endfunction: new

    // Function: build
    virtual function void build();
        pass_avg = new("pass_avg");
        pass_avg.configure(.parent(this), .size(8), .lsb_pos(0),
                                  .access("RO"), .volatile(0), .reset(8'h00), .has_reset(1),
                                  .is_rand(1), .individually_accessible(1));

    endfunction : build

endclass : reg_pass_avgReg

//------------------------------------------------------------------------------
// Class: reg_fail_avgReg
// dma PD dark average[7:0], signed 2's complement format
//------------------------------------------------------------------------------
class reg_fail_avgReg extends uvm_reg;
    rand uvm_reg_field fail_avg;

    `uvm_object_utils(reg_fail_avgReg)
    // Function: new
    function new(string name = "fail_avg");
        super.new(name, 8, UVM_NO_COVERAGE);
    endfunction: new

    // Function: build
    virtual function void build();
        fail_avg = new("fail_avg");
        fail_avg.configure(.parent(this), .size(8), .lsb_pos(0),
                                  .access("RO"), .volatile(0), .reset(8'h00), .has_reset(1),
                                  .is_rand(1), .individually_accessible(1));

    endfunction : build

endclass : reg_fail_avgReg

class reg_sampleblkRegBlk extends uvm_reg_block;
  `uvm_object_utils(reg_sampleblkRegBlk)
    rand reg_sample_configReg sample_config;
    rand reg_uartc_addr_offset_9_8Reg uartc_addr_offset_9_8;
    rand reg_i2c_configReg i2c_config;
    rand reg_uartc_addr_offset_7_0Reg uartc_addr_offset_7_0;
    rand reg_i2c_directional_threshold_9_8Reg i2c_directional_threshold_9_8;
   // rand reg_i2c_directional_threshold_7_0Reg i2c_directional_threshold_7_0;
    rand reg_dma_configReg dma_config;
    rand reg_dma_pass_gate_9_8Reg dma_pass_gate_9_8;
    rand reg_dma_pass_gate_7_0Reg dma_pass_gate_7_0;
    rand reg_pass_avgReg pass_avg;
    rand reg_fail_avgReg fail_avg;
 // reg_uartc_addr_offset_7_0Reg ;
 // reg_i2c_configReg ;
    uvm_reg_map reg_map;
  
  // Function: new
    function new(string name = "reg_sampleblkRegBlk");
      super.new(name);
    endfunction: new
 
  //build
  virtual function void build();
    sample_config = reg_sample_configReg::type_id::create("sample_config"); 
    sample_config.configure(this,null);
    sample_config.build();
    
    ///
    uartc_addr_offset_9_8 = reg_uartc_addr_offset_9_8Reg::type_id::create("uartc_addr_offset_9_8");
    uartc_addr_offset_9_8.configure(this,null);
    uartc_addr_offset_9_8.build();
    //
    i2c_config = reg_i2c_configReg::type_id::create("i2c_config");
    i2c_config.configure(this,null);
    i2c_config.build();
    //
    uartc_addr_offset_7_0 = reg_uartc_addr_offset_7_0Reg::type_id::create("uartc_addr_offset_7_0");
    uartc_addr_offset_7_0.configure(this,null);
    uartc_addr_offset_7_0.build();
    //
    i2c_directional_threshold_9_8 = reg_i2c_directional_threshold_9_8Reg::type_id::create("i2c_directional_threshold_9_8");
    i2c_directional_threshold_9_8.configure(this,null);
    i2c_directional_threshold_9_8.build();
    //
    dma_config = reg_dma_configReg::type_id::create("dma_config");
    dma_config.configure(this,null);
    dma_config.build();
    //
    dma_pass_gate_9_8 = reg_dma_pass_gate_9_8Reg::type_id::create("dma_pass_gate_9_8");
    dma_pass_gate_9_8.configure(this,null);
    dma_pass_gate_9_8.build();
    //
    dma_pass_gate_7_0 = reg_dma_pass_gate_7_0Reg::type_id::create("dma_pass_gate_7_0");
    dma_pass_gate_7_0.configure(this,null);
    dma_pass_gate_7_0.build();
    //
    pass_avg = reg_pass_avgReg::type_id::create("pass_avg");
    pass_avg.configure(this,null);
    pass_avg.build();
    //
    fail_avg = reg_fail_avgReg::type_id::create("fail_avg");
    fail_avg.configure(this,null);
    fail_avg.build();
    //APB_map = create_map("APB_map", 'h0, 4, UVM_LITTLE_ENDIAN);
    reg_map = create_map("reg_map",'h0,8,UVM_LITTLE_ENDIAN);
    //set_default_map(reg_map); 
    //AHB_map.add_reg(mem_1_offset, 32'h00000000, "RW");
     //default_map.add_reg(reg_intr , 'h0, "RW"); 
   // AHB_map.add_submap(this.spi.default_map, 0);
    
    reg_map.add_reg(sample_config, 'h0,"RW");
    reg_map.add_reg(uartc_addr_offset_9_8,'h08,"RW" );
    reg_map.add_reg(i2c_config, 'h10, "RW" );
    reg_map.add_reg(uartc_addr_offset_7_0, 'h18, "RW");
    reg_map.add_reg(i2c_directional_threshold_9_8,'h20 , "RW" );
    reg_map.add_reg(dma_config , 'h28 , "RW");
    reg_map.add_reg(dma_pass_gate_9_8,'h30 ,"RW" );
    reg_map.add_reg(dma_pass_gate_7_0, 'h38 ,"RW" );
    reg_map.add_reg(pass_avg , 'h40 , "RO");
    reg_map.add_reg(fail_avg , 'h48 , "RO");
    
  endfunction
endclass

class sample_reg_model extends uvm_reg_block;
  rand  reg_sampleblkRegBlk sampleblk;
    uvm_reg_map reg_sample_map;
    `uvm_object_utils(sample_reg_model)      
    
     // Function: new
    function new(string name = "sample_reg_model");
      super.new(name);
    endfunction: new
    
    virtual function build();
      default_map = create_map("reg_sample_map",'h0, 8,UVM_LITTLE_ENDIAN);
      sampleblk = reg_sampleblkRegBlk::type_id::create("sampleblk");
      sampleblk.configure(this);
      sampleblk.build();
      default_map.add_submap(this.sampleblk.default_map,0);
    endfunction
        
endclass