set moduleName odinsigs
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {odinsigs}
set C_modelType { int 32 }
set C_modelArgList {
	{ addr_o int 32 regular {axi_slave 1}  }
	{ req_o int 32 regular {axi_slave 1}  }
	{ ack_o int 32 regular {axi_slave 0}  }
	{ AEROUT_ADDR int 32 regular {pointer 0 volatile }  }
	{ AEROUT_REQ int 32 regular {pointer 0 volatile }  }
	{ AEROUT_ACK int 32 regular {pointer 1 volatile }  }
	{ writeloc int 32 unused {axi_slave 0}  }
	{ pop_n int 32 regular {axi_slave 1}  }
	{ postneuron int 32 regular {axi_slave 1}  }
	{ CTRL_SCHED_POP_N int 32 regular {pointer 0 volatile }  }
	{ CTRL_NEURMEM_ADDR int 32 regular {pointer 0 volatile }  }
	{ AEROUT_CTRL_BUSY int 32 unused {pointer 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "addr_o", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "offset" : {"out":24}, "offset_end" : {"out":31}} , 
 	{ "Name" : "req_o", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "offset" : {"out":40}, "offset_end" : {"out":47}} , 
 	{ "Name" : "ack_o", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":56}, "offset_end" : {"in":63}} , 
 	{ "Name" : "AEROUT_ADDR", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "AEROUT_REQ", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "AEROUT_ACK", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "writeloc", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":64}, "offset_end" : {"in":71}} , 
 	{ "Name" : "pop_n", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "offset" : {"out":72}, "offset_end" : {"out":79}} , 
 	{ "Name" : "postneuron", "interface" : "axi_slave", "bundle":"control","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "offset" : {"out":88}, "offset_end" : {"out":95}} , 
 	{ "Name" : "CTRL_SCHED_POP_N", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "CTRL_NEURMEM_ADDR", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "AEROUT_CTRL_BUSY", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "offset" : {"out":16}} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ AEROUT_ADDR sc_in sc_lv 32 signal 3 } 
	{ AEROUT_REQ sc_in sc_lv 32 signal 4 } 
	{ AEROUT_ACK sc_out sc_lv 32 signal 5 } 
	{ CTRL_SCHED_POP_N sc_in sc_lv 32 signal 9 } 
	{ CTRL_NEURMEM_ADDR sc_in sc_lv 32 signal 10 } 
	{ AEROUT_CTRL_BUSY sc_in sc_lv 32 signal 11 } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"odinsigs","role":"start","value":"0","valid_bit":"0"},{"name":"odinsigs","role":"continue","value":"0","valid_bit":"4"},{"name":"odinsigs","role":"auto_start","value":"0","valid_bit":"7"},{"name":"ack_o","role":"data","value":"56"},{"name":"writeloc","role":"data","value":"64"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"odinsigs","role":"start","value":"0","valid_bit":"0"},{"name":"odinsigs","role":"done","value":"0","valid_bit":"1"},{"name":"odinsigs","role":"idle","value":"0","valid_bit":"2"},{"name":"odinsigs","role":"ready","value":"0","valid_bit":"3"},{"name":"odinsigs","role":"auto_start","value":"0","valid_bit":"7"},{"name":"return","role":"data","value":"16"},{"name":"addr_o","role":"data","value":"24"}, {"name":"addr_o","role":"valid","value":"28","valid_bit":"0"},{"name":"req_o","role":"data","value":"40"}, {"name":"req_o","role":"valid","value":"44","valid_bit":"0"},{"name":"pop_n","role":"data","value":"72"}, {"name":"pop_n","role":"valid","value":"76","valid_bit":"0"},{"name":"postneuron","role":"data","value":"88"}, {"name":"postneuron","role":"valid","value":"92","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "AEROUT_ADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AEROUT_ADDR", "role": "default" }} , 
 	{ "name": "AEROUT_REQ", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AEROUT_REQ", "role": "default" }} , 
 	{ "name": "AEROUT_ACK", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AEROUT_ACK", "role": "default" }} , 
 	{ "name": "CTRL_SCHED_POP_N", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL_SCHED_POP_N", "role": "default" }} , 
 	{ "name": "CTRL_NEURMEM_ADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL_NEURMEM_ADDR", "role": "default" }} , 
 	{ "name": "AEROUT_CTRL_BUSY", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AEROUT_CTRL_BUSY", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "odinsigs",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "addr_o", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "req_o", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ack_o", "Type" : "None", "Direction" : "I"},
			{"Name" : "AEROUT_ADDR", "Type" : "None", "Direction" : "I"},
			{"Name" : "AEROUT_REQ", "Type" : "None", "Direction" : "I"},
			{"Name" : "AEROUT_ACK", "Type" : "None", "Direction" : "O"},
			{"Name" : "writeloc", "Type" : "None", "Direction" : "I"},
			{"Name" : "pop_n", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "postneuron", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "CTRL_SCHED_POP_N", "Type" : "None", "Direction" : "I"},
			{"Name" : "CTRL_NEURMEM_ADDR", "Type" : "None", "Direction" : "I"},
			{"Name" : "AEROUT_CTRL_BUSY", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	odinsigs {
		addr_o {Type O LastRead -1 FirstWrite 1}
		req_o {Type O LastRead -1 FirstWrite 1}
		ack_o {Type I LastRead 0 FirstWrite -1}
		AEROUT_ADDR {Type I LastRead 0 FirstWrite -1}
		AEROUT_REQ {Type I LastRead 0 FirstWrite -1}
		AEROUT_ACK {Type O LastRead -1 FirstWrite 1}
		writeloc {Type I LastRead -1 FirstWrite -1}
		pop_n {Type O LastRead -1 FirstWrite 1}
		postneuron {Type O LastRead -1 FirstWrite 1}
		CTRL_SCHED_POP_N {Type I LastRead 0 FirstWrite -1}
		CTRL_NEURMEM_ADDR {Type I LastRead 0 FirstWrite -1}
		AEROUT_CTRL_BUSY {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "3", "Max" : "3"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	AEROUT_ADDR { ap_none {  { AEROUT_ADDR in_data 0 32 } } }
	AEROUT_REQ { ap_none {  { AEROUT_REQ in_data 0 32 } } }
	AEROUT_ACK { ap_none {  { AEROUT_ACK out_data 1 32 } } }
	CTRL_SCHED_POP_N { ap_none {  { CTRL_SCHED_POP_N in_data 0 32 } } }
	CTRL_NEURMEM_ADDR { ap_none {  { CTRL_NEURMEM_ADDR in_data 0 32 } } }
	AEROUT_CTRL_BUSY { ap_none {  { AEROUT_CTRL_BUSY in_data 0 32 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
