interface apb_if(inputs log pclk);
    logic psel,penable,pwrite;
    logic [7:0] paddr,pwdata;
endinterface