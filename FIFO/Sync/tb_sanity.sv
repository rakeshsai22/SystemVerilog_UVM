module tb_sanity_sync();

    parameter FIFO_DEPTH = 8;
    parameter DATA_WIDTH = 32;
    // Inputs
    reg clk;
    reg rst_n;
    reg wr_en;
    reg rd_en;
    reg cs;
    reg [31:0] data_in;
    // Outputs
    wire [31:0] data_out;
    wire empty;
    wire full;
    // Instantiate the Unit Under Test (UUT)
    fifo_syn #(
        .FIFO_DEPTH(8),
        .DATA_WIDTH(32)
    ) uut (
        .clk(clk),
        .rst_n(rst_n),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .cs(cs),
        .data_in(data_in),
        .data_out(data_out),
        .empty(empty),
        .full(full)
    );

    integer i;

    always #5 clk = ~clk;

    task write(input [DATA_WIDTH-1:0] data);
    begin
        @(posedge clk);
        cs =1;
        wr_en = 1;
        data_in = data;
        $display($time, "writing data %0d",data);
        #100;
        @(posedge clk);
        wr_en = 0;
    end 
    endtask

    task read();
        begin
            @(posedge clk);
            cs =1;rd_en=1;
            $display($time, "reading data %0d",data_out);
            @(posedge clk);
            rd_en = 0;
        end
    endtask
    // Initialize Inputs
    initial begin
        clk = 0;
        #1;
        rst_n = 0;
        wr_en = 0;
        rd_en = 0;
        cs = 0;
        data_in = 0;
        #100;
        $display($time,"\n Test_case 1");
        @(posedge clk);
        rst_n = 1;
        write(1);
        write(2);
        write(3);
        write(4);
        read();
        read();
        read();
        read();

        $display($time,"\n Test_case 2 :: EMPTY FIFO");
        for (integer i =0;i<FIFO_DEPTH;i=i+1) begin
            write(i);
            read();
        end
        $display($time,"\n Test_case 3 :: FULL FIFO");
        for (integer i =0;i<FIFO_DEPTH;i=i+1) begin
            write(i);
        end
        for (integer i =0;i<FIFO_DEPTH;i=i+1) begin
            read();
        end

        #100;
        #100;
        $finish;
    end

    
endmodule