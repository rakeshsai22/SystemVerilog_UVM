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
// c4: 33% low,33% mid,33% high

module pixel_arr_top();
    
    parameter ROWS = 16;
    parameter COLS = 32;
    parameter TOTAL_PIXELS = ROWS * COLS;

    typedef logic [9:0] pixel_t;
    pixel_t pixel_arr [ROWS][COLS];

    task automatic gen_pixels_c1(output pixel_t pixels[ROWS][COLS]);
        foreach (pixels[i][j]) begin
            pixels[i][j] = $urandom_range(922,1023);
        end
        endtask

    task automatic gen_pixels_c2(output pixel_t pixels[ROWS][COLS]);
        foreach (pixels[i][j]) begin
            pixels[i][j] = $urandom_range(819,1023);
        end
    endtask

    task automatic gen_pixels_c3(output pixel_t pixels[ROWS][COLS]);
        foreach (pixels[i]) begin
            
        end
    endtask
endmodule