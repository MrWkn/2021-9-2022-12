// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XODINSIGS_H
#define XODINSIGS_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xodinsigs_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XOdinsigs_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XOdinsigs;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XOdinsigs_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XOdinsigs_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XOdinsigs_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XOdinsigs_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XOdinsigs_Initialize(XOdinsigs *InstancePtr, u16 DeviceId);
XOdinsigs_Config* XOdinsigs_LookupConfig(u16 DeviceId);
int XOdinsigs_CfgInitialize(XOdinsigs *InstancePtr, XOdinsigs_Config *ConfigPtr);
#else
int XOdinsigs_Initialize(XOdinsigs *InstancePtr, const char* InstanceName);
int XOdinsigs_Release(XOdinsigs *InstancePtr);
#endif

void XOdinsigs_Start(XOdinsigs *InstancePtr);
u32 XOdinsigs_IsDone(XOdinsigs *InstancePtr);
u32 XOdinsigs_IsIdle(XOdinsigs *InstancePtr);
u32 XOdinsigs_IsReady(XOdinsigs *InstancePtr);
void XOdinsigs_EnableAutoRestart(XOdinsigs *InstancePtr);
void XOdinsigs_DisableAutoRestart(XOdinsigs *InstancePtr);
u32 XOdinsigs_Get_return(XOdinsigs *InstancePtr);

u32 XOdinsigs_Get_addr_o(XOdinsigs *InstancePtr);
u32 XOdinsigs_Get_addr_o_vld(XOdinsigs *InstancePtr);
u32 XOdinsigs_Get_req_o(XOdinsigs *InstancePtr);
u32 XOdinsigs_Get_req_o_vld(XOdinsigs *InstancePtr);
void XOdinsigs_Set_ack_o(XOdinsigs *InstancePtr, u32 Data);
u32 XOdinsigs_Get_ack_o(XOdinsigs *InstancePtr);
void XOdinsigs_Set_writeloc(XOdinsigs *InstancePtr, u32 Data);
u32 XOdinsigs_Get_writeloc(XOdinsigs *InstancePtr);
u32 XOdinsigs_Get_pop_n(XOdinsigs *InstancePtr);
u32 XOdinsigs_Get_pop_n_vld(XOdinsigs *InstancePtr);
u32 XOdinsigs_Get_postneuron(XOdinsigs *InstancePtr);
u32 XOdinsigs_Get_postneuron_vld(XOdinsigs *InstancePtr);

void XOdinsigs_InterruptGlobalEnable(XOdinsigs *InstancePtr);
void XOdinsigs_InterruptGlobalDisable(XOdinsigs *InstancePtr);
void XOdinsigs_InterruptEnable(XOdinsigs *InstancePtr, u32 Mask);
void XOdinsigs_InterruptDisable(XOdinsigs *InstancePtr, u32 Mask);
void XOdinsigs_InterruptClear(XOdinsigs *InstancePtr, u32 Mask);
u32 XOdinsigs_InterruptGetEnabled(XOdinsigs *InstancePtr);
u32 XOdinsigs_InterruptGetStatus(XOdinsigs *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
