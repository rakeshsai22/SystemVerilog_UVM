// typecasting

// unsigned <-> signed

module top;
    shortint val;
    shortint unsigned val_un;

    initial begin
        val_un = 2**3 -16;
        val = -2;

      $display("type casted val_un = %0d val_un = %0d",signed'(val_un), val_un);
      $display("type casted val = %0d val=%0d",unsigned'(val),val);
    end
    endmodule

// // output:
// type casted val_un = -8 val_un = 65528
// type casted val = 65528 val=-8