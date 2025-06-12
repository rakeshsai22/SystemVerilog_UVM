class apb_driver extends uvm_driver #(apb_seq_item);

    virtual apb_if vif;
    `uvm_component_utils(apb_driver)

    function new(string name,uvm_component parent);
        super.new(name,parent);
        
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db #(virtual apb_if)::get(this, "","vif",vif)) begin
            `uvm_fatal("NOVIF","APB interface is not set");
        end
        
    endfunction

    task run_phase(uvm_phase phase);
        apb_seq_item req;

        forever begin
            seq_item_port.get_next_item(req);
            drive_transfer(req);
            seq_item_port.item_done();

        end
        endtask
        task drive_transfer(apb_seq_item req);
            vif.paddr <=req.addr;
            vif.pwrite<= req.write;
            vid.psel<= 1;
            vif.penable,= 0;
            vif.pwdata <= req.data;
            @(posedge vif.pclk);
            vif.penable<= 1;
            @(posedge vif.pclk);
            vif.psel <=0;
            vif.penable<=0;
            
        endtask
    
endclass