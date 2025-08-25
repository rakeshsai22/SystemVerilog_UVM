interface spi_if;
  logic sclk;           // SPI Serial Clock
  logic mosi;           // Master Out Slave In
  logic miso;           // Master In Slave Out  
  logic cs_n;           // Chip Select (active low)
  logic rst_n;          // Reset (active low)
  
  // Master clocking block - for driving signals from master side
  clocking master_clk @(posedge sclk);
    output mosi;
    output cs_n;
    input miso;
  endclocking: master_clk
  
  // Slave clocking block - for driving signals from slave side  
  clocking slave_clk @(posedge sclk);
    output miso;
    input mosi;
    input cs_n;
  endclocking: slave_clk
  
  // Monitor clocking block - for observing all signals
  clocking mon_clk @(posedge sclk);
    input mosi;
    input miso;
    input cs_n;
  endclocking: mon_clk
  
  // Modports for different components
  modport master(clocking master_clk);
  modport slave(clocking slave_clk);
  modport monitor(clocking mon_clk);
  
endinterface