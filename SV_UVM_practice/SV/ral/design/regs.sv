// Code your design here
module sample_reg_design(
  input clk,
  input  rstn,
  input  select,
  input  write,
  input   [7:0]  addr,
  input   [7:0]  wdata,
  output reg [7:0]  rdata);
  
  //RAL registers
  reg [7:0] sample_config;
  reg [7:0] uartc_addr_offset_9_8;
  reg [7:0] i2c_config;
  reg [7:0] uartc_addr_offset_7_0;
  reg [7:0] i2c_directional_threshold_9_8;a
  reg [7:0] dma_config;
  reg [7:0] dma_pass_gate_9_8;
  reg [7:0] dma_pass_gate_7_0;
  reg [7:0] pass_avg;
  reg [7:0] fail_avg;
  
   reg [7:0] rdata_reg;
  
  //assign rdata = rdata_reg;
  
  
  always@(posedge clk or negedge rstn) begin
    if(!rstn) begin     
     sample_config                  <= 'h0;
     uartc_addr_offset_9_8          <= 'h0;
     i2c_config                     <= 'h0;
     uartc_addr_offset_7_0          <= 'h0;
     i2c_directional_threshold_9_8  <= 'h0;
     dma_config                     <= 'h0;
     dma_pass_gate_9_8              <= 'h0;
     dma_pass_gate_7_0              <= 'h0;
     pass_avg                       <= 'h0;
     fail_avg                       <= 'h0;
    end else begin   
    if(write == 1'b1 && select == 1'b1) begin    
      case(addr)
        'h0: sample_config                   <=   wdata;
        'h08:uartc_addr_offset_9_8           <=   wdata;
        'h10:i2c_config                      <=   wdata;
        'h18:uartc_addr_offset_7_0           <=   wdata;
        'h20:i2c_directional_threshold_9_8   <=   wdata;
        'h28:dma_config                      <=   wdata;
        'h30:dma_pass_gate_9_8               <=   wdata;
        'h38:dma_pass_gate_7_0               <=   wdata;
        'h40:pass_avg                        <=   wdata;
        'h48:fail_avg                        <=   wdata;
      endcase
      // rdata <= 'h0;
    end
     end
  end
   
  always@(*) begin
    if(write == 1'b0 && select == 1'b1) begin
      //select_reg <= 1'b1;
      case(addr)
        'h0:rdata   <=     sample_config;                      
        'h08:rdata  <=     uartc_addr_offset_9_8;              
        'h10:rdata  <=     i2c_config;                        
        'h18:rdata  <=     uartc_addr_offset_7_0;             
        'h20:rdata  <=     i2c_directional_threshold_9_8;     
        'h28:rdata  <=     dma_config;                         
        'h30:rdata  <=     dma_pass_gate_9_8;                  
        'h38:rdata  <=     dma_pass_gate_7_0;                  
        'h40:rdata  <=     pass_avg;                     
        'h48:rdata  <=     fail_avg;
      endcase
    end
  end
        
        
endmodule