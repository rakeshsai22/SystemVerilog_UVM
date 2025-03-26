// task A: runs for 50us
task sub_run_a();
    while($time < 50us) begin#1us;
    $diaplsy("sub_run_a(): ping at time %d",$time);
    
endtask