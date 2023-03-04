// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XSEND_H
#define XSEND_H

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
#include "xsend_hw.h"

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
} XSend_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XSend;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSend_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSend_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSend_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSend_ReadReg(BaseAddress, RegOffset) \
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
int XSend_Initialize(XSend *InstancePtr, u16 DeviceId);
XSend_Config* XSend_LookupConfig(u16 DeviceId);
int XSend_CfgInitialize(XSend *InstancePtr, XSend_Config *ConfigPtr);
#else
int XSend_Initialize(XSend *InstancePtr, const char* InstanceName);
int XSend_Release(XSend *InstancePtr);
#endif

void XSend_Start(XSend *InstancePtr);
u32 XSend_IsDone(XSend *InstancePtr);
u32 XSend_IsIdle(XSend *InstancePtr);
u32 XSend_IsReady(XSend *InstancePtr);
void XSend_EnableAutoRestart(XSend *InstancePtr);
void XSend_DisableAutoRestart(XSend *InstancePtr);
u32 XSend_Get_return(XSend *InstancePtr);

void XSend_Set_data_ptr(XSend *InstancePtr, u64 Data);
u64 XSend_Get_data_ptr(XSend *InstancePtr);
void XSend_Set_read_loc(XSend *InstancePtr, u32 Data);
u32 XSend_Get_read_loc(XSend *InstancePtr);

void XSend_InterruptGlobalEnable(XSend *InstancePtr);
void XSend_InterruptGlobalDisable(XSend *InstancePtr);
void XSend_InterruptEnable(XSend *InstancePtr, u32 Mask);
void XSend_InterruptDisable(XSend *InstancePtr, u32 Mask);
void XSend_InterruptClear(XSend *InstancePtr, u32 Mask);
u32 XSend_InterruptGetEnabled(XSend *InstancePtr);
u32 XSend_InterruptGetStatus(XSend *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
