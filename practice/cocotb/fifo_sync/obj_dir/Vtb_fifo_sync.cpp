// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vtb_fifo_sync__pch.h"

//============================================================
// Constructors

Vtb_fifo_sync::Vtb_fifo_sync(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vtb_fifo_sync__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vtb_fifo_sync::Vtb_fifo_sync(const char* _vcname__)
    : Vtb_fifo_sync(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vtb_fifo_sync::~Vtb_fifo_sync() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vtb_fifo_sync___024root___eval_debug_assertions(Vtb_fifo_sync___024root* vlSelf);
#endif  // VL_DEBUG
void Vtb_fifo_sync___024root___eval_static(Vtb_fifo_sync___024root* vlSelf);
void Vtb_fifo_sync___024root___eval_initial(Vtb_fifo_sync___024root* vlSelf);
void Vtb_fifo_sync___024root___eval_settle(Vtb_fifo_sync___024root* vlSelf);
void Vtb_fifo_sync___024root___eval(Vtb_fifo_sync___024root* vlSelf);

void Vtb_fifo_sync::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vtb_fifo_sync::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vtb_fifo_sync___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vtb_fifo_sync___024root___eval_static(&(vlSymsp->TOP));
        Vtb_fifo_sync___024root___eval_initial(&(vlSymsp->TOP));
        Vtb_fifo_sync___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vtb_fifo_sync___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vtb_fifo_sync::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t Vtb_fifo_sync::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vtb_fifo_sync::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vtb_fifo_sync___024root___eval_final(Vtb_fifo_sync___024root* vlSelf);

VL_ATTR_COLD void Vtb_fifo_sync::final() {
    Vtb_fifo_sync___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vtb_fifo_sync::hierName() const { return vlSymsp->name(); }
const char* Vtb_fifo_sync::modelName() const { return "Vtb_fifo_sync"; }
unsigned Vtb_fifo_sync::threads() const { return 1; }
void Vtb_fifo_sync::prepareClone() const { contextp()->prepareClone(); }
void Vtb_fifo_sync::atClone() const {
    contextp()->threadPoolpOnClone();
}
