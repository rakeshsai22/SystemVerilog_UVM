##MODULE = mux_tb

# cocotb's make rules for simulator setup
##include $(shell cocotb-config --makefiles)/Makefile.sim

SIM?= verilator

TOPLEVLE_LANG ?= verilog

PWD=$(shell pwd)
VERILOG_SOURCES= $(PWD)/mux2x1.sv

TOPLEVEL := mux_2x1
MODULE := test_mux

include $(shell cocotb-config --makefiles)/Makefile.sim