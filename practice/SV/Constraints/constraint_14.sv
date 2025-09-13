// write a constraint to generate this series : 1 2 4 8 16 32 64 128 256 512 without using **,bitwise operators.

class pkt;
    rand bit [31:0] a;
    bit [31:0] b = 1;

    constraint a_power {
        a%2 == 0;
        a == b;
    }
    function return_value name(port_list);
        b=b<<1;
    endfunction
endclass

module top();
    pkt p;
    initial begin
        p = new();

        repeat(10) begin
            if(p.randomize()) begin
                $write("%0d ",p.a);
            end
        end
    end

endmodule