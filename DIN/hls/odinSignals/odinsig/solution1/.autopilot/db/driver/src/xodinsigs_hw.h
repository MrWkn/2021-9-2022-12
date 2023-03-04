// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0  - enable ap_done interrupt (Read/Write)
//        bit 1  - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0  - ap_done (COR/TOW)
//        bit 1  - ap_ready (COR/TOW)
//        others - reserved
// 0x10 : Data signal of ap_return
//        bit 31~0 - ap_return[31:0] (Read)
// 0x18 : Data signal of addr_o
//        bit 31~0 - addr_o[31:0] (Read)
// 0x1c : Control signal of addr_o
//        bit 0  - addr_o_ap_vld (Read/COR)
//        others - reserved
// 0x28 : Data signal of req_o
//        bit 31~0 - req_o[31:0] (Read)
// 0x2c : Control signal of req_o
//        bit 0  - req_o_ap_vld (Read/COR)
//        others - reserved
// 0x38 : Data signal of ack_o
//        bit 31~0 - ack_o[31:0] (Read/Write)
// 0x3c : reserved
// 0x40 : Data signal of writeloc
//        bit 31~0 - writeloc[31:0] (Read/Write)
// 0x44 : reserved
// 0x48 : Data signal of pop_n
//        bit 31~0 - pop_n[31:0] (Read)
// 0x4c : Control signal of pop_n
//        bit 0  - pop_n_ap_vld (Read/COR)
//        others - reserved
// 0x58 : Data signal of postneuron
//        bit 31~0 - postneuron[31:0] (Read)
// 0x5c : Control signal of postneuron
//        bit 0  - postneuron_ap_vld (Read/COR)
//        others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XODINSIGS_CONTROL_ADDR_AP_CTRL         0x00
#define XODINSIGS_CONTROL_ADDR_GIE             0x04
#define XODINSIGS_CONTROL_ADDR_IER             0x08
#define XODINSIGS_CONTROL_ADDR_ISR             0x0c
#define XODINSIGS_CONTROL_ADDR_AP_RETURN       0x10
#define XODINSIGS_CONTROL_BITS_AP_RETURN       32
#define XODINSIGS_CONTROL_ADDR_ADDR_O_DATA     0x18
#define XODINSIGS_CONTROL_BITS_ADDR_O_DATA     32
#define XODINSIGS_CONTROL_ADDR_ADDR_O_CTRL     0x1c
#define XODINSIGS_CONTROL_ADDR_REQ_O_DATA      0x28
#define XODINSIGS_CONTROL_BITS_REQ_O_DATA      32
#define XODINSIGS_CONTROL_ADDR_REQ_O_CTRL      0x2c
#define XODINSIGS_CONTROL_ADDR_ACK_O_DATA      0x38
#define XODINSIGS_CONTROL_BITS_ACK_O_DATA      32
#define XODINSIGS_CONTROL_ADDR_WRITELOC_DATA   0x40
#define XODINSIGS_CONTROL_BITS_WRITELOC_DATA   32
#define XODINSIGS_CONTROL_ADDR_POP_N_DATA      0x48
#define XODINSIGS_CONTROL_BITS_POP_N_DATA      32
#define XODINSIGS_CONTROL_ADDR_POP_N_CTRL      0x4c
#define XODINSIGS_CONTROL_ADDR_POSTNEURON_DATA 0x58
#define XODINSIGS_CONTROL_BITS_POSTNEURON_DATA 32
#define XODINSIGS_CONTROL_ADDR_POSTNEURON_CTRL 0x5c

