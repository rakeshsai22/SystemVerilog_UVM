module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    assign p2y = ((p2a&p2b)|(p2c&p2d));
    assign p1y = ((p1a&p1b&p1c)|(p1d&p1e&p1f));

endmodule

/*  Using wires 

module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire w1 = (p2a&p2b);
    wire w2 = (p2c&p2d);
    wire w3 = (p1a&p1b&p1c);
    wire w4 = (p1d&p1e&p1f);
    assign p2y = (w1|w2);
    assign p1y = (w3|w4);

endmodule
*/
# Simulation finished at 2196 ps
