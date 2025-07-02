// Code your design here
// ----------------------------------------------------------
// RTL DUT: sample_reg_design
// ----------------------------------------------------------
// Defines a memory-mapped register block with various config 
// registers to be targeted by UVM RAL verification components.
// 
// RAL modeling expectations:
// - Register address offsets must match register model.
// - Reset values should be mirrored in the UVM model.
// - Write access to RW regs, readback from RO/RW regs.
// ----------------------------------------------------------

module sample_reg_design(
  input clk,
  input  rstn,
  input  select,
  input  write,
  input   [7:0]  addr,
  input   [7:0]  wdata,
  output reg [7:0]  rdata);
  
  // -------------------------------------------
  // Register Declarations (8-bit each)
  // -------------------------------------------
  reg [7:0] sample_config;                      // @0x00 RW
  reg [7:0] uartc_addr_offset_9_8;              // @0x08 RW
  reg [7:0] i2c_config;                         // @0x10 RW
  reg [7:0] uartc_addr_offset_7_0;              // @0x18 RW
  reg [7:0] i2c_directional_threshold_9_8;      // @0x20 RW
  reg [7:0] dma_config;                         // @0x28 RW
  reg [7:0] dma_pass_gate_9_8;                  // @0x30 RW
  reg [7:0] dma_pass_gate_7_0;                  // @0x38 RW
  reg [7:0] pass_avg;                           // @0x40 RO (default: 0x6E)
  reg [7:0] fail_avg;                           // @0x48 RO (default: 0x0D)

  // Optional buffer (unused): reg [7:0] rdata_reg;

  // -------------------------------------------
  // Write Logic (RW regs only)
  // -------------------------------------------
  always@(posedge clk or negedge rstn) begin
    if(!rstn) begin     
      // Default reset values for all regs
      sample_config                  <= 'h0;
      uartc_addr_offset_9_8         <= 'h0;
      i2c_config                    <= 'h0;
      uartc_addr_offset_7_0         <= 'h0;
      i2c_directional_threshold_9_8 <= 'h0;
      dma_config                    <= 'h0;
      dma_pass_gate_9_8             <= 'h0;
      dma_pass_gate_7_0             <= 'h0;
      pass_avg                      <= 'h6e;  // Constant RO value
      fail_avg                      <= 'h0d;  // Constant RO value
    end else begin   
      if(write == 1'b1 && select == 1'b1) begin    
        case(addr)
          'h0:  sample_config                  <= wdata;
          'h08: uartc_addr_offset_9_8          <= wdata;
          'h10: i2c_config                     <= wdata;
          'h18: uartc_addr_offset_7_0          <= wdata;
          'h20: i2c_directional_threshold_9_8  <= wdata;
          'h28: dma_config                     <= wdata;
          'h30: dma_pass_gate_9_8              <= wdata;
          'h38: dma_pass_gate_7_0              <= wdata;
          // Writes to RO registers pass_avg / fail_avg are disabled
        endcase
      end
    end
  end

  // -------------------------------------------
  // Readback Logic (all registers)
  // -------------------------------------------
  always@(*) begin
    if(write == 1'b0 && select == 1'b1) begin
      case(addr)
        'h0:  rdata <= sample_config;                      
        'h08: rdata <= uartc_addr_offset_9_8;              
        'h10: rdata <= i2c_config;                         
        'h18: rdata <= uartc_addr_offset_7_0;              
        'h20: rdata <= i2c_directional_threshold_9_8;      
        'h28: rdata <= dma_config;                         
        'h30: rdata <= dma_pass_gate_9_8;                  
        'h38: rdata <= dma_pass_gate_7_0;                  
        'h40: rdata <= pass_avg;                           // RO only
        'h48: rdata <= fail_avg;                           // RO only
      endcase
    end
  end

endmodule
