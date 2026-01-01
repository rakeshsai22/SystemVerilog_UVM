// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vmux_2x1__pch.h"

//============================================================
// Constructors

Vmux_2x1::Vmux_2x1(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vmux_2x1__Syms(contextp(), _vcname__, this)}
    , a{vlSymsp->TOP.a}
    , b{vlSymsp->TOP.b}
    , sel{vlSymsp->TOP.sel}
    , out{vlSymsp->TOP.out}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vmux_2x1::Vmux_2x1(const char* _vcname__)
    : Vmux_2x1(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vmux_2x1::~Vmux_2x1() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vmux_2x1___024root___eval_debug_assertions(Vmux_2x1___024root* vlSelf);
#endif  // VL_DEBUG
void Vmux_2x1___024root___eval_static(Vmux_2x1___024root* vlSelf);
void Vmux_2x1___024root___eval_initial(Vmux_2x1___024root* vlSelf);
void Vmux_2x1___024root___eval_settle(Vmux_2x1___024root* vlSelf);
void Vmux_2x1___024root___eval(Vmux_2x1___024root* vlSelf);

void Vmux_2x1::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vmux_2x1::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vmux_2x1___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vmux_2x1___024root___eval_static(&(vlSymsp->TOP));
        Vmux_2x1___024root___eval_initial(&(vlSymsp->TOP));
        Vmux_2x1___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vmux_2x1___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vmux_2x1::eventsPending() { return false; }

uint64_t Vmux_2x1::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vmux_2x1::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vmux_2x1___024root___eval_final(Vmux_2x1___024root* vlSelf);

VL_ATTR_COLD void Vmux_2x1::final() {
    Vmux_2x1___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vmux_2x1::hierName() const { return vlSymsp->name(); }
const char* Vmux_2x1::modelName() const { return "Vmux_2x1"; }
unsigned Vmux_2x1::threads() const { return 1; }
void Vmux_2x1::prepareClone() const { contextp()->prepareClone(); }
void Vmux_2x1::atClone() const {
    contextp()->threadPoolpOnClone();
}
