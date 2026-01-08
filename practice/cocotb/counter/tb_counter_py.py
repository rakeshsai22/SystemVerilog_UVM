import cocotb
from cocotb.triggers import RisingEdge, Timer, ReadOnly 
from cocotb.clock import Clock

@cocotb.test()
async def test_counter(dut):
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    dut.rst_n.value = 0
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)

    dut.rst_n.value = 1
    # await Timer(1, units="ns")

    exp = 0
    for i in range(20):
        await RisingEdge(dut.clk)
        await ReadOnly()

        got = int(dut.count.value)
        exp = (exp + 1) & 0xF
        assert got == exp, f"Mismatch at cycle {i}: got={got}, expected={exp}"

# - V e r i l a t i o n   R e p o r t: Verilator 5.038 2025-07-08 rev UNKNOWN.REV
# - Verilator: Built from 0.025 MB sources in 2 modules, into 0.030 MB in 8 C++ files needing 0.000 MB
# - Verilator: Walltime 0.017 s (elab=0.002, cvt=0.006, bld=0.000); cpu 0.008 s on 1 threads


# COCOTB_TEST_MODULES=tb_counter_py COCOTB_TESTCASE= COCOTB_TEST_FILTER= COCOTB_TOPLEVEL=counter TOPLEVEL_LANG=verilog \
#          sim_build/Vtop     
#      -.--ns INFO     gpi                                ..mbed/gpi_embed.cpp:94   in _embed_init_python              Using Python 3.13.9 interpreter at /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/mux/cocoenv/bin/python3
#      -.--ns INFO     gpi                                ../gpi/GpiCommon.cpp:79   in gpi_print_registered_impl       VPI registered
#      0.00ns INFO     cocotb                             Running on Verilator version 5.038 2025-07-08
#      0.00ns INFO     cocotb                             Seeding Python random module with 1767835064
#      0.00ns INFO     cocotb                             Initialized cocotb v2.0.1 from /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/mux/cocoenv/lib/python3.13/site-packages/cocotb
#      0.00ns INFO     cocotb.regression                  pytest not found, install it to enable better AssertionError messages
#      0.00ns INFO     cocotb                             Running tests
#      0.00ns INFO     cocotb.regression                  running tb_counter_py.test_counter (1/1)
#      0.00ns WARNING  py.warnings                        /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/counter/tb_counter_py.py:7: DeprecationWarning: The 'units' argument has been renamed to 'unit'.
#                                                           cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
                                                        
#    210.00ns INFO     cocotb.regression                  tb_counter_py.test_counter passed
#    210.00ns INFO     cocotb.regression                  **************************************************************************************
#                                                         ** TEST                          STATUS  SIM TIME (ns)  REAL TIME (s)  RATIO (ns/s) **
#                                                         **************************************************************************************
#                                                         ** tb_counter_py.test_counter     PASS         210.00           0.00     444177.43  **
#                                                         **************************************************************************************
#                                                         ** TESTS=1 PASS=1 FAIL=0 SKIP=0                210.00           0.00     301232.50  **
#                                                         **************************************************************************************
                                                        
# - :0: Verilog $finish