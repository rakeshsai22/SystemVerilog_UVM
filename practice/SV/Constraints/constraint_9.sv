class mem_address_gen;
  rand int addr;           
  rand int lower_bound;  
  rand int upper_bound;

  localparam int MEM_SIZE = 1024;
  localparam int MAX_POWER = $clog2(MEM_SIZE) - 1;

  constraint addr_power_of_two {
    addr inside { foreach (int i) [0:MAX_POWER] -> (1 << i) };
  }

  constraint window_bounds {
    lower_bound == addr - $urandom_range(0, 16);
    upper_bound == addr + $urandom_range(0, 16);

    lower_bound >= 0;
    upper_bound < MEM_SIZE;
  }
endclass

module test;
  initial begin
    mem_address_gen gen = new();
    repeat (10) begin
      assert(gen.randomize());
      $display("addr = %0d (0x%0h), bounds = [%0d, %0d]", 
                gen.addr, gen.addr, gen.lower_bound, gen.upper_bound);
    end
  end
endmodule
