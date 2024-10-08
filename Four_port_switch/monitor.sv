
class monitor extends compnonent_base;
	
	virtual interface port_if pif;
	packet pkt;

	function new (string name, component_base parent);
    		super.new(name,parent);
	endfunction
	
	task run();
		forever begin
			pif.collect_packet(pkt);
			$display("@ %s",pathname());
			pkt.print();
		end
	endtask
endclass
