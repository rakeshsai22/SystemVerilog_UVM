interface dut_if;
  logic pclk;
  logic prst;
  logic [31:0] paddr;
  logic pwrite;
  logic [31:0] pwdata;
  logic [31:0] prdata;
  logic pready;
  logic psel;
  logic penable;

  // Master clocking block
  clocking master_clk @(posedge pclk);
    output paddr;
    output pwrite;
    output pwdata;
    output psel;
    output penable;
    input prdata;
  endclocking:master_clk
  
  // Slave Clocking Block
  clocking slave_clk@(posedge pclk);
    output prdata;
    input psel;
    input paddr;
    input penable;
    input pwrite;
    input pwdata;
  endclocking: slave_clk
  
  clocking mon_clk @(posedge pclk);
    input paddr;
    input psel;
    input penable;
    input pwrite;
    input prdata;
    input pwdata;
  endclocking: mon_clk
  
  modport master(clocking master_clk);
  modport slave(clocking slave_clk);
  modport psv(clocking mon_clk);
  
 
endinterface
