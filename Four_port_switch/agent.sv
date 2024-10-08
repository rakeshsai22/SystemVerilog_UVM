class agent extends component_base;
	sequencer sqcr;
	driver dvr;
	monitor mnr;

	function new (string name, component_base parent);
		super.new(name,parent);
		mnr = new("mnr",this);
		drv = new("drv",this)
		sqcr = new("sqcr",this);
		seqr  =  drv.sqr;
	endfunction


endclass
