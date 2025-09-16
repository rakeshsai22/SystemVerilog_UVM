// Driving logic and wire in an interface
interface async_if;
    logic l;
    wire w;
endinterface

module tb_top (
    async_if ascif
)
    logic local_wire;
    ascif.w = local_wire;

    initial begin
        ascif.l<=0;
        local_wire<=1;
    end
endmodule