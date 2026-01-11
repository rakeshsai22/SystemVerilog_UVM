// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_fifo_sync.h for the primary calling header

#include "Vtb_fifo_sync__pch.h"
#include "Vtb_fifo_sync___024root.h"

VL_ATTR_COLD void Vtb_fifo_sync___024root___eval_static(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_static\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vtrigprevexpr___TOP__tb_fifo_sync__DOT__clk__0 
        = vlSelfRef.tb_fifo_sync__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__tb_fifo_sync__DOT__rst_n__0 
        = vlSelfRef.tb_fifo_sync__DOT__rst_n;
}

VL_ATTR_COLD void Vtb_fifo_sync___024root___eval_initial__TOP(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_initial__TOP\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.tb_fifo_sync__DOT__clk = 0U;
}

VL_ATTR_COLD void Vtb_fifo_sync___024root___eval_final(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_final\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_fifo_sync___024root___dump_triggers__stl(Vtb_fifo_sync___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vtb_fifo_sync___024root___eval_phase__stl(Vtb_fifo_sync___024root* vlSelf);

VL_ATTR_COLD void Vtb_fifo_sync___024root___eval_settle(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_settle\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
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
            Vtb_fifo_sync___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("tb_fifo_sync.sv", 1, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (Vtb_fifo_sync___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelfRef.__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_fifo_sync___024root___dump_triggers__stl(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___dump_triggers__stl\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
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

VL_ATTR_COLD void Vtb_fifo_sync___024root___stl_sequent__TOP__0(Vtb_fifo_sync___024root* vlSelf);

VL_ATTR_COLD void Vtb_fifo_sync___024root___eval_stl(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_stl\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        Vtb_fifo_sync___024root___stl_sequent__TOP__0(vlSelf);
    }
}

VL_ATTR_COLD void Vtb_fifo_sync___024root___stl_sequent__TOP__0(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___stl_sequent__TOP__0\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.tb_fifo_sync__DOT__empty = ((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                                          == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr));
    vlSelfRef.tb_fifo_sync__DOT__full = ((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                                         == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)));
}

VL_ATTR_COLD void Vtb_fifo_sync___024root___eval_triggers__stl(Vtb_fifo_sync___024root* vlSelf);

VL_ATTR_COLD bool Vtb_fifo_sync___024root___eval_phase__stl(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_phase__stl\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    Vtb_fifo_sync___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelfRef.__VstlTriggered.any();
    if (__VstlExecute) {
        Vtb_fifo_sync___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_fifo_sync___024root___dump_triggers__act(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___dump_triggers__act\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge tb_fifo_sync.clk)\n");
    }
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @(negedge tb_fifo_sync.rst_n)\n");
    }
    if ((4ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 2 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_fifo_sync___024root___dump_triggers__nba(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___dump_triggers__nba\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge tb_fifo_sync.clk)\n");
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @(negedge tb_fifo_sync.rst_n)\n");
    }
    if ((4ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 2 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vtb_fifo_sync___024root___ctor_var_reset(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___ctor_var_reset\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->name());
    vlSelf->tb_fifo_sync__DOT__clk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 12885472739945958128ull);
    vlSelf->tb_fifo_sync__DOT__rst_n = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3502585473903923710ull);
    vlSelf->tb_fifo_sync__DOT__wr_en = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 3932229843761550642ull);
    vlSelf->tb_fifo_sync__DOT__rd_en = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 13701032490355672765ull);
    vlSelf->tb_fifo_sync__DOT__cs = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 15352890345109435521ull);
    vlSelf->tb_fifo_sync__DOT__data_in = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 13912772563649446292ull);
    vlSelf->tb_fifo_sync__DOT__data_out = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 8237912770300389571ull);
    vlSelf->tb_fifo_sync__DOT__empty = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2839791396041650776ull);
    vlSelf->tb_fifo_sync__DOT__full = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7318339297502742879ull);
    vlSelf->tb_fifo_sync__DOT__exp.atDefault() = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 12193385860075214437ull);
    for (int __Vi0 = 0; __Vi0 < 8; ++__Vi0) {
        vlSelf->tb_fifo_sync__DOT__dut__DOT__fifo[__Vi0] = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 9833573563742194926ull);
    }
    vlSelf->tb_fifo_sync__DOT__dut__DOT__wr_ptr = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 7258268739145242578ull);
    vlSelf->tb_fifo_sync__DOT__dut__DOT__rd_ptr = VL_SCOPED_RAND_RESET_I(3, __VscopeHash, 9966848239925044514ull);
    vlSelf->__Vtrigprevexpr___TOP__tb_fifo_sync__DOT__clk__0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7786091942561279166ull);
    vlSelf->__Vtrigprevexpr___TOP__tb_fifo_sync__DOT__rst_n__0 = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 4281344879897774285ull);
}
