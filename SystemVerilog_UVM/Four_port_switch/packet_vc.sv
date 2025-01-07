
class packet_vc extends component_base;

	agent agn;
	
	function new (string name, component_base parent);
    		super.new(name,parent);
		agn = new("agn",this);
	endfunction

	function configure(virtual interface port_if pif, int portno);
		agn.drv.pif = pif;
		agn.mnr.pif = pif;

		agn.sqr.portno = portno;

	task run(int runs);
		fork		
			agn.mnr.run();
		join_none		// as mnr has a forever loop we make it non-blocking
			agn.drv.run(runs);
	endtask
endclass

