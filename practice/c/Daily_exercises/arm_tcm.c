// Some arm SoC's have a TCM (Tightly-Coupled Memory), ususally minimum 4 KiB to 64 KiB of RAM inside ARM processor.
// TCM has a Harvard-Arch 
//  TCM :
//      ITCM - Instruction TCM
//      DTCM - Data TCM
//  * DTCM cannot contain any instructions but ITCM can contian data
//  # TCM Status Register  - (ITCM : bits 1-0 and DTCM bits 17-16)
//  # TCM Rregion Register - can report and modify the location & size of TCM memories at runtime.
//                           Note: 
//                              1. this is not an MMU table (??), we move the physical location of the TCM around
//                                 so it is not recomended not to overlap any physical RAM with the TCM
//                              2. the tcm memory can be re-mapped to another address using the MMU,but notice that the 
//                                 TCm is often used in situations where the MMU is turned off.
// 
// 
