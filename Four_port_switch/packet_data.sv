typedef enum {HEX,BIN,DEC} pp_t
typedef enum {ANY,SINGLE,MULTICAST,BROADCAST} ptype_t
//typedef enum {UNIDED, IDED} tag_mode
// packet class
class packet;

  // properties
	local string name;
	rand bit [3:0] target;
	     bit [3:0] source;
	rand bit [7:0] data;
	rand ptype_t ptype;
	/*static int pktcount;
	       int tag;
	tag_mode tagmode;
*/
	function new(string name, int idt);
		this.name = name;
		source = 1<<idt;
		ptype = ANY;
		//pktcount++;
		//tag = pktcount;
	endfunction
	
	constraint nonzero { target != 0}
	constraint notequal {target & source == 4'b0000}

	/*function postrandomize();
		if (tagmode == IDED) begin
			data = tag;
		end
	*/
	function string getname();
		return name;
	endfunction

	function string gettype();
		return ptype.name();
	endfunction
	/*static function int get_count();
		return pktcount;
	*/	
	


  // constructor to set instance name and source by arguments and packet type

 // add print with policy

	function void print(input pp_t pp = DEC);
		$display("name: %s, type: %s, count: %0d,  tag: %0d, tagmode: %s",getname(), gettype());
		case (pp)
			HEX: $display("from source %h, to target %h, data %h",source,target,data);
			BIN: $display("from source %b, to target %b, data %b",source,target,data);
			DEC: $display("from source %0d, to target %0d, data %0d",source,target,data);
		endcase
	endfunction
 
endclass


class psingle extends packet;

	constraint tar_val {target inside {4'b1,4'b10,4'b100,4'b1000}

	function new(string name, int idt);
		super.new(name,idt);
		ptype = SINGLE;
	endfunction
endclass


class pmulticast extends packet;

	constraint tar_val {target inside {3,[5:7],[9-14]}

	function new(string name, int idt);
		function new(string name, int idt);
		super.new(name,idt);
		ptype = MULTICAST;
	endfunction
		
endclass

class pbroadcast extends packet;

	constraint tar_val {target = 4'b1111 }

	function new(string name, int idt);
		function new(string name, int idt);
		super.new(name,idt);
		ptype = BROADCAST;
	endfunction
		
endclass

