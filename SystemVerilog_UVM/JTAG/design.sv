//`define idcode 16'hED6E;
`define EDGE 16'hED6E;
`define COCO 16'hC0C0;
module jtag(
	input TCK,
	input TDI,
	input TMS,
	input TRST_N,
	output reg TDO
);

parameter IR_SIZE = 4 ;
parameter DR_SIZE = 16;
parameter R_SIZE = 16 ;
// TAP controlletr state machine parameters
parameter TEST_LOGIC_RESET	= 4'd0 ;
parameter RUN_TEST_IDLE		= 4'd1 ;
parameter SELECT_IR_SCAN	= 4'd2 ;
parameter CAPTURE_IR		= 4'd3 ;
parameter SHIFT_IR		= 4'd4 ;
parameter EXIT1_IR		= 4'd5 ;
parameter PAUSE_IR		= 4'd6 ;
parameter EXIT2_IR		= 4'd7 ;
parameter UPDATE_IR		= 4'd8 ;
parameter SELECT_DR_SCAN	= 4'd9 ;
parameter CAPTURE_DR		= 4'd10;
parameter SHIFT_DR		= 4'd11;
parameter EXIT1_DR		= 4'd12;
parameter PAUSE_DR		= 4'd13;
parameter EXIT2_DR		= 4'd14;
parameter UPDATE_DR		= 4'd15;
// mode parameter
parameter BYPASS		= 4'b1111;
parameter IDCODE		= 4'b0010;
parameter EXTEST		= 4'b0000;
parameter SAMPLE_PRELOAD	= 4'b0001;
parameter DATA_WIDTH = 16;
  
// registers
reg [IR_SIZE-1:0] IR;
reg [IR_SIZE-1:0] shiftIR;//latchIR to shiftIR
//reg [R_SIZE-1:0] DR_IDCODE;
//   reg[15:0]latchDR;//change latchDR to shiftDR
reg tdr_reg;
reg	bypass_reg;
reg [127:0] bsc;
reg [15:0] idcode_reg;
  
reg [DATA_WIDTH-1:0] TDR0;
reg [DATA_WIDTH-1:0] TDR1;
reg [DATA_WIDTH-1:0] TDR2;
reg [DATA_WIDTH-1:0] TDR3;
reg [DATA_WIDTH-1:0] TDR4;
reg [DATA_WIDTH-1:0] TDR5;
reg [DATA_WIDTH-1:0] TDR6;
reg [DATA_WIDTH-1:0] TDR7;
   
logic [3:0] state;
logic [3:0] next_state;
logic bsc_en;

logic TDR0_en;
logic TDR1_en;
logic TDR2_en;
logic TDR3_en;
logic TDR4_en;
logic TDR5_en;
logic TDR6_en;
logic TDR7_en;
  
//  logic tdr_tdo;
logic tdr0_tdo;
logic tdr1_tdo;
logic tdr2_tdo;
logic tdr3_tdo;
logic tdr4_tdo;
logic tdr5_tdo;
logic tdr6_tdo;
logic tdr7_tdo;
 
logic shift_en;
logic updateir_en;
logic updatedr_en;
logic capture_dr_en;
logic idcode_en;
logic shift_dr_en;

wire	bypass_tdo;
wire	idcode_tdo;
wire 	bsc_tdo;

// FSM logic
always_ff @(posedge TCK or negedge TRST_N) begin
  if (!TRST_N)
      state <= TEST_LOGIC_RESET;
  else
      state <= next_state;
 end

always_comb begin
  case(state)
    TEST_LOGIC_RESET	: next_state = TMS ? TEST_LOGIC_RESET	: RUN_TEST_IDLE	;
	RUN_TEST_IDLE		: next_state = TMS ? SELECT_DR_SCAN		: RUN_TEST_IDLE	;
	SELECT_IR_SCAN		: next_state = TMS ? TEST_LOGIC_RESET	: CAPTURE_IR	;
	CAPTURE_IR			: next_state = TMS ? EXIT1_IR			: SHIFT_IR		;
	SHIFT_IR			: next_state = TMS ? EXIT1_IR			: SHIFT_IR		;
	EXIT1_IR			: next_state = TMS ? UPDATE_IR			: PAUSE_IR		;
	PAUSE_IR			: next_state = TMS ? EXIT2_IR			: PAUSE_IR		;
	EXIT2_IR			: next_state = TMS ? UPDATE_IR			: SHIFT_IR		;
	UPDATE_IR			: next_state = TMS ? SELECT_DR_SCAN		: RUN_TEST_IDLE	;
	SELECT_DR_SCAN		: next_state = TMS ? SELECT_IR_SCAN		: CAPTURE_DR	;
	CAPTURE_DR			: next_state = TMS ? EXIT1_DR			: SHIFT_DR		;
	SHIFT_DR			: next_state = TMS ? EXIT1_DR			: SHIFT_DR		;
	EXIT1_DR			: next_state = TMS ? UPDATE_DR			: PAUSE_DR		;
	PAUSE_DR			: next_state = TMS ? EXIT2_DR			: PAUSE_DR		;
	EXIT2_DR			: next_state = TMS ? UPDATE_DR			: SHIFT_DR		;
	UPDATE_DR    		: next_state = TMS ? SELECT_DR_SCAN		: RUN_TEST_IDLE	;
    default				: next_state = 		 TEST_LOGIC_RESET					;
  endcase
end
  
assign shift_en =  (state == SHIFT_IR)    ;
assign updateir_en =  (state == UPDATE_IR);
assign updatedr_en =  (state == UPDATE_DR);
assign shift_dr_en =  (state == SHIFT_DR) ;
assign capture_dr_en= (state == CAPTURE_DR);    

always@(posedge TCK or negedge TRST_N)
  begin
    if(!TRST_N)
			shiftIR[IR_SIZE-1:0]<=0;
    else if(shift_en)
      shiftIR[IR_SIZE-1:0] <={TDI,shiftIR[IR_SIZE-1:1]};    //MSB first
    else
      shiftIR <= shiftIR;
  end

//for updating
always@ (posedge TCK or negedge TRST_N)
 begin
   if(!TRST_N) // use RST_N in
		IR <= 4'b0000;
  else if (updateir_en)
		IR <= shiftIR;
 end
  
// bsc 16X8 = 128
always @(posedge TCK or negedge TRST_N)
 begin
  if(!TRST_N) 
		bsc <= 128'h0000_0000_0000_0000_0000_0000_0000_0000;
  else if(IR == SAMPLE_PRELOAD && capture_dr_en)
		bsc <= 128'h0000_0000_0000_0000_0000_0000_0000_0000;
  else if(IR == SAMPLE_PRELOAD && shift_dr_en)
	    bsc <= {TDI,bsc[127:1]};
  else
    	bsc <= bsc;
 end
assign bsc_tdo = bsc[0]; 

//bypass the data
always @(posedge TCK or negedge TRST_N )
 begin
  if(!TRST_N)
		bypass_reg <= 1'b0;
  else if(IR == BYPASS && capture_dr_en)
		bypass_reg <= 1'b0;
  else if(IR == BYPASS && shift_dr_en)
		bypass_reg <= TDI;
  else
    	bypass_reg <= bypass_reg;
 end
assign bypass_tdo = bypass_reg;

assign idcode_en = (IR == IDCODE);
always @ (posedge TCK or negedge TRST_N)
 begin
   if(~TRST_N) begin
        idcode_reg <= `EDGE; // IDCODE IR 
      end
   else if(idcode_en && shift_dr_en)
        idcode_reg <=  {TDI, idcode_reg[15:1]};
   else
        idcode_reg <= idcode_reg;
 end
assign idcode_tdo = idcode_reg[0]; 



// define IR_decode
assign TDR0_en = (IR == 4'b0100);
assign TDR1_en = (IR == 4'b0101);
assign TDR2_en = (IR == 4'b0110);
assign TDR3_en = (IR == 4'b0111);
assign TDR4_en = (IR == 4'b1000);
assign TDR5_en = (IR == 4'b1001);
assign TDR6_en = (IR == 4'b1010);
assign TDR7_en = (IR == 4'b1011);
  
//updateDR
always@(posedge TCK or negedge TRST_N) begin
  if(!TRST_N)
        TDR0<=16'b0;
  else if(shift_dr_en && TDR0_en) begin 
        TDR0 <= {TDI,TDR0[DATA_WIDTH-1:1]};
      end
  else if(updatedr_en && TDR0_en) begin
        TDR0<=TDR0;
      end
  else
        TDR0<=TDR0;
 end
assign tdr0_tdo = TDR0[0];
  
always@(posedge TCK or negedge TRST_N) begin
  if(~TRST_N)
        TDR1<=16'b0;
      else if(shift_dr_en && TDR1_en) begin 
        TDR1 <= {TDI,TDR1[DATA_WIDTH-1:1]};
      end
      else if(updatedr_en && TDR1_en) begin
        TDR1<=TDR1;
      end
      else 
        TDR1<=TDR1;
 end
assign tdr1_tdo = TDR1[0];
  
always@(posedge TCK or negedge TRST_N) begin
  if(~TRST_N)
        TDR2<=16'b0;
  else if(shift_dr_en && TDR2_en) begin 
        TDR2 <= {TDI,TDR2[DATA_WIDTH-1:1]};
      end
  else if(updatedr_en && TDR2_en) begin
        TDR2<=TDR2;
      end
  else begin
        TDR2<=TDR2;
      end 
 end
assign tdr2_tdo = TDR2[0];
  
always@(posedge TCK or negedge TRST_N) begin
  if(~TRST_N)
        TDR3<=16'b0;
  else if(shift_dr_en && TDR3_en) begin 
        TDR3 <= {TDI,TDR3[DATA_WIDTH-1:1]};
      end
  else if(updatedr_en && TDR3_en) begin
        TDR3<=TDR3;
      end
  else begin
          TDR3<=TDR3;
      end
 end
assign tdr3_tdo = TDR3[0];
  
always@(posedge TCK or negedge TRST_N) begin
  if(~TRST_N)
        TDR4<=16'b0;
  else if(shift_dr_en && TDR4_en) begin 
        TDR4 <= {TDI,TDR4[DATA_WIDTH-1:1]};
      end
  else if(updatedr_en && TDR4_en) begin
        TDR4<=TDR4;
      end
  else begin
          TDR4<=TDR4;
      end
 end 
assign tdr4_tdo = TDR4[0];
  
always@(posedge TCK or negedge TRST_N) begin
  if(~TRST_N)
        TDR5<=16'b0;
  else if(shift_dr_en && TDR5_en) begin 
        TDR5 <= {TDI,TDR5[DATA_WIDTH-1:1]};
      end
  else if(updatedr_en && TDR5_en) begin
        TDR5<=TDR5;
      end
  else begin
          TDR5<=TDR5;
      end
 end
assign tdr5_tdo = TDR5[0];

always@(posedge TCK or negedge TRST_N)  begin
  if(~TRST_N)
        TDR6<=16'h600D;// test_logic reset
  else if(updatedr_en && TDR6_en)
        TDR6<=`EDGE
  else begin
          TDR6<=TDR6;
    	end
 end
assign tdr6_tdo = TDR6[0];
  
always@(posedge TCK or negedge TRST_N) begin
  if(~TRST_N)
        TDR7<=16'h600D;
  else if(updatedr_en && TDR7_en)
        TDR7<=`COCO
  else begin 
        TDR7<=TDR7;
  end
 end
assign tdr7_tdo = TDR7[0]; 

//tdo part
always@ (negedge TCK or negedge TRST_N)
 begin
    		case(IR)
      		  IDCODE:			TDO = idcode_tdo;
              BYPASS: 			TDO = bypass_tdo;
              SAMPLE_PRELOAD: 	TDO = bsc_tdo;
              4'b0100: 			TDO = tdr0_tdo;
              4'b0101: 			TDO = tdr1_tdo;
              4'b0110: 			TDO = tdr2_tdo;
              4'b0111: 			TDO = tdr3_tdo;
              4'b1000: 			TDO = tdr4_tdo;
              4'b1001: 			TDO = tdr5_tdo;
              4'b1010: 			TDO = tdr6_tdo;
              4'b1011: 			TDO = tdr7_tdo;
              default:	 		TDO = 1'bz;
    		endcase
 end

endmodule