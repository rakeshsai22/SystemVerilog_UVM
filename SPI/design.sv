// Simple SPI Slave DUT for testing
module spi_slave (
  input  logic       sclk,
  input  logic       mosi,
  output logic       miso,
  input  logic       cs_n,
  input  logic       rst_n
);

  // Internal registers
  logic [7:0] shift_reg;
  logic [7:0] memory [0:255];
  logic [2:0] bit_counter;
  logic [7:0] address;
  logic       receiving;
  
  // Initialize memory with some test pattern
  initial begin
    for (int i = 0; i < 256; i++) begin
      memory[i] = i[7:0] ^ 8'hAA;  // Simple test pattern
    end
  end
  
  // SPI Slave logic
  always_ff @(posedge sclk or negedge rst_n) begin
    if (!rst_n) begin
      shift_reg <= 8'h00;
      bit_counter <= 3'b000;
      address <= 8'h00;
      receiving <= 1'b0;
      miso <= 1'b0;
    end else begin
      if (!cs_n) begin  // Chip select active
        if (!receiving) begin
          // First transaction - capture address
          shift_reg <= {shift_reg[6:0], mosi};
          bit_counter <= bit_counter + 1;
          
          if (bit_counter == 3'b111) begin
            address <= {shift_reg[6:0], mosi};
            receiving <= 1'b1;
            bit_counter <= 3'b000;
            // Start outputting data from memory
            miso <= memory[{shift_reg[6:0], mosi}][7];
          end
        end else begin
          // Data transaction
          shift_reg <= {shift_reg[6:0], mosi};
          bit_counter <= bit_counter + 1;
          
          // Output next bit
          if (bit_counter < 3'b111) begin
            miso <= memory[address][6 - bit_counter];
          end
          
          if (bit_counter == 3'b111) begin
            // Store received data to memory
            memory[address] <= {shift_reg[6:0], mosi};
            bit_counter <= 3'b000;
          end
        end
      end else begin
        // Chip select inactive
        bit_counter <= 3'b000;
        receiving <= 1'b0;
        miso <= 1'b0;
      end
    end
  end

endmodule