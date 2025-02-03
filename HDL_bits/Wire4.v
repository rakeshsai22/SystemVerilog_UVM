/* The order of multiple assign statements does not affect their behavior. In contrast to programming languages, 
Verilog assign statements (or "continuous assignments") define connections between elements rather than simply copying values from one to another.
*/

module top_module( 
    input a,b,c,
    output w,x,y,z );
    assign {w,x,y,z} = {a,b,b,c};
endmodule
