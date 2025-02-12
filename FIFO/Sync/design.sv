// Synchronous FIFO design
module fifo_syn
    #(
        parameter FIFO_DEPTH = 8, // FIFO stores 8 values with 32-bit width
        parameter DATA_WIDTH = 32 // Data width of 32 bits
    )
    (
        input clk,
        input rst_n,
        input wr_en,
        input rd_en,
        input cs,
        input [DATA_WIDTH-1:0] data_in,
        output reg [DATA_WIDTH-1:0] data_out,
        output empty,
        output full
    );

    localparam FIFO_DEPTH_LOG  = $clog2(FIFO_DEPTH); // FIFO_DEPTH = 8, FIFO_DEPTH_LOG = 3
    // clog2 is a system function that returns the ceiling of the log base 2 of the input value
    reg [DATA_WIDTH-1:0] fifo [0:FIFO_DEPTH-1]; // FIFO memory

    reg [FIFO_DEPTH_LOG:0] wr_ptr; // Write pointer
    reg [FIFO_DEPTH_LOG:0] rd_ptr; // Read pointer

    // write 
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            wr_ptr <=0;
        end
        else if (cs && wr_en && !full) begin
            fifo[wr_ptr[FIFO_DEPTH_LOG-1:0]] <=data_in;
            wr_ptr <= wr_ptr + 1;
        end
    end

    // read
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            rd_ptr <=0;
        else if (cs && rd_ptr && !emty) begin
            data_out <= fifo[rd_ptr[FIFO_DEPTH_LOG-1:0]];
            rd_ptr <= rd_ptr + 1;
        end
    end

    // empty and full
    assign empty = (write_ptr == read_ptr);
    assign full = (read_ptr == (~write_ptr[FIFO_DEPTH_LOG],write_ptr[FIFO_DEPTH_LOG-1:0]));

    
endmodule