// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_fifo_sync.h for the primary calling header

#include "Vtb_fifo_sync__pch.h"
#include "Vtb_fifo_sync__Syms.h"
#include "Vtb_fifo_sync___024root.h"

VL_INLINE_OPT VlCoroutine Vtb_fifo_sync___024root___eval_initial__TOP__Vtiming__0(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_initial__TOP__Vtiming__0\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    std::string __Vtask_tb_fifo_sync__DOT__check_flags__0__tag;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__0__exp_empty;
    __Vtask_tb_fifo_sync__DOT__check_flags__0__exp_empty = 0;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__0__exp_full;
    __Vtask_tb_fifo_sync__DOT__check_flags__0__exp_full = 0;
    IData/*31:0*/ __Vtask_tb_fifo_sync__DOT__do_push__1__data;
    __Vtask_tb_fifo_sync__DOT__do_push__1__data = 0;
    std::string __Vtask_tb_fifo_sync__DOT__check_flags__2__tag;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty = 0;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full = 0;
    IData/*31:0*/ __Vtask_tb_fifo_sync__DOT__do_push__3__data;
    __Vtask_tb_fifo_sync__DOT__do_push__3__data = 0;
    std::string __Vtask_tb_fifo_sync__DOT__check_flags__4__tag;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__4__exp_empty;
    __Vtask_tb_fifo_sync__DOT__check_flags__4__exp_empty = 0;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__4__exp_full;
    __Vtask_tb_fifo_sync__DOT__check_flags__4__exp_full = 0;
    IData/*31:0*/ __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val;
    __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val = 0;
    std::string __Vtask_tb_fifo_sync__DOT__check_flags__6__tag;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty = 0;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full = 0;
    IData/*31:0*/ __Vtask_tb_fifo_sync__DOT__do_pop__7__exp_val;
    __Vtask_tb_fifo_sync__DOT__do_pop__7__exp_val = 0;
    std::string __Vtask_tb_fifo_sync__DOT__check_flags__8__tag;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__8__exp_empty;
    __Vtask_tb_fifo_sync__DOT__check_flags__8__exp_empty = 0;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__8__exp_full;
    __Vtask_tb_fifo_sync__DOT__check_flags__8__exp_full = 0;
    IData/*31:0*/ __Vtask_tb_fifo_sync__DOT__random_op__9__n;
    __Vtask_tb_fifo_sync__DOT__random_op__9__n = 0;
    IData/*31:0*/ __Vtask_tb_fifo_sync__DOT__random_op__9__unnamedblk1__DOT__i;
    __Vtask_tb_fifo_sync__DOT__random_op__9__unnamedblk1__DOT__i = 0;
    IData/*31:0*/ __Vtask_tb_fifo_sync__DOT__random_op__9__unnamedblk1__DOT__unnamedblk2__DOT__op;
    __Vtask_tb_fifo_sync__DOT__random_op__9__unnamedblk1__DOT__unnamedblk2__DOT__op = 0;
    IData/*31:0*/ __Vtask_tb_fifo_sync__DOT__do_push__10__data;
    __Vtask_tb_fifo_sync__DOT__do_push__10__data = 0;
    std::string __Vtask_tb_fifo_sync__DOT__check_flags__11__tag;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__11__exp_empty;
    __Vtask_tb_fifo_sync__DOT__check_flags__11__exp_empty = 0;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__11__exp_full;
    __Vtask_tb_fifo_sync__DOT__check_flags__11__exp_full = 0;
    IData/*31:0*/ __Vtask_tb_fifo_sync__DOT__do_pop__12__exp_val;
    __Vtask_tb_fifo_sync__DOT__do_pop__12__exp_val = 0;
    std::string __Vtask_tb_fifo_sync__DOT__check_flags__13__tag;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__13__exp_empty;
    __Vtask_tb_fifo_sync__DOT__check_flags__13__exp_empty = 0;
    CData/*0:0*/ __Vtask_tb_fifo_sync__DOT__check_flags__13__exp_full;
    __Vtask_tb_fifo_sync__DOT__check_flags__13__exp_full = 0;
    // Body
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = 0U;
    vlSelfRef.tb_fifo_sync__DOT__rst_n = 0U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         101);
    vlSelfRef.tb_fifo_sync__DOT__rst_n = 1U;
    vlSelfRef.tb_fifo_sync__DOT__exp.clear();
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         104);
    __Vtask_tb_fifo_sync__DOT__check_flags__0__tag = 
        std::string{"AFTER RESET"};
    __Vtask_tb_fifo_sync__DOT__check_flags__0__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__0__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__0__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__0__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__0__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__0__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__0__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__0__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__0__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__0__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_push__1__data = 0x10000000U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         41);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 1U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = __Vtask_tb_fifo_sync__DOT__do_push__1__data;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         46);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)))) {
        vlSelfRef.tb_fifo_sync__DOT__exp.push_back(__Vtask_tb_fifo_sync__DOT__do_push__1__data);
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         51);
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         55);
    __Vtask_tb_fifo_sync__DOT__check_flags__2__tag = 
        std::string{"PUSH"};
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_push__1__data = 0x10000001U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         41);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 1U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = __Vtask_tb_fifo_sync__DOT__do_push__1__data;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         46);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)))) {
        vlSelfRef.tb_fifo_sync__DOT__exp.push_back(__Vtask_tb_fifo_sync__DOT__do_push__1__data);
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         51);
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         55);
    __Vtask_tb_fifo_sync__DOT__check_flags__2__tag = 
        std::string{"PUSH"};
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_push__1__data = 0x10000002U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         41);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 1U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = __Vtask_tb_fifo_sync__DOT__do_push__1__data;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         46);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)))) {
        vlSelfRef.tb_fifo_sync__DOT__exp.push_back(__Vtask_tb_fifo_sync__DOT__do_push__1__data);
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         51);
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         55);
    __Vtask_tb_fifo_sync__DOT__check_flags__2__tag = 
        std::string{"PUSH"};
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_push__1__data = 0x10000003U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         41);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 1U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = __Vtask_tb_fifo_sync__DOT__do_push__1__data;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         46);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)))) {
        vlSelfRef.tb_fifo_sync__DOT__exp.push_back(__Vtask_tb_fifo_sync__DOT__do_push__1__data);
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         51);
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         55);
    __Vtask_tb_fifo_sync__DOT__check_flags__2__tag = 
        std::string{"PUSH"};
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_push__1__data = 0x10000004U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         41);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 1U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = __Vtask_tb_fifo_sync__DOT__do_push__1__data;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         46);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)))) {
        vlSelfRef.tb_fifo_sync__DOT__exp.push_back(__Vtask_tb_fifo_sync__DOT__do_push__1__data);
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         51);
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         55);
    __Vtask_tb_fifo_sync__DOT__check_flags__2__tag = 
        std::string{"PUSH"};
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_push__1__data = 0x10000005U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         41);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 1U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = __Vtask_tb_fifo_sync__DOT__do_push__1__data;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         46);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)))) {
        vlSelfRef.tb_fifo_sync__DOT__exp.push_back(__Vtask_tb_fifo_sync__DOT__do_push__1__data);
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         51);
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         55);
    __Vtask_tb_fifo_sync__DOT__check_flags__2__tag = 
        std::string{"PUSH"};
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_push__1__data = 0x10000006U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         41);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 1U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = __Vtask_tb_fifo_sync__DOT__do_push__1__data;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         46);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)))) {
        vlSelfRef.tb_fifo_sync__DOT__exp.push_back(__Vtask_tb_fifo_sync__DOT__do_push__1__data);
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         51);
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         55);
    __Vtask_tb_fifo_sync__DOT__check_flags__2__tag = 
        std::string{"PUSH"};
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_push__1__data = 0x10000007U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         41);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 1U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = __Vtask_tb_fifo_sync__DOT__do_push__1__data;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         46);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)))) {
        vlSelfRef.tb_fifo_sync__DOT__exp.push_back(__Vtask_tb_fifo_sync__DOT__do_push__1__data);
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         51);
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         55);
    __Vtask_tb_fifo_sync__DOT__check_flags__2__tag = 
        std::string{"PUSH"};
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__2__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__2__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_push__3__data = 0xf1f0deadU;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         41);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 1U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = __Vtask_tb_fifo_sync__DOT__do_push__3__data;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         46);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)))) {
        vlSelfRef.tb_fifo_sync__DOT__exp.push_back(__Vtask_tb_fifo_sync__DOT__do_push__3__data);
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         51);
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    vlSelfRef.tb_fifo_sync__DOT__data_in = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         55);
    __Vtask_tb_fifo_sync__DOT__check_flags__4__tag = 
        std::string{"PUSH"};
    __Vtask_tb_fifo_sync__DOT__check_flags__4__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__4__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__4__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__4__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__4__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__4__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__4__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__4__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__4__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__4__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val = 0;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         61);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 1U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         66);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) {
        __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val 
            = vlSelfRef.tb_fifo_sync__DOT__exp.pop_front();
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "tb_fifo_sync.sv", 
                                             69);
        if (VL_UNLIKELY(((vlSelfRef.tb_fifo_sync__DOT__data_out 
                          != __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val)))) {
            VL_WRITEF_NX("[%0t] POP DATA MISMATCH: DUT=%0x EXP=%x\n[%0t] %%Fatal: tb_fifo_sync.sv:72: Assertion failed in %Ntb_fifo_sync.do_pop\n",0,
                         64,VL_TIME_UNITED_Q(1),-12,
                         32,vlSelfRef.tb_fifo_sync__DOT__data_out,
                         32,__Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val,
                         64,VL_TIME_UNITED_Q(1),-12,
                         vlSymsp->name());
            VL_STOP_MT("tb_fifo_sync.sv", 72, "", false);
        }
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         75);
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         78);
    __Vtask_tb_fifo_sync__DOT__check_flags__6__tag = 
        std::string{"POP"};
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val = 0;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         61);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 1U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         66);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) {
        __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val 
            = vlSelfRef.tb_fifo_sync__DOT__exp.pop_front();
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "tb_fifo_sync.sv", 
                                             69);
        if (VL_UNLIKELY(((vlSelfRef.tb_fifo_sync__DOT__data_out 
                          != __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val)))) {
            VL_WRITEF_NX("[%0t] POP DATA MISMATCH: DUT=%0x EXP=%x\n[%0t] %%Fatal: tb_fifo_sync.sv:72: Assertion failed in %Ntb_fifo_sync.do_pop\n",0,
                         64,VL_TIME_UNITED_Q(1),-12,
                         32,vlSelfRef.tb_fifo_sync__DOT__data_out,
                         32,__Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val,
                         64,VL_TIME_UNITED_Q(1),-12,
                         vlSymsp->name());
            VL_STOP_MT("tb_fifo_sync.sv", 72, "", false);
        }
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         75);
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         78);
    __Vtask_tb_fifo_sync__DOT__check_flags__6__tag = 
        std::string{"POP"};
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val = 0;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         61);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 1U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         66);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) {
        __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val 
            = vlSelfRef.tb_fifo_sync__DOT__exp.pop_front();
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "tb_fifo_sync.sv", 
                                             69);
        if (VL_UNLIKELY(((vlSelfRef.tb_fifo_sync__DOT__data_out 
                          != __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val)))) {
            VL_WRITEF_NX("[%0t] POP DATA MISMATCH: DUT=%0x EXP=%x\n[%0t] %%Fatal: tb_fifo_sync.sv:72: Assertion failed in %Ntb_fifo_sync.do_pop\n",0,
                         64,VL_TIME_UNITED_Q(1),-12,
                         32,vlSelfRef.tb_fifo_sync__DOT__data_out,
                         32,__Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val,
                         64,VL_TIME_UNITED_Q(1),-12,
                         vlSymsp->name());
            VL_STOP_MT("tb_fifo_sync.sv", 72, "", false);
        }
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         75);
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         78);
    __Vtask_tb_fifo_sync__DOT__check_flags__6__tag = 
        std::string{"POP"};
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val = 0;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         61);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 1U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         66);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) {
        __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val 
            = vlSelfRef.tb_fifo_sync__DOT__exp.pop_front();
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "tb_fifo_sync.sv", 
                                             69);
        if (VL_UNLIKELY(((vlSelfRef.tb_fifo_sync__DOT__data_out 
                          != __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val)))) {
            VL_WRITEF_NX("[%0t] POP DATA MISMATCH: DUT=%0x EXP=%x\n[%0t] %%Fatal: tb_fifo_sync.sv:72: Assertion failed in %Ntb_fifo_sync.do_pop\n",0,
                         64,VL_TIME_UNITED_Q(1),-12,
                         32,vlSelfRef.tb_fifo_sync__DOT__data_out,
                         32,__Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val,
                         64,VL_TIME_UNITED_Q(1),-12,
                         vlSymsp->name());
            VL_STOP_MT("tb_fifo_sync.sv", 72, "", false);
        }
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         75);
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         78);
    __Vtask_tb_fifo_sync__DOT__check_flags__6__tag = 
        std::string{"POP"};
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val = 0;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         61);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 1U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         66);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) {
        __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val 
            = vlSelfRef.tb_fifo_sync__DOT__exp.pop_front();
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "tb_fifo_sync.sv", 
                                             69);
        if (VL_UNLIKELY(((vlSelfRef.tb_fifo_sync__DOT__data_out 
                          != __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val)))) {
            VL_WRITEF_NX("[%0t] POP DATA MISMATCH: DUT=%0x EXP=%x\n[%0t] %%Fatal: tb_fifo_sync.sv:72: Assertion failed in %Ntb_fifo_sync.do_pop\n",0,
                         64,VL_TIME_UNITED_Q(1),-12,
                         32,vlSelfRef.tb_fifo_sync__DOT__data_out,
                         32,__Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val,
                         64,VL_TIME_UNITED_Q(1),-12,
                         vlSymsp->name());
            VL_STOP_MT("tb_fifo_sync.sv", 72, "", false);
        }
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         75);
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         78);
    __Vtask_tb_fifo_sync__DOT__check_flags__6__tag = 
        std::string{"POP"};
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val = 0;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         61);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 1U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         66);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) {
        __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val 
            = vlSelfRef.tb_fifo_sync__DOT__exp.pop_front();
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "tb_fifo_sync.sv", 
                                             69);
        if (VL_UNLIKELY(((vlSelfRef.tb_fifo_sync__DOT__data_out 
                          != __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val)))) {
            VL_WRITEF_NX("[%0t] POP DATA MISMATCH: DUT=%0x EXP=%x\n[%0t] %%Fatal: tb_fifo_sync.sv:72: Assertion failed in %Ntb_fifo_sync.do_pop\n",0,
                         64,VL_TIME_UNITED_Q(1),-12,
                         32,vlSelfRef.tb_fifo_sync__DOT__data_out,
                         32,__Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val,
                         64,VL_TIME_UNITED_Q(1),-12,
                         vlSymsp->name());
            VL_STOP_MT("tb_fifo_sync.sv", 72, "", false);
        }
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         75);
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         78);
    __Vtask_tb_fifo_sync__DOT__check_flags__6__tag = 
        std::string{"POP"};
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val = 0;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         61);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 1U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         66);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) {
        __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val 
            = vlSelfRef.tb_fifo_sync__DOT__exp.pop_front();
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "tb_fifo_sync.sv", 
                                             69);
        if (VL_UNLIKELY(((vlSelfRef.tb_fifo_sync__DOT__data_out 
                          != __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val)))) {
            VL_WRITEF_NX("[%0t] POP DATA MISMATCH: DUT=%0x EXP=%x\n[%0t] %%Fatal: tb_fifo_sync.sv:72: Assertion failed in %Ntb_fifo_sync.do_pop\n",0,
                         64,VL_TIME_UNITED_Q(1),-12,
                         32,vlSelfRef.tb_fifo_sync__DOT__data_out,
                         32,__Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val,
                         64,VL_TIME_UNITED_Q(1),-12,
                         vlSymsp->name());
            VL_STOP_MT("tb_fifo_sync.sv", 72, "", false);
        }
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         75);
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         78);
    __Vtask_tb_fifo_sync__DOT__check_flags__6__tag = 
        std::string{"POP"};
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val = 0;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         61);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 1U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         66);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) {
        __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val 
            = vlSelfRef.tb_fifo_sync__DOT__exp.pop_front();
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "tb_fifo_sync.sv", 
                                             69);
        if (VL_UNLIKELY(((vlSelfRef.tb_fifo_sync__DOT__data_out 
                          != __Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val)))) {
            VL_WRITEF_NX("[%0t] POP DATA MISMATCH: DUT=%0x EXP=%x\n[%0t] %%Fatal: tb_fifo_sync.sv:72: Assertion failed in %Ntb_fifo_sync.do_pop\n",0,
                         64,VL_TIME_UNITED_Q(1),-12,
                         32,vlSelfRef.tb_fifo_sync__DOT__data_out,
                         32,__Vtask_tb_fifo_sync__DOT__do_pop__5__exp_val,
                         64,VL_TIME_UNITED_Q(1),-12,
                         vlSymsp->name());
            VL_STOP_MT("tb_fifo_sync.sv", 72, "", false);
        }
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         75);
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         78);
    __Vtask_tb_fifo_sync__DOT__check_flags__6__tag = 
        std::string{"POP"};
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__6__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__6__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__do_pop__7__exp_val = 0;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         61);
    vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
    vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 1U;
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         66);
    if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
         != (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) {
        __Vtask_tb_fifo_sync__DOT__do_pop__7__exp_val 
            = vlSelfRef.tb_fifo_sync__DOT__exp.pop_front();
        co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                             nullptr, 
                                             "tb_fifo_sync.sv", 
                                             69);
        if (VL_UNLIKELY(((vlSelfRef.tb_fifo_sync__DOT__data_out 
                          != __Vtask_tb_fifo_sync__DOT__do_pop__7__exp_val)))) {
            VL_WRITEF_NX("[%0t] POP DATA MISMATCH: DUT=%0x EXP=%x\n[%0t] %%Fatal: tb_fifo_sync.sv:72: Assertion failed in %Ntb_fifo_sync.do_pop\n",0,
                         64,VL_TIME_UNITED_Q(1),-12,
                         32,vlSelfRef.tb_fifo_sync__DOT__data_out,
                         32,__Vtask_tb_fifo_sync__DOT__do_pop__7__exp_val,
                         64,VL_TIME_UNITED_Q(1),-12,
                         vlSymsp->name());
            VL_STOP_MT("tb_fifo_sync.sv", 72, "", false);
        }
    }
    co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                         nullptr, 
                                                         "@(posedge tb_fifo_sync.clk)", 
                                                         "tb_fifo_sync.sv", 
                                                         75);
    vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
    vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "tb_fifo_sync.sv", 
                                         78);
    __Vtask_tb_fifo_sync__DOT__check_flags__8__tag = 
        std::string{"POP"};
    __Vtask_tb_fifo_sync__DOT__check_flags__8__exp_empty = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__8__exp_empty 
        = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    __Vtask_tb_fifo_sync__DOT__check_flags__8__exp_full = 0;
    __Vtask_tb_fifo_sync__DOT__check_flags__8__exp_full 
        = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__8__exp_empty))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__8__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__8__exp_empty),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
    }
    if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                       == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                      != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__8__exp_full))))) {
        VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                     64,VL_TIME_UNITED_Q(1),-12,-1,
                     &(__Vtask_tb_fifo_sync__DOT__check_flags__8__tag),
                     1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                        == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                     1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__8__exp_full),
                     32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                     64,VL_TIME_UNITED_Q(1),-12,vlSymsp->name());
        VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
    }
    __Vtask_tb_fifo_sync__DOT__random_op__9__n = 0x32U;
    __Vtask_tb_fifo_sync__DOT__random_op__9__unnamedblk1__DOT__i = 0;
    __Vtask_tb_fifo_sync__DOT__random_op__9__unnamedblk1__DOT__unnamedblk2__DOT__op = 0;
    __Vtask_tb_fifo_sync__DOT__random_op__9__unnamedblk1__DOT__i = 0U;
    while (VL_LTS_III(32, __Vtask_tb_fifo_sync__DOT__random_op__9__unnamedblk1__DOT__i, __Vtask_tb_fifo_sync__DOT__random_op__9__n)) {
        __Vtask_tb_fifo_sync__DOT__random_op__9__unnamedblk1__DOT__unnamedblk2__DOT__op 
            = VL_URANDOM_RANGE_I(0U, 1U);
        if ((0U == __Vtask_tb_fifo_sync__DOT__random_op__9__unnamedblk1__DOT__unnamedblk2__DOT__op)) {
            __Vtask_tb_fifo_sync__DOT__do_push__10__data 
                = VL_RANDOM_I();
            co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_fifo_sync.clk)", 
                                                                 "tb_fifo_sync.sv", 
                                                                 41);
            vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
            vlSelfRef.tb_fifo_sync__DOT__wr_en = 1U;
            vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
            vlSelfRef.tb_fifo_sync__DOT__data_in = __Vtask_tb_fifo_sync__DOT__do_push__10__data;
            co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_fifo_sync.clk)", 
                                                                 "tb_fifo_sync.sv", 
                                                                 46);
            if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                 != (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)))) {
                vlSelfRef.tb_fifo_sync__DOT__exp.push_back(__Vtask_tb_fifo_sync__DOT__do_push__10__data);
            }
            co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_fifo_sync.clk)", 
                                                                 "tb_fifo_sync.sv", 
                                                                 51);
            vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
            vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
            vlSelfRef.tb_fifo_sync__DOT__data_in = 0U;
            co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                                 nullptr, 
                                                 "tb_fifo_sync.sv", 
                                                 55);
            __Vtask_tb_fifo_sync__DOT__check_flags__11__tag = 
                std::string{"PUSH"};
            __Vtask_tb_fifo_sync__DOT__check_flags__11__exp_empty = 0;
            __Vtask_tb_fifo_sync__DOT__check_flags__11__exp_empty 
                = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
            __Vtask_tb_fifo_sync__DOT__check_flags__11__exp_full = 0;
            __Vtask_tb_fifo_sync__DOT__check_flags__11__exp_full 
                = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
            if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                               == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                              != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__11__exp_empty))))) {
                VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                             64,VL_TIME_UNITED_Q(1),
                             -12,-1,&(__Vtask_tb_fifo_sync__DOT__check_flags__11__tag),
                             1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                                == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                             1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__11__exp_empty),
                             32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                             64,VL_TIME_UNITED_Q(1),
                             -12,vlSymsp->name());
                VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
            }
            if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                               == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                              != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__11__exp_full))))) {
                VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                             64,VL_TIME_UNITED_Q(1),
                             -12,-1,&(__Vtask_tb_fifo_sync__DOT__check_flags__11__tag),
                             1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                                == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                             1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__11__exp_full),
                             32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                             64,VL_TIME_UNITED_Q(1),
                             -12,vlSymsp->name());
                VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
            }
        } else {
            __Vtask_tb_fifo_sync__DOT__do_pop__12__exp_val = 0;
            co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_fifo_sync.clk)", 
                                                                 "tb_fifo_sync.sv", 
                                                                 61);
            vlSelfRef.tb_fifo_sync__DOT__cs = 1U;
            vlSelfRef.tb_fifo_sync__DOT__wr_en = 0U;
            vlSelfRef.tb_fifo_sync__DOT__rd_en = 1U;
            co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_fifo_sync.clk)", 
                                                                 "tb_fifo_sync.sv", 
                                                                 66);
            if (((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                 != (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) {
                __Vtask_tb_fifo_sync__DOT__do_pop__12__exp_val 
                    = vlSelfRef.tb_fifo_sync__DOT__exp.pop_front();
                co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                                     nullptr, 
                                                     "tb_fifo_sync.sv", 
                                                     69);
                if (VL_UNLIKELY(((vlSelfRef.tb_fifo_sync__DOT__data_out 
                                  != __Vtask_tb_fifo_sync__DOT__do_pop__12__exp_val)))) {
                    VL_WRITEF_NX("[%0t] POP DATA MISMATCH: DUT=%0x EXP=%x\n[%0t] %%Fatal: tb_fifo_sync.sv:72: Assertion failed in %Ntb_fifo_sync.do_pop\n",0,
                                 64,VL_TIME_UNITED_Q(1),
                                 -12,32,vlSelfRef.tb_fifo_sync__DOT__data_out,
                                 32,__Vtask_tb_fifo_sync__DOT__do_pop__12__exp_val,
                                 64,VL_TIME_UNITED_Q(1),
                                 -12,vlSymsp->name());
                    VL_STOP_MT("tb_fifo_sync.sv", 72, "", false);
                }
            }
            co_await vlSelfRef.__VtrigSched_hea0e7b11__0.trigger(0U, 
                                                                 nullptr, 
                                                                 "@(posedge tb_fifo_sync.clk)", 
                                                                 "tb_fifo_sync.sv", 
                                                                 75);
            vlSelfRef.tb_fifo_sync__DOT__rd_en = 0U;
            vlSelfRef.tb_fifo_sync__DOT__cs = 0U;
            co_await vlSelfRef.__VdlySched.delay(1ULL, 
                                                 nullptr, 
                                                 "tb_fifo_sync.sv", 
                                                 78);
            __Vtask_tb_fifo_sync__DOT__check_flags__13__tag = 
                std::string{"POP"};
            __Vtask_tb_fifo_sync__DOT__check_flags__13__exp_empty = 0;
            __Vtask_tb_fifo_sync__DOT__check_flags__13__exp_empty 
                = (0U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
            __Vtask_tb_fifo_sync__DOT__check_flags__13__exp_full = 0;
            __Vtask_tb_fifo_sync__DOT__check_flags__13__exp_full 
                = (8U == vlSelfRef.tb_fifo_sync__DOT__exp.size());
            if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                               == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)) 
                              != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__13__exp_empty))))) {
                VL_WRITEF_NX("[%0t] %@ [ERROR : EMPTY MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:31: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                             64,VL_TIME_UNITED_Q(1),
                             -12,-1,&(__Vtask_tb_fifo_sync__DOT__check_flags__13__tag),
                             1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                                == (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr)),
                             1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__13__exp_empty),
                             32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                             64,VL_TIME_UNITED_Q(1),
                             -12,vlSymsp->name());
                VL_STOP_MT("tb_fifo_sync.sv", 31, "", false);
            }
            if (VL_UNLIKELY(((((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                               == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))) 
                              != (IData)(__Vtask_tb_fifo_sync__DOT__check_flags__13__exp_full))))) {
                VL_WRITEF_NX("[%0t] %@ [ERROR : FULL MIMATCH]: DUT=%0b EXP=%0b SIZE=%0d\n[%0t] %%Fatal: tb_fifo_sync.sv:36: Assertion failed in %Ntb_fifo_sync.check_flags\n",0,
                             64,VL_TIME_UNITED_Q(1),
                             -12,-1,&(__Vtask_tb_fifo_sync__DOT__check_flags__13__tag),
                             1,((IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__rd_ptr) 
                                == (8U | (IData)(vlSelfRef.tb_fifo_sync__DOT__dut__DOT__wr_ptr))),
                             1,(IData)(__Vtask_tb_fifo_sync__DOT__check_flags__13__exp_full),
                             32,vlSelfRef.tb_fifo_sync__DOT__exp.size(),
                             64,VL_TIME_UNITED_Q(1),
                             -12,vlSymsp->name());
                VL_STOP_MT("tb_fifo_sync.sv", 36, "", false);
            }
        }
        __Vtask_tb_fifo_sync__DOT__random_op__9__unnamedblk1__DOT__i 
            = ((IData)(1U) + __Vtask_tb_fifo_sync__DOT__random_op__9__unnamedblk1__DOT__i);
    }
    VL_WRITEF_NX("DONE:TEST_PASS\n",0);
    VL_FINISH_MT("tb_fifo_sync.sv", 123, "");
}

VL_INLINE_OPT VlCoroutine Vtb_fifo_sync___024root___eval_initial__TOP__Vtiming__1(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_initial__TOP__Vtiming__1\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    while (VL_LIKELY(!vlSymsp->_vm_contextp__->gotFinish())) {
        co_await vlSelfRef.__VdlySched.delay(5ULL, 
                                             nullptr, 
                                             "tb_fifo_sync.sv", 
                                             19);
        vlSelfRef.tb_fifo_sync__DOT__clk = (1U & (~ (IData)(vlSelfRef.tb_fifo_sync__DOT__clk)));
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vtb_fifo_sync___024root___dump_triggers__act(Vtb_fifo_sync___024root* vlSelf);
#endif  // VL_DEBUG

void Vtb_fifo_sync___024root___eval_triggers__act(Vtb_fifo_sync___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_fifo_sync___024root___eval_triggers__act\n"); );
    Vtb_fifo_sync__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.setBit(0U, ((IData)(vlSelfRef.tb_fifo_sync__DOT__clk) 
                                          & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__tb_fifo_sync__DOT__clk__0))));
    vlSelfRef.__VactTriggered.setBit(1U, ((~ (IData)(vlSelfRef.tb_fifo_sync__DOT__rst_n)) 
                                          & (IData)(vlSelfRef.__Vtrigprevexpr___TOP__tb_fifo_sync__DOT__rst_n__0)));
    vlSelfRef.__VactTriggered.setBit(2U, vlSelfRef.__VdlySched.awaitingCurrentTime());
    vlSelfRef.__Vtrigprevexpr___TOP__tb_fifo_sync__DOT__clk__0 
        = vlSelfRef.tb_fifo_sync__DOT__clk;
    vlSelfRef.__Vtrigprevexpr___TOP__tb_fifo_sync__DOT__rst_n__0 
        = vlSelfRef.tb_fifo_sync__DOT__rst_n;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vtb_fifo_sync___024root___dump_triggers__act(vlSelf);
    }
#endif
}
