// Count number of ones in the number when converted to binary
module top;
    initial begin
        static int num = $urandom();
        static int count;
      $display("num = 32'h%0h",num);
      $display("num = 32'b%b",num);

      while (num > 0) begin
            if (num%2 == 1) begin
                count+=1;
            end
            num=num/2;
      end

        
        $display("count = %0d",count);

    end

    
endmodule

module top;
  initial begin
    int number = $urandom();
    int num = number;
    int count = 0;
    int count_zeros = 0;
    
    
    while (num != 0) begin
      num = num & (num - 1);
      count += 1;
    end
    count_zeros = 32 - count;

    $display("number: 32'h%0h", number);
    $display("number: 32'b%b", number);
    $display("Number of 1s: %0d", count);
    $display("Number of 0s: %0d", count_zeros);
  end
endmodule

