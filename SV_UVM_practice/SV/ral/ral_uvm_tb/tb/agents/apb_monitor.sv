class apb_monitor extends uvm_monitor;

    virtual apb_if vif;
    uvm_analysis_port #(apb_seq_item) mon_ap;

    `uvm_component_utils(apb_monitor)

    function new(string name, uvm_component parent);
        super.new(name,parent);
        mon_ap= new("mon_ap",this);
        
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db #(virtual apb_if)::get(this,"","vif",vif)) begin
            `uvm_fatal("NOVIF","APB interface not set")
        end
        
    endfunction

    task run_phase(uvm_phase phase);
        forever begin
            @(posedge vif.pclk);
            if(vif.psel && vif.penable) begin
                apb_seq_item tx = apb_seq_item::type_id::create("tx");
                tx.addr = vif.paddr;
                tx.write = vif.pwrite;
                tx.data = vif.pwdata;
                mon_ap.write(tx);
            end
        end
        endtask

endclass