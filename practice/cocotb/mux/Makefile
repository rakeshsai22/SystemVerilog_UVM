##MODULE = mux_tb

# cocotb's make rules for simulator setup
##include $(shell cocotb-config --makefiles)/Makefile.sim
export CXXFLAGS += -std=c++17

SIM?= verilator

TOPLEVLE_LANG ?= verilog

PWD=$(shell pwd)
VERILOG_SOURCES= $(PWD)/mux_2x1.sv

TOPLEVEL := mux_2x1
# MODULE := tb_mux_py
PYTHONPATH := $(PWD)/tb_pyuvm
export PYTHONPATH
MODULE := test_mux_pyuvm

include $(shell cocotb-config --makefiles)/Makefile.sim