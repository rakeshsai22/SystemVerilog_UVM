// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vmux2x1.h for the primary calling header

#include "Vmux2x1__pch.h"
#include "Vmux2x1___024root.h"

VL_ATTR_COLD void Vmux2x1___024root___eval_static(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_static\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vmux2x1___024root___eval_initial(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_initial\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vmux2x1___024root___eval_final(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_final\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmux2x1___024root___dump_triggers__stl(Vmux2x1___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vmux2x1___024root___eval_phase__stl(Vmux2x1___024root* vlSelf);

VL_ATTR_COLD void Vmux2x1___024root___eval_settle(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_settle\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VstlIterCount;
    CData/*0:0*/ __VstlContinue;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        if (VL_UNLIKELY(((0x64U < __VstlIterCount)))) {
#ifdef VL_DEBUG
            Vmux2x1___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("mux2x1.sv", 3, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (Vmux2x1___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelfRef.__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmux2x1___024root___dump_triggers__stl(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___dump_triggers__stl\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VstlTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

void Vmux2x1___024root___ico_sequent__TOP__0(Vmux2x1___024root* vlSelf);

VL_ATTR_COLD void Vmux2x1___024root___eval_stl(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_stl\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        Vmux2x1___024root___ico_sequent__TOP__0(vlSelf);
    }
}

VL_ATTR_COLD void Vmux2x1___024root___eval_triggers__stl(Vmux2x1___024root* vlSelf);

VL_ATTR_COLD bool Vmux2x1___024root___eval_phase__stl(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___eval_phase__stl\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    Vmux2x1___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelfRef.__VstlTriggered.any();
    if (__VstlExecute) {
        Vmux2x1___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmux2x1___024root___dump_triggers__ico(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___dump_triggers__ico\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VicoTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VicoTriggered.word(0U))) {
        VL_DBG_MSGF("         'ico' region trigger index 0 is active: Internal 'ico' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmux2x1___024root___dump_triggers__act(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___dump_triggers__act\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vmux2x1___024root___dump_triggers__nba(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___dump_triggers__nba\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vmux2x1___024root___ctor_var_reset(Vmux2x1___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmux2x1___024root___ctor_var_reset\n"); );
    Vmux2x1__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->name());
    vlSelf->a = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 510903276987443985ull);
    vlSelf->b = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 16900879642891266615ull);
    vlSelf->sel = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 14660815779230110548ull);
    vlSelf->out = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7519490245117619040ull);
}
