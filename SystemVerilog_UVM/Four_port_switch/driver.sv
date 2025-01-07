
class driver extends component_base;
	sequencer sqr;
	packet pkt;
	virtual interface port_if pif;

	function new (string name, component_base parent);
    		super.new(name,parent);
		//sqr = new("sqr",this);
	endfunction
	
	task run(int runs);
		repeat(runs)
		begin
			sqr.get_next_item(pkt);
			$display("driver @%s",pathname());
			pif.drive_packet(pkt);
			
			//$display("sequencer @%s",sqr.pathname());
		end	
	endtask

		

endclass
