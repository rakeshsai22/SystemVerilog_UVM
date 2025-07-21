// ## This 
//          * used to refer to class properties
//          * pre-defined class handle refering to the object from which it is used.
//          * this.var === class_object.var
//          * this shold only be used withinnon-static class methods

// example : 1

class packet;

    // class properties
    bit [31:0] addr;
    bit [31:0] data;
    bit wire;
    string pkt_type;

    // constructor

    function new(bit[31:0] addr,data,bit write,string pkt_type);
        addr = addr;
        data = data;
        write = write;
        pkt_type = pkt_type;
        
    endfunction

    // method to display class properties

    function void display();
        $display("\t addr = %0h",addr);
        $display("\t data = %0h",data);
        $display("\t write = %0h",write);
        $display("\t pkt_type = %0s",pkt_type);
        
    endfunction

endclass


    module sv_constructor;
        packet pkt;
        
        initial begin
            pkt = new(32'h10,32'hFF,1,"GOOD_PKT");
            pkt.display();
        end
        endmodule
// ------------------------------------------------------------------------------------------------
// compiler output: the addr, data and pkt_type are the property of both the classes and an argument to teh function new, as the name in both are same.
//                  values may not be assigned properly

// Contains Synopsys proprietary information.
// Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jun 12 17:42 2025
// 	 addr = 0
// 	 data = 0
// 	 write = 0
// 	 pkt_type = 
//            V C S   S i m u l a t i o n   R e p o r t 
// Time: 0 ns
// CPU Time:      0.440 seconds;     

// "This" will resolve these ambiguities
// ------------------------------------------------------------------------------------------------

class packet;

    // class properties
    bit [31:0] addr;
    bit [31:0] data;
    bit wire;
    string pkt_type;

    // constructor

    function new(bit[31:0] addr,data,bit write,string pkt_type);
        this.addr = addr;
        this.data = data;
        this.write = write;
        this.pkt_type = pkt_type;
        
    endfunction

    // method to display class properties

    function void display();
        $display("\t addr = %0h",addr);
        $display("\t data = %0h",data);
        $display("\t write = %0h",write);
        $display("\t pkt_type = %0s",pkt_type);
        
    endfunction

endclass


    module sv_constructor;
        packet pkt;
        
        initial begin
            pkt = new(32'h10,32'hFF,1,"GOOD_PKT");
            pkt.display();
        end
        endmodule
// ------------------------------------------------------------------------------------------------
// copiler output 

// Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Jun 12 17:46 2025
// 	 addr = 10
// 	 data = ff
// 	 write = 1
// 	 pkt_type = GOOD_PKT
//            V C S   S i m u l a t i o n   R e p o r t 
// Time: 0 ns
// CPU Time:      0.440 seconds;       Data structure size:   0.0Mb
// ------------------------------------------------------------------------------------------------

// ####################################################################################################################################################
