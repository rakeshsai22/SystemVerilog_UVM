import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def mux_test(dut):
    dut.a.value = 0
    dut.b.value = 0
    dut.sel.value = 0
    await Timer(1, units="ns")

    assert int(dut.out.value) == 0, f"Expected out=0 (b), got {dut.out.value}"

    dut.a.value = 1
    dut.b.value = 0
    dut.sel.value = 1
    await Timer(1, units="ns")

    assert int(dut.out.value) == 1, f"Expected out=1 (a), got {dut.out.value}"


# - V e r i l a t i o n   R e p o r t: Verilator 5.038 2025-07-08 rev UNKNOWN.REV
# - Verilator: Built from 0.025 MB sources in 2 modules, into 0.028 MB in 8 C++ files needing 0.000 MB
# - Verilator: Walltime 0.032 s (elab=0.005, cvt=0.013, bld=0.000); cpu 0.009 s on 1 threads

# COCOTB_TEST_MODULES=tb_mux_py COCOTB_TESTCASE= COCOTB_TEST_FILTER= COCOTB_TOPLEVEL=mux_2x1 TOPLEVEL_LANG=verilog \
#          sim_build/Vtop     
#      -.--ns INFO     gpi                                ..mbed/gpi_embed.cpp:94   in _embed_init_python              Using Python 3.13.9 interpreter at /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/mux/cocoenv/bin/python3
#      -.--ns INFO     gpi                                ../gpi/GpiCommon.cpp:79   in gpi_print_registered_impl       VPI registered
#      0.00ns INFO     cocotb                             Running on Verilator version 5.038 2025-07-08
#      0.00ns INFO     cocotb                             Seeding Python random module with 1767317319
#      0.00ns INFO     cocotb                             Initialized cocotb v2.0.1 from /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/mux/cocoenv/lib/python3.13/site-packages/cocotb
#      0.00ns INFO     cocotb.regression                  pytest not found, install it to enable better AssertionError messages
#      0.00ns INFO     cocotb                             Running tests
#      0.00ns INFO     cocotb.regression                  running tb_mux_py.mux_test (1/1)
#      0.00ns INFO     cocotb.mux_2x1                     Start mux test
#      0.00ns WARNING  py.warnings                        /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/mux/tb_mux_py.py:37: DeprecationWarning: The 'units' argument has been renamed to 'unit'.
#                                                           await Timer(1, units="ns")
                                                        
#      1.00ns WARNING  py.warnings                        /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/mux/tb_mux_py.py:46: DeprecationWarning: The 'units' argument has been renamed to 'unit'.
#                                                           await Timer(1, units="ns")
                                                        
#      2.00ns INFO     cocotb.mux_2x1                     Mux test PASSED
#      2.00ns INFO     cocotb.regression                  tb_mux_py.mux_test passed
#      2.00ns INFO     cocotb.regression                  **************************************************************************************
#                                                         ** TEST                          STATUS  SIM TIME (ns)  REAL TIME (s)  RATIO (ns/s) **
#                                                         **************************************************************************************
#                                                         ** tb_mux_py.mux_test             PASS           2.00           0.00       3472.11  **
#                                                         **************************************************************************************
#                                                         ** TESTS=1 PASS=1 FAIL=0 SKIP=0                  2.00           0.00       1941.81  **
#                                                         **************************************************************************************
                                                        
# - :0: Verilog $finish