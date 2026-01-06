// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcounter.h for the primary calling header

#include "Vcounter__pch.h"
#include "Vcounter__Syms.h"
#include "Vcounter___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcounter___024root___dump_triggers__ico(Vcounter___024root* vlSelf);
#endif  // VL_DEBUG

void Vcounter___024root___eval_triggers__ico(Vcounter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcounter___024root___eval_triggers__ico\n"); );
    Vcounter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VicoTriggered.setBit(0U, (IData)(vlSelfRef.__VicoFirstIteration));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vcounter___024root___dump_triggers__ico(vlSelf);
    }
#endif
}

VL_INLINE_OPT void Vcounter___024root___ico_sequent__TOP__0(Vcounter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcounter___024root___ico_sequent__TOP__0\n"); );
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
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vcounter___024root___dump_triggers__act(Vcounter___024root* vlSelf);
#endif  // VL_DEBUG

void Vcounter___024root___eval_triggers__act(Vcounter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcounter___024root___eval_triggers__act\n"); );
    Vcounter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.setBit(0U, ((IData)(vlSelfRef.clk) 
                                          & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clk__0))));
    vlSelfRef.__VactTriggered.setBit(1U, ((~ (IData)(vlSelfRef.rst_n)) 
                                          & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__rst_n__0)));
    vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
    vlSelfRef.__Vtrigprevexpr___TOP__rst_n__0 = vlSelfRef.rst_n;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vcounter___024root___dump_triggers__act(vlSelf);
    }
#endif
}

VL_INLINE_OPT void Vcounter___024root___nba_sequent__TOP__0(Vcounter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcounter___024root___nba_sequent__TOP__0\n"); );
    Vcounter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (vlSelfRef.rst_n) {
        vlSelfRef.count = (0xfU & ((IData)(1U) + (IData)(vlSelfRef.count)));
        ++(vlSymsp->__Vcoverage[7]);
    } else {
        ++(vlSymsp->__Vcoverage[6]);
        vlSelfRef.count = 0U;
    }
    if ((1U & (~ (IData)(vlSelfRef.rst_n)))) {
        ++(vlSymsp->__Vcoverage[8]);
    }
    if (vlSelfRef.rst_n) {
        ++(vlSymsp->__Vcoverage[9]);
    }
    ++(vlSymsp->__Vcoverage[10]);
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
