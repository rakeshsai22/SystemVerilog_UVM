SIM ?= verilator
TOPLEVEL_LANG ?= verilog
TOPLEVEL := counter

PWD := $(shell pwd)
VERILOG_SOURCES := $(PWD)/rtl/counter.sv

export CXXFLAGS += -std=c++17

# Use cocotb with python module path
# Choose one:
MODULE := counter_test
PYTHONPATH := $(PWD)/tb_counter_py
export PYTHONPATH

# MODULE := tb_counter_pyuvm
# PYTHONPATH := $(PWD)/tb_counter_pyuvm
# export PYTHONPATH

include $(shell cocotb-config --makefiles)/Makefile.sim
