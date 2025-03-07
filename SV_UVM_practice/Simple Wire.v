/* In Verilog, signals flow in one direction, from a single source to multiple sinks. 
Continuous assignment in Verilog drives the right side value onto the left side wire continuously, regardless of changes in the value.
*/

module top_module( input in, output out );
    assign out = in;
endmodule
