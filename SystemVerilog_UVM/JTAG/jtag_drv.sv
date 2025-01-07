// import uvm_pkg::*;
// `include "uvm_macros.svh"

class jtag_drv extends uvm_driver#(jtag_seq_item);
  `uvm_component_utils(jtag_drv)
    
  virtual dut_if vif;

  function new(string name, uvm_component parent = null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual dut_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal(get_type_name(), "Did not get handle to vif")
    end
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      jtag_seq_item seq;
      `uvm_info(get_type_name(), $sformatf("waiting for data from sequencer"), UVM_MEDIUM)
      seq_item_port.get_next_item(seq);
      drive_signals(seq);
      seq_item_port.item_done();
    end
  endtask
  
  virtual task drive_signals(jtag_seq_item seq);
    if (seq.data_type == "INSTRUCTION") begin
      // If the sequence is an instruction, load IR
      loadIR(seq.data.size(), seq.data, seq.data_tdo);
    end else if (seq.data_type == "DATA") begin
      // If the sequence is data, load DR
      loadDR(seq.data.size(), seq.data, seq.data_tdo);
    end
  endtask
  
  task loadIR( vif.IR_SIZE, bit [IR_SIZE-1:0] data, output bit [IR_SIZE-1:0] data_tdo);
    bit [vif.IR_SIZE-1:0] data_out;
    
    // Apply TMS sequence to enter Shift-IR state
    vif.TMS = 0;
    repeat(2) @(posedge vif.TCK);
    vif.TMS = 1;
    repeat(2) @(posedge vif.TCK);
    
    // Shift in data
    foreach(data[i]) begin
      vif.TDI = data[i];
      @(posedge vif.TCK);
      data_out[vif.IR_SIZE-i-1] = vif.TDO;
    end
    
    // Exit Shift-IR state
    vif.TMS = 0;
    @(posedge vif.TCK);
    vif.TMS = 1;
    @(posedge vif.TCK);

    data_tdo = data_out;
  endtask
  
  task loadDR(int DR_SIZE, bit [DR_SIZE-1:0] data, output bit [DR_SIZE-1:0] data_tdo);
    bit [vif.DR_SIZE-1:0] data_out;
    
    // Apply TMS sequence to enter Shift-DR state
    vif.TMS = 0;
    @(posedge vif.TCK);
    vif.TMS = 1;
    repeat(2) @(posedge vif.TCK);
    
    // Shift in data
    foreach(data[i]) begin
      vif.TDI = data[i];
      @(posedge vif.TCK);
      data_out[vif.DR_SIZE-i-1] = vif.TDO;
    end
    
    // Exit Shift-DR state
    vif.TMS = 0;
    @(posedge vif.TCK);
    vif.TMS = 1;
    @(posedge vif.TCK);

    data_tdo = data_out;
  endtask
  
  task sample_tdo(jtag_seq_item seqi);
    seqi.tdo = vif.TDO;
  endtask
endclass
