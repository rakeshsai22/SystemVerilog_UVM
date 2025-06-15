class reg_scoreboard extends uvm_scoreboard;

    uvm_analysis_imp #(apb_seq_item, reg_scoreboard) item_imp;
    simple_reg_block reg_blk;

    `uvm_component_utils(reg_scoreboard)

    function new(string name, uvm_component parent);
        super.new(name,parent);
        item_imp = new("item_imp",this);
        
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db #(simple_reg_block)::get(this, "", "reg_blk", reg_blk)) begin
            `uvm_fatal("SCORE","Register block not found");
        end
        
    endfunction

    function void write(apb_seq_item item);
        if(item.write) begin
            // comparing ral mirror and bus write
            uvm_reg_data_t mirrored = reg_blk.cfg_reg.get();
            if(mirrored ! == item.data) begin
                `uvm_error("SCORE",$sformatf("Mismatch: RAL mirror = 0x%0h, Bus = 0x%0h",mirrored,item.data));
            end
            else begin
                `uvm_info("SCORE","RAL mirror matches")
            end
        end
        
    endfunction
    
endclass