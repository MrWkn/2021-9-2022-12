// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xodinsigs.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XOdinsigs_CfgInitialize(XOdinsigs *InstancePtr, XOdinsigs_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XOdinsigs_Start(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_AP_CTRL) & 0x80;
    XOdinsigs_WriteReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XOdinsigs_IsDone(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XOdinsigs_IsIdle(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XOdinsigs_IsReady(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XOdinsigs_EnableAutoRestart(XOdinsigs *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOdinsigs_WriteReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XOdinsigs_DisableAutoRestart(XOdinsigs *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOdinsigs_WriteReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XOdinsigs_Get_return(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_AP_RETURN);
    return Data;
}
u32 XOdinsigs_Get_addr_o(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_ADDR_O_DATA);
    return Data;
}

u32 XOdinsigs_Get_addr_o_vld(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_ADDR_O_CTRL);
    return Data & 0x1;
}

u32 XOdinsigs_Get_req_o(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_REQ_O_DATA);
    return Data;
}

u32 XOdinsigs_Get_req_o_vld(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_REQ_O_CTRL);
    return Data & 0x1;
}

void XOdinsigs_Set_ack_o(XOdinsigs *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOdinsigs_WriteReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_ACK_O_DATA, Data);
}

u32 XOdinsigs_Get_ack_o(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_ACK_O_DATA);
    return Data;
}

void XOdinsigs_Set_writeloc(XOdinsigs *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOdinsigs_WriteReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_WRITELOC_DATA, Data);
}

u32 XOdinsigs_Get_writeloc(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_WRITELOC_DATA);
    return Data;
}

u32 XOdinsigs_Get_pop_n(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_POP_N_DATA);
    return Data;
}

u32 XOdinsigs_Get_pop_n_vld(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_POP_N_CTRL);
    return Data & 0x1;
}

u32 XOdinsigs_Get_postneuron(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_POSTNEURON_DATA);
    return Data;
}

u32 XOdinsigs_Get_postneuron_vld(XOdinsigs *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_POSTNEURON_CTRL);
    return Data & 0x1;
}

void XOdinsigs_InterruptGlobalEnable(XOdinsigs *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOdinsigs_WriteReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_GIE, 1);
}

void XOdinsigs_InterruptGlobalDisable(XOdinsigs *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOdinsigs_WriteReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_GIE, 0);
}

void XOdinsigs_InterruptEnable(XOdinsigs *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_IER);
    XOdinsigs_WriteReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_IER, Register | Mask);
}

void XOdinsigs_InterruptDisable(XOdinsigs *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_IER);
    XOdinsigs_WriteReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_IER, Register & (~Mask));
}

void XOdinsigs_InterruptClear(XOdinsigs *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XOdinsigs_WriteReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_ISR, Mask);
}

u32 XOdinsigs_InterruptGetEnabled(XOdinsigs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_IER);
}

u32 XOdinsigs_InterruptGetStatus(XOdinsigs *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XOdinsigs_ReadReg(InstancePtr->Control_BaseAddress, XODINSIGS_CONTROL_ADDR_ISR);
}

