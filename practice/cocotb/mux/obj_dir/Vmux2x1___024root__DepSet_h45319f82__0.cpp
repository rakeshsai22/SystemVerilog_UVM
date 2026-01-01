// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vmux2x1.h for the primary calling header

#include "Vmux2x1__pch.h"
#include "Vmux2x1__Syms.h"
#include "Vmux2x1___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmux2x1___024root___dump_triggers__ico(Vmux2x1___024root* vlSelf);
#endif  // VL_DEBUG

void Vmux2x1___024root___eval_triggers__ico(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_triggers__ico\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VicoTriggered.setBit(0U, (IData)(vlSelfRef.__VicoFirstIteration));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vmux2x1___024root___dump_triggers__ico(vlSelf);
    }
#endif
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmux2x1___024root___dump_triggers__act(Vmux2x1___024root* vlSelf);
#endif  // VL_DEBUG

void Vmux2x1___024root___eval_triggers__act(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_triggers__act\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vmux2x1___024root___dump_triggers__act(vlSelf);
    }
#endif
}
