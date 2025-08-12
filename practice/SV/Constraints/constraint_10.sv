// Generate a pixel array  16Hx32H,  pixel of 10 bit data( 0…1024)
    //  C1 : 10% range of high value ( all pixels has to be in the range of  (10% of 1024 – 1024)
    //  C2  :  20% of mid values ( 20% of 1024 – 1024)
    //  C3  :  10% of low pixels and 10% of high pixels
    //  C4  :   equal distribution of low’s, mids and high pixels


// Pixel array : 16 x 32 = 512
// pixel width: 10bit [9:0]

// low : [0,341]
// mid : [342, 682]
// high: [683, 1023]

// c1: [922,1023]
// c2: [819,1023]
// c3: 10% low + 10% high + 80% mid
// c4: 33% low,33% mid,33% higha


class Pixel;
    
    rand logic [9:0] value;

    // C1: 10% high values only (>= 922)

    constraint c_1 {
        value inside {[922:1023]};
    }

    // c2: 20% high values only(>= 819)
    constraint c_2 {
        value inside {[819:1023]};
    }

    constraint c_3 {
        value inside {[0:1023]};
    }

    function void display();
        $display("Pixel = %0d", value);
    endfunction
endclass

module pixel_tb();
    
    parameter int ROWS  = 16;
    parameter int COLS  = 32;
    parameter int TOTAL = ROWS * COLS;

    Pixel pixels[TOTAL];

    initial begin
        foreach (pixels[i]) begin
            pixels[i] = new();
        end
        $display("C1:100% high(>= 922)");
        foreach (pixels[i]) begin
            assert(pixels[i].randomize() with { value inside {[922:1023]}; });
        end

        $display("C2: 100% Low,80% Mid, 10% High");
        int low = TOTAL * 0.10;
        int mid = TOTAL * 0.80;
        int high = TOTAL - low - mid;

        foreach (pixels[i]) begin
            if(i<low) begin
                assert(pixels[i].randomize() with { value inside {[0:341]}; });
            end
            else if (i< (low+mid)) begin
                assert(pixels[i].randomize() with { value inside {[342:682]}; });
            end
            else begin
                assert(pixels[i].randomize() with { value inside {[683:1023]}; });
            end

        end

        // C4: Equal low/mid/high
        $display("C4: equal low/mid/high")
        int each = TOTAL/3;
        foreach (pixels[i]) begin
            if(i<each) begin
                assert(pixels[i].randomize() with { value inside {[0:341]}; });
            end
            else if(i< 2* each) begin
                assert(pixels[i].randomize() with { value inside {[342:682]}; });
            end
            else begin
                assert(pixels[i].randomize() with { value inside {[683:1023]}; });
            end
        end

        foreach (pixels[i]) begin
            if(i%50 == 0) 
                pixels[i].display();
        end
        $finish;
    end
endmodule