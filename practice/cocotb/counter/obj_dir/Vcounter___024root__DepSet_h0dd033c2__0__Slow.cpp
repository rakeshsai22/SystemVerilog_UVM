// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcounter.h for the primary calling header

#include "Vcounter__pch.h"
#include "Vcounter__Syms.h"
#include "Vcounter___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcounter___024root___dump_triggers__stl(Vcounter___024root* vlSelf);
#endif  // VL_DEBUG

VL_ATTR_COLD void Vcounter___024root___eval_triggers__stl(Vcounter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcounter___024root___eval_triggers__stl\n"); );
    Vcounter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VstlTriggered.setBit(0U, (IData)(vlSelfRef.__VstlFirstIteration));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vcounter___024root___dump_triggers__stl(vlSelf);
    }
#endif
}

VL_ATTR_COLD void Vcounter___024root___stl_sequent__TOP__0(Vcounter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcounter___024root___stl_sequent__TOP__0\n"); );
    Vcounter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (((IData)(vlSelfRef.clk) ^ (IData)(vlSelfRef.counter__DOT____Vtogcov__clk))) {
        ++(vlSymsp->__Vcoverage[0]);
        vlSelfRef.counter__DOT____Vtogcov__clk = vlSelfRef.clk;
    }
    if (((IData)(vlSelfRef.rst_n) ^ (IData)(vlSelfRef.counter__DOT____Vtogcov__rst_n))) {
        ++(vlSymsp->__Vcoverage[1]);
        vlSelfRef.counter__DOT____Vtogcov__rst_n = vlSelfRef.rst_n;
    }
    if ((1U & ((IData)(vlSelfRef.count) ^ (IData)(vlSelfRef.counter__DOT____Vtogcov__count)))) {
        ++(vlSymsp->__Vcoverage[2]);
        vlSelfRef.counter__DOT____Vtogcov__count = 
            ((0xeU & (IData)(vlSelfRef.counter__DOT____Vtogcov__count)) 
             | (1U & (IData)(vlSelfRef.count)));
    }
    if ((2U & ((IData)(vlSelfRef.count) ^ (IData)(vlSelfRef.counter__DOT____Vtogcov__count)))) {
        ++(vlSymsp->__Vcoverage[3]);
        vlSelfRef.counter__DOT____Vtogcov__count = 
            ((0xdU & (IData)(vlSelfRef.counter__DOT____Vtogcov__count)) 
             | (2U & (IData)(vlSelfRef.count)));
    }
    if ((4U & ((IData)(vlSelfRef.count) ^ (IData)(vlSelfRef.counter__DOT____Vtogcov__count)))) {
        ++(vlSymsp->__Vcoverage[4]);
        vlSelfRef.counter__DOT____Vtogcov__count = 
            ((0xbU & (IData)(vlSelfRef.counter__DOT____Vtogcov__count)) 
             | (4U & (IData)(vlSelfRef.count)));
    }
    if ((8U & ((IData)(vlSelfRef.count) ^ (IData)(vlSelfRef.counter__DOT____Vtogcov__count)))) {
        ++(vlSymsp->__Vcoverage[5]);
        vlSelfRef.counter__DOT____Vtogcov__count = 
            ((7U & (IData)(vlSelfRef.counter__DOT____Vtogcov__count)) 
             | (8U & (IData)(vlSelfRef.count)));
    }
}

VL_ATTR_COLD void Vcounter___024root___configure_coverage(Vcounter___024root* vlSelf, bool first) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcounter___024root___configure_coverage\n"); );
    Vcounter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    (void)first;  // Prevent unused variable warning
    vlSelf->__vlCoverInsert(&(vlSymsp->__Vcoverage[0]), first, "counter.sv", 2, 17, ".counter", "v_toggle/counter", "clk", "");
    vlSelf->__vlCoverInsert(&(vlSymsp->__Vcoverage[1]), first, "counter.sv", 3, 17, ".counter", "v_toggle/counter", "rst_n", "");
    vlSelf->__vlCoverInsert(&(vlSymsp->__Vcoverage[2]), first, "counter.sv", 4, 24, ".counter", "v_toggle/counter", "count[0]", "");
    vlSelf->__vlCoverInsert(&(vlSymsp->__Vcoverage[3]), first, "counter.sv", 4, 24, ".counter", "v_toggle/counter", "count[1]", "");
    vlSelf->__vlCoverInsert(&(vlSymsp->__Vcoverage[4]), first, "counter.sv", 4, 24, ".counter", "v_toggle/counter", "count[2]", "");
    vlSelf->__vlCoverInsert(&(vlSymsp->__Vcoverage[5]), first, "counter.sv", 4, 24, ".counter", "v_toggle/counter", "count[3]", "");
    vlSelf->__vlCoverInsert(&(vlSymsp->__Vcoverage[6]), first, "counter.sv", 8, 9, ".counter", "v_branch/counter", "if", "8-9");
    vlSelf->__vlCoverInsert(&(vlSymsp->__Vcoverage[7]), first, "counter.sv", 8, 10, ".counter", "v_branch/counter", "else", "11-12");
    vlSelf->__vlCoverInsert(&(vlSymsp->__Vcoverage[8]), first, "counter.sv", 8, 13, ".counter", "v_expr/counter", "(rst_n==0) => 1", "");
    vlSelf->__vlCoverInsert(&(vlSymsp->__Vcoverage[9]), first, "counter.sv", 8, 13, ".counter", "v_expr/counter", "(rst_n==1) => 0", "");
    vlSelf->__vlCoverInsert(&(vlSymsp->__Vcoverage[10]), first, "counter.sv", 7, 5, ".counter", "v_line/counter", "block", "7");
}
