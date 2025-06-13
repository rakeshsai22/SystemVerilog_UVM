`include "uvm_macros.svh"
import uvm_pkg::*;

module tb_top;

    logic clk;
    logic rst_n;

    // dut interface
    apb_if apb_if_inst(clk);

    simple_config_reg dut (
        .clk(clk),
        .rst_n(rst_n),
        .wr_en(apb_if_inst.psel & apb_if_inst.penable & apb_if_inst.pwrite),
        .wr_data(apb_if_inst.pwdata),
        mode_o(),
        enable_o()
    );

    initial begin
        clk=0;
        rst_n=0;
        always #5 clk = ~clk;
        #20;
        rst_n=1;

    end

    initial begin
        uvm_config_db #(virtual apb_if)::set(null,"*",apb_if_inst);
        run_test("my_test");
        
    end


endmodule