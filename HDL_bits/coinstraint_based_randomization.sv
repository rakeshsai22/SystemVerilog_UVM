// constrina based randomization
// constraints should not contradict each other, else randomizaiton will fail at runtime

class myPacket;
    rand bit [7:0] mode;
    randc bit [7:0] key;
    int low,high;

    constraint c_simple {mode > 2; key ==3;}
    // constraint c_key {key<2;} >> this will fail the randomization
    coinstraint c_range {key inside {[low:high]}; mode inside {[21:50]}; mode inside {[23,24,51]};}
    cosntraint c_invert {!(key inside {[2:5]});} //key can be nayvalue other than 2,3,4,5
    constraint c_weight {mode inside {10,10,10,22,22};} // mode can be 10,22 with 50% probability
    constraint c_dist {mode dist {10:=50,22:=50};} // mode can be 10,22 with 50% probability
    constraint c_key_dist { key dist {4:=50, 43:=20, [45:90]:=70};} // 4 has 50/140 probability, 43 has 20/140 probability, 45-90 has 70/140 probability
    constraint c_mode_dist { mode dist {4:/10,43:/30, [45:70]:/60};} // 4 has 10/100 probability, 43 has 30/100 probability, 45-70 has 60/100 probability

    function void pre_randomize();
        this.low =1;
        this.high =2;
    endfunction
endclass