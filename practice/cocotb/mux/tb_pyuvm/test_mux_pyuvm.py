import cocotb
from cocotb.triggers import Timer
# from pyuvm import run_test

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
        self.drv = mux_driver("drv", self)
        self.mon = mux_monitor("mon", self)
        self.scb = mux_scoreboard("scb", self)
        self.drv.dut = self.dut
        self.mon.dut = self.dut

    def connect_phase(self):
        self.drv.seq_item_port.connect(self.seqr.seq_item_export)
        self.mon.ap.connect(self.scb.fifo.analysis_export)

class mux_uvm_test(uvm_test):
    def build_phase(self):
        self.env = mux_env("env", self)
        self.env.dut = self.dut

    async def run_phase(self):
        self.raise_objection()
        seq = mux_seq("seq")
        await seq.start(self.env.seqr)
        await Timer(2, units="ns")
        self.drop_objection()

@cocotb.test()
async def run_pyuvm(dut):
    await run_test("mux_uvm_test", dut=dut)
