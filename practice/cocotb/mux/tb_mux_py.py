import cocotb
from cocotb.triggers import Timer
from cocotb.result import TestFailure

@cocotb.test()  # declares a function as a test
async def mux_test(dut):
    dut.log.info('start of the test')
    await Timer(1,'ns')

    dut.log.info('Drive inputs of Mux')
    dut.a = 0
    dut.b = 0

    await Timer(1,'ns')

    dut.log.info('Drive sel and a')
    dut.a = 1
    dut.sel = 1
    
    await Timer(1,'ns')

    if dut.out !=1:
        raise TestFailure('Output is incorrect' % OUT: str(dut.out))
    
