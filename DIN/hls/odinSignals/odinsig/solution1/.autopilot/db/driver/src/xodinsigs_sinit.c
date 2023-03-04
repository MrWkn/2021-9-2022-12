// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xodinsigs.h"

extern XOdinsigs_Config XOdinsigs_ConfigTable[];

XOdinsigs_Config *XOdinsigs_LookupConfig(u16 DeviceId) {
	XOdinsigs_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XODINSIGS_NUM_INSTANCES; Index++) {
		if (XOdinsigs_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XOdinsigs_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XOdinsigs_Initialize(XOdinsigs *InstancePtr, u16 DeviceId) {
	XOdinsigs_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XOdinsigs_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XOdinsigs_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

