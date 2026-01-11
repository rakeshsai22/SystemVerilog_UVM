module tb_fifo_sync;
    localparam int FIFO_DEPTH = 8;
    localparam int DATA_WIDTH = 32;

    logic clk;
    logic rst_n;
    logic wr_en,rd_en,cs;
    logic [DATA_WIDTH-1:0] data_in,data_out;
    logic empty,full;


    fifo_syn #(.FIFO_DEPTH(FIFO_DEPTH), .DATA_WIDTH(DATA_WIDTH)) dut(
        .clk(clk),.rst_n(rst_n),.wr_en(wr_en),.rd_en(rd_en),
        .cs(cs), .data_in(data_in), .data_out(data_out),
        .empty(empty),.full(full)
    );

    initial clk=0;
    always #5 clk=~clk;

    // reference queue

    logic [DATA_WIDTH-1:0] exp[$];

    task automatic check_flags(string tag="");
        bit exp_empty = (exp.size() ==0);
        bit exp_full = (exp.size() == FIFO_DEPTH);

        if(empty!== exp_empty) begin
            $display("[%0t] %s [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d", $time, tag, empty,exp_empty,exp.size());
            $fatal;
        end

        if(full !== exp_full) begin
            $display("[%0t] %s [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d", $time,tag, full,exp_full,exp.size());
            $fatal;
        end
    endtask

    task automatic do_push(input logic[DATA_WIDTH-1:0] data);
        @(posedge clk);
        cs <=1;
        wr_en<=1;
        rd_en<=0;
        data_in<= data;
        @(posedge clk);
        if(!full) begin
            exp.push_back(data);
        end

        @(posedge clk);
        wr_en<=0;
        cs <=0;
        data_in<= '0;
        #1;
        check_flags("PUSH");
    endtask

    task automatic do_pop();
        logic [DATA_WIDTH-1:0] exp_val;
        @(posedge clk);
        cs <=1;
        wr_en<=0;
        rd_en<=1;

        @(posedge clk);
        if(!empty) begin
            exp_val = exp.pop_front();
            #1;
            if(data_out !==exp_val) begin
                $display("[%0t] POP DATA MISMATCH: DUT=%0h EXP=%h",$time, data_out, exp_val);
                $fatal;
            end
        end
        @(posedge clk);
        rd_en<=0;
        cs<=0;
        #1;
        check_flags("POP");
    endtask

    task automatic random_op(int n);
        for (int i=0; i<n; i++) begin
            int op = $urandom_range(0,1);
            if(op==0) begin
                do_push($urandom());
            end
            else begin
                do_pop();
            end
        end
        endtask

    initial begin
        wr_en =0;
        rd_en=0;
        cs=0;
        data_in='0;
        rst_n=0;

        @(posedge clk);
        rst_n=1;
        exp.delete();
        #1;
        check_flags("AFTER RESET");

        for (int i=0; i<FIFO_DEPTH; i++) begin
            do_push(32'h1000_0000 + i);
        end

        do_push(32'hF1F0_DEAD);

        // pop
        for (int i=0; i<FIFO_DEPTH; i++) begin
            do_pop();
        end

        do_pop();

        random_op(50);

        $display("DONE:TEST_PASS");
        $finish;
    end
    endmodule
