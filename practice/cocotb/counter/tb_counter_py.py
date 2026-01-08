import cocotb
from cocotb.triggers import RisingEdge, Timer
from cocotb.clock import Clock

@cocotb.test()
async def counter_test(dut):
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    dut.rst_n.value = 0
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)

    dut.rst_n.value = 1
    await Timer(1, units="ns")

    exp = 0
    for i in range(20):
        await RisingEdge(dut.clk)

        got = int(dut.count.value)
        dut._log.info(f"cycle={i:02d} count={got} (0x{got:x})")

        exp = (exp + 1) & 0xF
        assert got == exp, f"Mismatch at cycle {i}: got={got}, expected={exp}"
