// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vmux_2x1.h for the primary calling header

#include "Vmux_2x1__pch.h"
#include "Vmux_2x1__Syms.h"
#include "Vmux_2x1___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmux_2x1___024root___dump_triggers__stl(Vmux_2x1___024root* vlSelf);
#endif  // VL_DEBUG

VL_ATTR_COLD void Vmux_2x1___024root___eval_triggers__stl(Vmux_2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux_2x1___024root___eval_triggers__stl\n"); );
    Vmux_2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VstlTriggered.setBit(0U, (IData)(vlSelfRef.__VstlFirstIteration));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vmux_2x1___024root___dump_triggers__stl(vlSelf);
    }
#endif
}
