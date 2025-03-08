// config_db example

class pkt extends uvm_object;
    rand bit [7:0] mode;
    randc bit [7:0] key;
    int low,high;
    `uvm_object_utils(pkt)
    function new(string name="pkt");
        super.new(name);
    endfunction
    function void pre_randomize();
        low = 1;
        high = 2;
    endfunction
endclass

module tb_top;
    pkt pkt1;
    initial begin
        pkt1 = new();
        repeat(5) begin
            pkt1.randomize();
            $display("mode = %0h, key = %0h", pkt1.mode, pkt1.key);
        end
    end
endmodule