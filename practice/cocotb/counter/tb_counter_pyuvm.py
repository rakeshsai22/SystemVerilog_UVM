import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer

from pyuvm import (
    uvm_test, uvm_env, uvm_component,
    uvm_analysis_port, uvm_tlm_analysis_fifo,
    ConfigDB, uvm_root
)

class counter_monitor(uvm_component):
    def build_phase(self):
        self.ap = uvm_analysis_port("ap", self)
        self.dut = ConfigDB().get(self, "", "dut")

    async def run_phase(self):
        while True:
            await RisingEdge(self.dut.clk)
            self.ap.write(int(self.dut.count.value))

class counter_scoreboard(uvm_component):
    def build_phase(self):
        self.fifo = uvm_tlm_analysis_fifo("fifo", self)

    async def run_phase(self):
        expected = 0
        for i in range(20):
            got = await self.fifo.get()
            expected = (expected + 1) & 0xF
            assert got == expected, f"[SCB] cycle={i} got={got}, expected={expected}"

class counter_env(uvm_env):
    def build_phase(self):
        self.mon = counter_monitor("mon", self)
        self.scb = counter_scoreboard("scb", self)

    def connect_phase(self):
        self.mon.ap.connect(self.scb.fifo.analysis_export)

class counter_test(uvm_test):
    def build_phase(self):
        self.env = counter_env("env", self)
        self.dut = ConfigDB().get(self, "", "dut")

    async def run_phase(self):
        self.raise_objection()
        self.dut.rst_n.value = 0
        await RisingEdge(self.dut.clk)
        await RisingEdge(self.dut.clk)

        self.dut.rst_n.value = 1
        await Timer(1, units="ns")
        for _ in range(20):
            await RisingEdge(self.dut.clk)

        self.drop_objection()

@cocotb.test()
async def run_pyuvm(dut):
    cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
    ConfigDB().set(None, "*", "dut", dut)
    uvm_root().run_test("counter_test")


# - V e r i l a t i o n   R e p o r t: Verilator 5.038 2025-07-08 rev UNKNOWN.REV
# - Verilator: Built from 0.025 MB sources in 2 modules, into 0.029 MB in 8 C++ files needing 0.000 MB
# - Verilator: Walltime 0.016 s (elab=0.002, cvt=0.006, bld=0.000); cpu 0.007 s on 1 threads

# COCOTB_TEST_MODULES=tb_counter_pyuvm COCOTB_TESTCASE= COCOTB_TEST_FILTER= COCOTB_TOPLEVEL=counter TOPLEVEL_LANG=verilog \
#          sim_build/Vtop     
#      -.--ns INFO     gpi                                ..mbed/gpi_embed.cpp:94   in _embed_init_python              Using Python 3.13.9 interpreter at /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/mux/cocoenv/bin/python3
#      -.--ns INFO     gpi                                ../gpi/GpiCommon.cpp:79   in gpi_print_registered_impl       VPI registered
#      0.00ns INFO     cocotb                             Running on Verilator version 5.038 2025-07-08
#      0.00ns INFO     cocotb                             Seeding Python random module with 1767835438
#      0.00ns INFO     cocotb                             Initialized cocotb v2.0.1 from /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/mux/cocoenv/lib/python3.13/site-packages/cocotb
#      0.00ns INFO     cocotb.regression                  pytest not found, install it to enable better AssertionError messages
#      0.00ns INFO     cocotb                             Running tests
#      0.00ns INFO     cocotb.regression                  running tb_counter_pyuvm.run_pyuvm (1/1)
#      0.00ns WARNING  py.warnings                        /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/counter/tb_counter_pyuvm.py:69: DeprecationWarning: The 'units' argument has been renamed to 'unit'.
#                                                           cocotb.start_soon(Clock(dut.clk, 10, units="ns").start())
                                                        
#      0.00ns WARNING  py.warnings                        /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/counter/tb_counter_pyuvm.py:75: RuntimeWarning: coroutine 'uvm_root.run_test' was never awaited
#                                                           uvm_root().run_test("counter_test")
                                                        
#      0.00ns INFO     cocotb.regression                  tb_counter_pyuvm.run_pyuvm passed
#      0.00ns INFO     cocotb.regression                  **************************************************************************************
#                                                         ** TEST                          STATUS  SIM TIME (ns)  REAL TIME (s)  RATIO (ns/s) **
#                                                         **************************************************************************************
#                                                         ** tb_counter_pyuvm.run_pyuvm     PASS           0.00           0.00          0.00  **
#                                                         **************************************************************************************
#                                                         ** TESTS=1 PASS=1 FAIL=0 SKIP=0                  0.00           0.00          0.00  **
#                                                         **************************************************************************************
                                                        
# - :0: Verilog $finish