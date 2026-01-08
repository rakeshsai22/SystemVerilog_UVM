import cocotb
from cocotb.triggers import Timer
# from pyuvm import run_test
from pyuvm import ConfigDB, uvm_root

from pyuvm import (
    uvm_test, uvm_env, uvm_component,
    uvm_driver, uvm_sequence, uvm_sequencer,
    uvm_sequence_item, uvm_analysis_port,
    uvm_tlm_analysis_fifo
)

class mux_item(uvm_sequence_item):
    def __init__(self, name="mux_item"):
        super().__init__(name)
        self.a = 0
        self.b = 0
        self.sel = 0
        self.exp = 0

class mux_seq(uvm_sequence):
    async def body(self):
        vectors = [
            (0, 0, 0, 0), # (a, b, sel, exp)
            (0, 1, 0, 1),  
            (1, 0, 1, 1), 
            (1, 1, 1, 1),
        ]
        for i, (a, b, sel, exp) in enumerate(vectors):
            it = mux_item(f"it_{i}")
            it.a, it.b, it.sel, it.exp = a, b, sel, exp
            await self.start_item(it)
            await self.finish_item(it)

class mux_driver(uvm_driver):
    async def run_phase(self):
        while True:
            it = await self.seq_item_port.get_next_item()
            self.dut.a.value = it.a
            self.dut.b.value = it.b
            self.dut.sel.value = it.sel
            await Timer(1, units="ns")
            self.seq_item_port.item_done()

class mux_monitor(uvm_component):
    def build_phase(self):
        self.ap = uvm_analysis_port("ap", self)

    async def run_phase(self):
        while True:
            await Timer(1, units="ns")
            tr = mux_item("mon_tr")
            tr.a = int(self.dut.a.value)
            tr.b = int(self.dut.b.value)
            tr.sel = int(self.dut.sel.value)
            tr.exp = int(self.dut.out.value)
            self.ap.write(tr)

class mux_scoreboard(uvm_component):
    def build_phase(self):
        self.fifo = uvm_tlm_analysis_fifo("fifo", self)

    def connect_phase(self):
        pass

    async def run_phase(self):
        while True:
            tr = await self.fifo.get()
            expected = tr.a if tr.sel else tr.b
            assert tr.exp == expected, f"Mismatch: a={tr.a} b={tr.b} sel={tr.sel} got={tr.exp} exp={expected}"

class mux_env(uvm_env):
    def build_phase(self):
        self.seqr = uvm_sequencer("seqr", self)
        self.drv  = mux_driver("drv", self)
        self.mon  = mux_monitor("mon", self)
        self.scb  = mux_scoreboard("scb", self)
        self.dut = ConfigDB().get(self, "", "dut")
        self.drv.dut = self.dut
        self.mon.dut = self.dut

    def connect_phase(self):
        self.drv.seq_item_port.connect(self.seqr.seq_item_export)
        self.mon.ap.connect(self.scb.fifo.analysis_export)

class mux_uvm_test(uvm_test):
    def build_phase(self):
        self.env = mux_env("env", self)

    async def run_phase(self):
        self.raise_objection()
        seq = mux_seq("seq")
        await seq.start(self.env.seqr)
        await Timer(2, units="ns")
        self.drop_objection()

@cocotb.test()
async def run_pyuvm(dut):
    ConfigDB().set(None, "*", "dut", dut)
    uvm_root().run_test("mux_uvm_test")


# - V e r i l a t i o n   R e p o r t: Verilator 5.038 2025-07-08 rev UNKNOWN.REV
# - Verilator: Built from 0.025 MB sources in 2 modules, into 0.028 MB in 8 C++ files needing 0.000 MB
# - Verilator: Walltime 0.016 s (elab=0.002, cvt=0.006, bld=0.000); cpu 0.007 s on 1 threads
# /Applications/Xcode.app/Contents/Developer/usr/bin/make -C sim_build  -f Vtop.mk

# COCOTB_TEST_MODULES=test_mux_pyuvm COCOTB_TESTCASE= COCOTB_TEST_FILTER= COCOTB_TOPLEVEL=mux_2x1 TOPLEVEL_LANG=verilog \
#          sim_build/Vtop     
#      -.--ns INFO     gpi                                ..mbed/gpi_embed.cpp:94   in _embed_init_python              Using Python 3.13.9 interpreter at /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/mux/cocoenv/bin/python3
#      -.--ns INFO     gpi                                ../gpi/GpiCommon.cpp:79   in gpi_print_registered_impl       VPI registered
#      0.00ns INFO     cocotb                             Running on Verilator version 5.038 2025-07-08
#      0.00ns INFO     cocotb                             Seeding Python random module with 1767830827
#      0.00ns INFO     cocotb                             Initialized cocotb v2.0.1 from /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/mux/cocoenv/lib/python3.13/site-packages/cocotb
#      0.00ns INFO     cocotb.regression                  pytest not found, install it to enable better AssertionError messages
#      0.00ns INFO     cocotb                             Running tests
#      0.00ns INFO     cocotb.regression                  running test_mux_pyuvm.run_pyuvm (1/1)
#      0.00ns WARNING  py.warnings                        /Users/srisairakeshnakkilla/EDA/Projects/practice/cocotb/mux/tb_pyuvm/test_mux_pyuvm.py:100: RuntimeWarning: coroutine 'uvm_root.run_test' was never awaited
#                                                           uvm_root().run_test("mux_uvm_test")
                                                        
#      0.00ns INFO     cocotb.regression                  test_mux_pyuvm.run_pyuvm passed
#      0.00ns INFO     cocotb.regression                  **************************************************************************************
#                                                         ** TEST                          STATUS  SIM TIME (ns)  REAL TIME (s)  RATIO (ns/s) **
#                                                         **************************************************************************************
#                                                         ** test_mux_pyuvm.run_pyuvm       PASS           0.00           0.00          0.00  **
#                                                         **************************************************************************************
#                                                         ** TESTS=1 PASS=1 FAIL=0 SKIP=0                  0.00           0.00          0.00  **
#                                                         **************************************************************************************
                                                        
# - :0: Verilog $finish