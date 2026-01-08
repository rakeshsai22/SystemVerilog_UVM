SIM ?= verilator
TOPLEVEL_LANG ?= verilog
TOPLEVEL := counter

PWD := $(shell pwd)
VERILOG_SOURCES := $(PWD)/rtl/counter.sv

export CXXFLAGS += -std=c++17

# MODULE := tb_counter_py
# PYTHONPATH := $(PWD)
# export PYTHONPATH

MODULE := tb_counter_pyuvm
PYTHONPATH := $(PWD)
export PYTHONPATH

include $(shell cocotb-config --makefiles)/Makefile.sim
