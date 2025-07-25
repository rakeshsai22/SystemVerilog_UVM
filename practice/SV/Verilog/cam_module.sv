// Code your design here
typedef enum logic [1:0] { CMD_INS, CMD_RD, CMD_DEL, CMD_NOP } cam_command;

module CAM #(
    int k_width = 16,
    int d_width = 16,
    int storage_size = 32,
    int storage_width = $clog2(storage_size)
)
(
    output [d_width:1] out_data,
    output out_valid,
    output ready,
    input [k_width:1] key,
    input [d_width:1] in_data,
    input cam_command cmd,
    input clk
);
    logic [d_width:1] storage_data [storage_size];
    logic [k_width:1] storage_key [storage_size];
    logic [storage_size-1:0] storage_full;

    logic [storage_width:1] midx,eidx;
    logic mmatch,ematch;

    initial begin
        for(int i=0;i<storage_size;i++) begin 
            storage_full[i] = 0;
        end
    end

    initial begin
        if(storage_size > (1 << k_width) ) begin
            $display("Size of CAM too large for key size");
        end
    end

    // to find matching key
    always_comb begin
        mmatch = 0;
        midx = 0;
        for (int i=0; i<storage_size;i++) begin
            if(storage_full[i] && storage_key[i] == key) begin 
                mmatch = 1;
//                 midx = i[storage_width:1];
              	midx = i;
            end
        end
    end


    assign out_data = storage_data[midx];
// 	assign out_data = (cmd == CMD_RD && mmatch) ? storage_data[midx] : '0;
    assign out_valid = cmd == CMD_RD && mmatch || cmd == CMD_INS && (mmatch || ematch);

// to find emtpy location

    always_comb begin
        ematch =0;
        eidx =0; //empty location index
        for(int i=0;i<storage_size;i++) begin
            if(!storage_full[i]) begin
                ematch =1;
                eidx=i;
            end
        end
    end

    assign ready = 1;

    // to add or remove elements

    always @(posedge clk) begin
        case (cmd)
            CMD_DEL : if(mmatch) storage_full[midx] <=0;
            CMD_INS : 
                if (ematch && !mmatch) begin
                    storage_full[eidx] <=1;
                    storage_data[eidx] <= in_data;
                    storage_key[eidx] <= key;
                end
                else if(mmatch) begin

                    storage_data[midx] <= in_data;
                end
          CMD_NOP: $display("No operation");
            default: $display("please enter a proper command");
        endcase
    end

//  tasks - why ? 
//      insert and delete, we write to variables which takes some simulation time - so these are part of sequential logic

    endmodule


