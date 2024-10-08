
module packet_test;
import packet_pkg::*;


packet_vc pkt;

initial begin
	pkt = new("pkt",null);
	pkt.run();
end

/*
packet parray[16];
packet p;
psingle s;
pmulti m;
pbroad b;
bit ok;
int i = 0;

initial begin

 print(DEC);
 $display("Packet count: %0d",packet::getcount();

	foreach(parray[i]) begin
		randcase
			1: begin
				s = new("s",0);// new($sformatf("parray[%0d]",i),0)
				ok = s.randomize();
				parray[i] = s;
			    end
			
			1: begin
				m = new("m",1);// new($sformatf("parray[%0d]",i),1)
				ok = s.randomize();
				parray[i] = m;
			    end

			1: begin
				b = new("b",2);// new($sformatf("parray[%0d]",i),2)
				ok = s.randomize();
				parray[i] = b;
			    end
		endcase
	end			


 	foreach(parray[i]) begin
		parray[i].print();
		validate(parray[i]);
end
*/


end
//--------------------validate functions for verification --------------------
//--------------------Do not edit below this line          --------------------

function int countones (input logic[3:0] vec);
  countones = 0;
  foreach (vec [i])
    if (vec[i]) countones++;
endfunction

function void validate (input packet ap);
  int sco, tco;
  sco = countones(ap.source);
  tco = countones(ap.target);
  if (sco != 1) 
     $display("ERROR in source %h - no. bits set = %0d", ap.source, sco);
  if (ap.ptype == "broadcast") begin
    if  (ap.target != 4'hf) 
       $display("ERROR: broadcast packet target is %h not 4'hf", ap.target);
  end
  else 
  begin
    if ( |(ap.source & ap.target) == 1'b1)   
      $display("ERROR: non-broadcast packet %s has same source %h and target %h bit set", ap.getname(), ap.source, ap.target);
    if ((ap.ptype == "single") & (tco != 1)) 
      $display("ERROR: single packet %s does not have only one bit set in target %h", ap.getname(), ap.target);
    if ((ap.ptype == "multicast") & (tco < 2)) 
      $display("ERROR: multicast packet %s does not have more than one bit set in target %h", ap.getname(), ap.target);
  end
endfunction
    
endmodule
   

