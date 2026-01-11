// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_fifo_sync.h for the primary calling header

#include "Vtb_fifo_sync__pch.h"
#include "Vtb_fifo_sync___024root.h"

VL_ATTR_COLD void Vtb_fifo_sync___024root___eval_initial__TOP(Vtb_fifo_sync___024root* vlSelf);
VlCoroutine Vtb_fifo_sync___024root___eval_initial__TOP__Vtiming__0(Vtb_fifo_sync___024root* vlSelf);
VlCoroutine Vtb_fifo_sync___024root___eval_initial__TOP__Vtiming__1(Vtb_fifo_sync___024root* vlSelf);

void Vtb_fifo_sync___024root___eval_initial(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_initial\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vtb_fifo_sync___024root___eval_initial__TOP(vlSelf);
    Vtb_fifo_sync___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    Vtb_fifo_sync___024root___eval_initial__TOP__Vtiming__1(vlSelf);
}

void Vtb_fifo_sync___024root___eval_act(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_act\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void Vtb_fifo_sync___024root___nba_sequent__TOP__0(Vtb_fifo_sync___024root* vlSelf);

void Vtb_fifo_sync___024root___eval_nba(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_nba\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((3ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vtb_fifo_sync___024root___nba_sequent__TOP__0(vlSelf);
    }
}

VL_INLINE_OPT void Vtb_fifo_sync___024root___nba_sequent__TOP__0(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___nba_sequent__TOP__0\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VdlyVal__tb_fifo_sync__DOT__dut__DOT__fifo__v0;
    __VdlyVal__tb_fifo_sync__DOT__dut__DOT__fifo__v0 = 0;
    CData/*2:0*/ __VdlyDim0__tb_fifo_sync__DOT__dut__DOT__fifo__v0;
    __VdlyDim0__tb_fifo_sync__DOT__dut__DOT__fifo__v0 = 0;
    CData/*0:0*/ __VdlySet__tb_fifo_sync__DOT__dut__DOT__fifo__v0;
    __VdlySet__tb_fifo_sync__DOT__dut__DOT__fifo__v0 = 0;
    // Body
    __VdlySet__tb_fifo_sync__DOT__dut__DOT__fifo__v0 = 0U;
    if (vlSelfRef.tb_fifo_sync__DOT__rst_n) {
        if ((((IData)(vlSelfRef.tb_fifo_sync__DOT__cs) 
              & (IData)(vlSelfRef.tb_fifo_sync__DOT__wr_en)) 
             & (~ (IData)(vlSelfRef.tb_fifo_sync__DOT__full)))) {
            __VdlyVal__tb_fifo_sync__DOT__dut__DOT__fifo__v0 
                = vlSelfRef.tb_fifo_sync__DOT__data_in;
            __VdlyDim0__tb_fifo_sync__DOT__dut__DOT__fifo__v0 
                = vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr;
            __VdlySet__tb_fifo_sync__DOT__dut__DOT__fifo__v0 = 1U;
            vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr 
                = (7U & ((IData)(1U) + (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)));
        }
        if ((((IData)(vlSelfRef.tb_fifo_sync__DOT__cs) 
              & (IData)(vlSelfRef.tb_fifo_sync__DOT__rd_en)) 
             & (~ (IData)(vlSelfRef.tb_fifo_sync__DOT__empty)))) {
            vlSelfRef.tb_fifo_sync__DOT__data_out = 
                vlSelfRef.tb_fifo_sync__DOT__dut__DOT__fifo
                [vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr];
            vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr 
                = (7U & ((IData)(1U) + (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr)));
        }
    } else {
        vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr = 0U;
        vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr = 0U;
    }
    if (__VdlySet__tb_fifo_sync__DOT__dut__DOT__fifo__v0) {
        vlSelfRef.tb_fifo_sync__DOT__dut__DOT__fifo[__VdlyDim0__tb_fifo_sync__DOT__dut__DOT__fifo__v0] 
            = __VdlyVal__tb_fifo_sync__DOT__dut__DOT__fifo__v0;
    }
    vlSelfRef.tb_fifo_sync__DOT__empty = ((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                                          == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr));
    vlSelfRef.tb_fifo_sync__DOT__full = ((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                                         == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)));
}

void Vtb_fifo_sync___024root___timing_commit(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___timing_commit\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((! (1ULL & vlSelfRef.__VactTriggered.word(0U)))) {
        vlSelfRef.__VtrigSched_hea0e7b11__0.commit(
                                                   "@(posedge tb_fifo_sync.clk)");
    }
}

void Vtb_fifo_sync___024root___timing_resume(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___timing_resume\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VtrigSched_hea0e7b11__0.resume(
                                                   "@(posedge tb_fifo_sync.clk)");
    }
    if ((4ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void Vtb_fifo_sync___024root___eval_triggers__act(Vtb_fifo_sync___024root* vlSelf);

bool Vtb_fifo_sync___024root___eval_phase__act(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_phase__act\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<3> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vtb_fifo_sync___024root___eval_triggers__act(vlSelf);
    Vtb_fifo_sync___024root___timing_commit(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        Vtb_fifo_sync___024root___timing_resume(vlSelf);
        Vtb_fifo_sync___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vtb_fifo_sync___024root___eval_phase__nba(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_phase__nba\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vtb_fifo_sync___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_fifo_sync___024root___dump_triggers__nba(Vtb_fifo_sync___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_fifo_sync___024root___dump_triggers__act(Vtb_fifo_sync___024root* vlSelf);
#endif  // VL_DEBUG

void Vtb_fifo_sync___024root___eval(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY(((0x64U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vtb_fifo_sync___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("tb_fifo_sync.sv", 1, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY(((0x64U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vtb_fifo_sync___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("tb_fifo_sync.sv", 1, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (Vtb_fifo_sync___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (Vtb_fifo_sync___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vtb_fifo_sync___024root___eval_debug_assertions(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_debug_assertions\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
