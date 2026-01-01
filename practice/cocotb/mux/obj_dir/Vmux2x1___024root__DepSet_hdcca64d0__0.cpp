// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vmux2x1.h for the primary calling header

#include "Vmux2x1__pch.h"
#include "Vmux2x1___024root.h"

void Vmux2x1___024root___ico_sequent__TOP__0(Vmux2x1___024root* vlSelf);

void Vmux2x1___024root___eval_ico(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_ico\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VicoTriggered.word(0U))) {
        Vmux2x1___024root___ico_sequent__TOP__0(vlSelf);
    }
}

VL_INLINE_OPT void Vmux2x1___024root___ico_sequent__TOP__0(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___ico_sequent__TOP__0\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.out = ((IData)(vlSelfRef.sel) ? (IData)(vlSelfRef.a)
                      : (IData)(vlSelfRef.b));
}

void Vmux2x1___024root___eval_triggers__ico(Vmux2x1___024root* vlSelf);

bool Vmux2x1___024root___eval_phase__ico(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_phase__ico\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VicoExecute;
    // Body
    Vmux2x1___024root___eval_triggers__ico(vlSelf);
    __VicoExecute = vlSelfRef.__VicoTriggered.any();
    if (__VicoExecute) {
        Vmux2x1___024root___eval_ico(vlSelf);
    }
    return (__VicoExecute);
}

void Vmux2x1___024root___eval_act(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_act\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void Vmux2x1___024root___eval_nba(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_nba\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void Vmux2x1___024root___eval_triggers__act(Vmux2x1___024root* vlSelf);

bool Vmux2x1___024root___eval_phase__act(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_phase__act\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<0> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vmux2x1___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        Vmux2x1___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vmux2x1___024root___eval_phase__nba(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_phase__nba\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vmux2x1___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmux2x1___024root___dump_triggers__ico(Vmux2x1___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vmux2x1___024root___dump_triggers__nba(Vmux2x1___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vmux2x1___024root___dump_triggers__act(Vmux2x1___024root* vlSelf);
#endif  // VL_DEBUG

void Vmux2x1___024root___eval(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VicoIterCount;
    CData/*0:0*/ __VicoContinue;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VicoIterCount = 0U;
    vlSelfRef.__VicoFirstIteration = 1U;
    __VicoContinue = 1U;
    while (__VicoContinue) {
        if (VL_UNLIKELY(((0x64U < __VicoIterCount)))) {
#ifdef VL_DEBUG
            Vmux2x1___024root___dump_triggers__ico(vlSelf);
#endif
            VL_FATAL_MT("mux2x1.sv", 3, "", "Input combinational region did not converge.");
        }
        __VicoIterCount = ((IData)(1U) + __VicoIterCount);
        __VicoContinue = 0U;
        if (Vmux2x1___024root___eval_phase__ico(vlSelf)) {
            __VicoContinue = 1U;
        }
        vlSelfRef.__VicoFirstIteration = 0U;
    }
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY(((0x64U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vmux2x1___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("mux2x1.sv", 3, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY(((0x64U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vmux2x1___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("mux2x1.sv", 3, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (Vmux2x1___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (Vmux2x1___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vmux2x1___024root___eval_debug_assertions(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_debug_assertions\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY(((vlSelfRef.a & 0xfeU)))) {
        Verilated::overWidthError("a");}
    if (VL_UNLIKELY(((vlSelfRef.b & 0xfeU)))) {
        Verilated::overWidthError("b");}
    if (VL_UNLIKELY(((vlSelfRef.sel & 0xfeU)))) {
        Verilated::overWidthError("sel");}
}
#endif  // VL_DEBUG
