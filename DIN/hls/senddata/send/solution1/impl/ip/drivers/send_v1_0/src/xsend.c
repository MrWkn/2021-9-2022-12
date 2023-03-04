// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xsend.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSend_CfgInitialize(XSend *InstancePtr, XSend_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSend_Start(XSend *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSend_ReadReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSend_WriteReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSend_IsDone(XSend *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSend_ReadReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSend_IsIdle(XSend *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSend_ReadReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSend_IsReady(XSend *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSend_ReadReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSend_EnableAutoRestart(XSend *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSend_WriteReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XSend_DisableAutoRestart(XSend *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSend_WriteReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XSend_Get_return(XSend *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSend_ReadReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_AP_RETURN);
    return Data;
}
void XSend_Set_data_ptr(XSend *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSend_WriteReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_DATA_PTR_DATA, (u32)(Data));
    XSend_WriteReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_DATA_PTR_DATA + 4, (u32)(Data >> 32));
}

u64 XSend_Get_data_ptr(XSend *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSend_ReadReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_DATA_PTR_DATA);
    Data += (u64)XSend_ReadReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_DATA_PTR_DATA + 4) << 32;
    return Data;
}

void XSend_Set_read_loc(XSend *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSend_WriteReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_READ_LOC_DATA, Data);
}

u32 XSend_Get_read_loc(XSend *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSend_ReadReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_READ_LOC_DATA);
    return Data;
}

void XSend_InterruptGlobalEnable(XSend *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSend_WriteReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_GIE, 1);
}

void XSend_InterruptGlobalDisable(XSend *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSend_WriteReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_GIE, 0);
}

void XSend_InterruptEnable(XSend *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSend_ReadReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_IER);
    XSend_WriteReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_IER, Register | Mask);
}

void XSend_InterruptDisable(XSend *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSend_ReadReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_IER);
    XSend_WriteReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_IER, Register & (~Mask));
}

void XSend_InterruptClear(XSend *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSend_WriteReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_ISR, Mask);
}

u32 XSend_InterruptGetEnabled(XSend *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSend_ReadReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_IER);
}

u32 XSend_InterruptGetStatus(XSend *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSend_ReadReg(InstancePtr->Control_BaseAddress, XSEND_CONTROL_ADDR_ISR);
}

