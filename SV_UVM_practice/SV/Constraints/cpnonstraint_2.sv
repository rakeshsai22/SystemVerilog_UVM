class pattern;

    rand int a[];
    constrinat size {a.size==10;}
    constraint mirror {foreach(a[i]) if(i%2==0) a[i]==0; else a[i]==(i+1)/2;}

endclass

module top;
    pattern p1;
    initial begin
        p1=new();
        p1.randomize();
        foreach(p1.a[i]) $display("a[%0d]=%0d",i,p1.a[i]);
    end
    
endmodule