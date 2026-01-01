// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vmux_2x1.h for the primary calling header

#ifndef VERILATED_VMUX_2X1___024ROOT_H_
#define VERILATED_VMUX_2X1___024ROOT_H_  // guard

#include "verilated.h"


class Vmux_2x1__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vmux_2x1___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(a,0,0);
    VL_IN8(b,0,0);
    VL_IN8(sel,0,0);
    VL_OUT8(out,0,0);
    CData/*0:0*/ __VstlFirstIteration;
    CData/*0:0*/ __VicoFirstIteration;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VicoTriggered;
    VlTriggerVec<0> __VactTriggered;
    VlTriggerVec<0> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vmux_2x1__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vmux_2x1___024root(Vmux_2x1__Syms* symsp, const char* v__name);
    ~Vmux_2x1___024root();
    VL_UNCOPYABLE(Vmux_2x1___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
