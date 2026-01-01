// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VMUX_2X1__SYMS_H_
#define VERILATED_VMUX_2X1__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "Vmux_2x1.h"

// INCLUDE MODULE CLASSES
#include "Vmux_2x1___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES)Vmux_2x1__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    Vmux_2x1* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    Vmux_2x1___024root             TOP;

    // CONSTRUCTORS
    Vmux_2x1__Syms(VerilatedContext* contextp, const char* namep, Vmux_2x1* modelp);
    ~Vmux_2x1__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
};

#endif  // guard
