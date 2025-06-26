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
  
  task loadIR(int size,bit [IR_SIZE-1:0] data, output bit [IR_SIZE-1:0] data_tdo);
    bit [IR_SIZE-1:0] data_out;
    // 1. move to shift_IR - tms : 11000
    bit [4:0] tms_to_shift_ir = 5'b11000;
    foreach (tms_to_shift_ir[i]) begin
      vif.TMS <= tms_to_shift_ir[i];
      vif.TDI <=0;
      @(posedge vif.TCK);
    end

    // 2. shift in data lsb first
    for (int i =0; i<size;i++) begin
      vif.TDI <= data[i];
      vif.TMS <= (i == size-1) ? 1:0;
      @(posedge vif.TCK);
      data_out[i] = vif.TDO;
    end

    // 3. EXIT_IR to update_IR (TMS =1 then 0)
    vif.TMS <= 1;
    vif.TDI <= 0;
    @(posedge vif.TCK);
    vif.TMS <= 0;
    @(posedge vif.TCK);
    data_tdo = data_out;
  endtask

  task loadDR(int size,bit[DR_SIZE-1:0] data, output bit[DR_SIZE-1:0] data_tdo);
    bit [DR_SIZE-1:0] data_out;

    // 1. move to shiftDR : tms : 100
    bit[2:0] tms_to_shift_dr = 3'b100;
    foreach (tms_to_shift_dr[i]) begin
      vif.TMS<=tms_to_shift_dr[i];
      vif.TDO <=0;
      @(posedge vif.TCK);
    end

    // 2. shift in data to dr
    for (int i=0; i<size; i++) begin
      vif.TDI<=data[i];
      vif.TMS<=(i==size-1) ? 1:0;
      @(posedge vif.TCK);
      data_out[i] = vif.TDO;

    end

    // 3. EXIT_DR to update_DR (tms = 1 then 0)
    vif.TMS <= 1;
    vif.TDI <=0;
    @(posedge vif.TCK);
    vif.TMS <=0;
    @(posedge vif.TCK);
    data_tdo = data_out;
    
  endtask

  task sample_tdo(jtag_seq_item seqi);
    seqi.tdo = vif.TDO;
  endtask
endclass
