// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xsend.h"

extern XSend_Config XSend_ConfigTable[];

XSend_Config *XSend_LookupConfig(u16 DeviceId) {
	XSend_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XSEND_NUM_INSTANCES; Index++) {
		if (XSend_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XSend_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XSend_Initialize(XSend *InstancePtr, u16 DeviceId) {
	XSend_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XSend_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XSend_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

