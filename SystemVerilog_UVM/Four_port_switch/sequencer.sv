

class sequencer extends component_base;

	//sequencer sq;
	int portno;
	function new (string name, component_base parent);
    		super.new(name,parent);
  	endfunction
	
	void function get_next_item(output packet pkt);
		randcase 

		     1:begin : single_packet
		       ps = new($sformatf("parray[%0d]",i), 0);
		       ok = ps.randomize();
		       parray[i] = ps;
		       end
		     1:begin : multicast_packet
		       pm = new($sformatf("parray[%0d]",i), 1);
		       ok = pm.randomize();
		       parray[i] = pm;
		       end
		     1:begin : broadcast_packet
		       pb = new($sformatf("parray[%0d]",i), 2);
		       ok = pb.randomize();
		       parray[i] = pb;
		       end
		     endcase 



	return pkt;


endclass
