// $urandom : function returns a new 32-bit unsigned random number each time it is called.
// syntax: var = $urandom(seed);
// $urandom_range(min,max) : function returns a new 32-bit unsigned random number in the range [min,max] each time it is called.
// Scope randomize function
//  randomize()
//      scope randomize function randomize(), ebnables users to randomize the variables in the current scope.
//      variables passed as arguments are randomized (no limit on no of variables)
//      variables in th econstrain block and not passed as args to randomize() are not randomized

//  Randomizing a class object, rand and randc are used
//  rand : randomizing an object, the rand keyword provides uniformly distributed random values
//    syntax: rand bit [1:0] val; >> possible values are 2'b00,2'b01,2'b00,2'b10,2'b11
//  randc: provides random values in cyclic nature without repeating the same value unless a complete range is covered
//    syntax: randc bit [1:0] val; >> possible values are 2'b00,2'b01,2'b10,2'b11

// Contraints in randomization

// Syntax: 
// constraint <const_name> { <expression/condition>;}
// constraint <const_name> { <expression/condition>;<expression/condition>;}
// Keywords : inside,unique,dist,soft,solve before,Extern,static

class myPacket;
// 
    rand bit [1:0] mode;
    randc bit [2:0] key;

    constraint c_model {mode < 3;}
    // constraint c_key {key inside {[3:7]};}
    constraint c_key1 {key > 2; key < 7;}

    function display();
        $display("Mode : 0x%0h Key : 0x%0h",mode,key);
    endfunction
endclass

module tb_top;

myPacket pkt;
initial begin
    pkt = new();
    for (int i =0;i<15;i++) begin
        assert (pkt.randomize());
        pkt.display();
    end
end
endmodule