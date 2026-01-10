module fifo_syn #(
    parameter FIFO_DEPTH = 8;
    parameter DATA_WIDTH = 32
) (
    input clk,
    input rst_n,
    input wr_en,
    input rd_en,
    input cs,
    input [DATA_WIDTH-1:0] data_in,
    output [DATA_WIDTH-1:0] data_out,
    output empty,
    output full
);
    localparam FIFO_DEPTH_LOG = $clog2(FIFO_DEPTH);

    reg [DATA_WIDTH-1:0] fifo [0:FIFO_DEPTH-1];
    reg [FIFO_DEPTH] wr_ptr;
    reg [FIFO_DEPTH] rd_ptr;

    // writing

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            wr_ptr<=0;
        end

        else if(cs && wr_en && !full) begin
            fifo[wr_ptr[FIFO_DEPTH_LOG-1:0]] <= data_in;
            wr_ptr <= wr_ptr+1;
        end
    end

    // reading
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            rs_ptr<=0;
        end
        else if (cs && rd_ptr && !empty) begin
            data_out<= fifo[rd_ptr[FIFO_DEPTH_LOG-1:0]];
            rd_ptr<=rd_ptr+1;
        end
    end
    
    // empty full check

    assign empty = (wr_ptr == rd_ptr);
    assign full = (rd_ptr == (~wr_ptr[FIFO_DEPTH_LOG],wr_ptr[FIFO_DEPTH_LOG-1:0]));

endmodule