set moduleName tiled_matvec
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {tiled_matvec}
set C_modelType { void 0 }
set C_modelArgList {
	{ Atile_V_vec_0 int 32 regular {fifo 0 volatile }  }
	{ Atile_V_vec_1 int 32 regular {fifo 0 volatile }  }
	{ xtile_V_vec_0 int 32 regular {fifo 0 volatile }  }
	{ xtile_V_vec_1 int 32 regular {fifo 0 volatile }  }
	{ ypartial int 32 regular {array 8 { 2 3 } 1 1 }  }
	{ i1 int 32 unused {pointer 0}  }
	{ i2 int 32 regular {pointer 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "Atile_V_vec_0", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "Atile.V.vec","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "Atile_V_vec_1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "Atile.V.vec","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "xtile_V_vec_0", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "xtile.V.vec","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 2}]}]}]} , 
 	{ "Name" : "xtile_V_vec_1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "xtile.V.vec","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 1,"up" : 1,"step" : 2}]}]}]} , 
 	{ "Name" : "ypartial", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "ypartial","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 7,"step" : 1}]}]}]} , 
 	{ "Name" : "i1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "i1","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "i2", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "i2","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ Atile_V_vec_0_dout sc_in sc_lv 32 signal 0 } 
	{ Atile_V_vec_0_empty_n sc_in sc_logic 1 signal 0 } 
	{ Atile_V_vec_0_read sc_out sc_logic 1 signal 0 } 
	{ Atile_V_vec_1_dout sc_in sc_lv 32 signal 1 } 
	{ Atile_V_vec_1_empty_n sc_in sc_logic 1 signal 1 } 
	{ Atile_V_vec_1_read sc_out sc_logic 1 signal 1 } 
	{ xtile_V_vec_0_dout sc_in sc_lv 32 signal 2 } 
	{ xtile_V_vec_0_empty_n sc_in sc_logic 1 signal 2 } 
	{ xtile_V_vec_0_read sc_out sc_logic 1 signal 2 } 
	{ xtile_V_vec_1_dout sc_in sc_lv 32 signal 3 } 
	{ xtile_V_vec_1_empty_n sc_in sc_logic 1 signal 3 } 
	{ xtile_V_vec_1_read sc_out sc_logic 1 signal 3 } 
	{ ypartial_address0 sc_out sc_lv 3 signal 4 } 
	{ ypartial_ce0 sc_out sc_logic 1 signal 4 } 
	{ ypartial_we0 sc_out sc_logic 1 signal 4 } 
	{ ypartial_d0 sc_out sc_lv 32 signal 4 } 
	{ ypartial_q0 sc_in sc_lv 32 signal 4 } 
	{ i1 sc_in sc_lv 32 signal 5 } 
	{ i2 sc_in sc_lv 32 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "Atile_V_vec_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Atile_V_vec_0", "role": "dout" }} , 
 	{ "name": "Atile_V_vec_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Atile_V_vec_0", "role": "empty_n" }} , 
 	{ "name": "Atile_V_vec_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Atile_V_vec_0", "role": "read" }} , 
 	{ "name": "Atile_V_vec_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Atile_V_vec_1", "role": "dout" }} , 
 	{ "name": "Atile_V_vec_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Atile_V_vec_1", "role": "empty_n" }} , 
 	{ "name": "Atile_V_vec_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Atile_V_vec_1", "role": "read" }} , 
 	{ "name": "xtile_V_vec_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "xtile_V_vec_0", "role": "dout" }} , 
 	{ "name": "xtile_V_vec_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xtile_V_vec_0", "role": "empty_n" }} , 
 	{ "name": "xtile_V_vec_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xtile_V_vec_0", "role": "read" }} , 
 	{ "name": "xtile_V_vec_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "xtile_V_vec_1", "role": "dout" }} , 
 	{ "name": "xtile_V_vec_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xtile_V_vec_1", "role": "empty_n" }} , 
 	{ "name": "xtile_V_vec_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xtile_V_vec_1", "role": "read" }} , 
 	{ "name": "ypartial_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "ypartial", "role": "address0" }} , 
 	{ "name": "ypartial_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ypartial", "role": "ce0" }} , 
 	{ "name": "ypartial_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ypartial", "role": "we0" }} , 
 	{ "name": "ypartial_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ypartial", "role": "d0" }} , 
 	{ "name": "ypartial_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ypartial", "role": "q0" }} , 
 	{ "name": "i1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "i1", "role": "default" }} , 
 	{ "name": "i2", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "i2", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "tiled_matvec",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "28", "EstimateLatencyMax" : "30",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "Atile_V_vec_0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "Atile_V_vec_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Atile_V_vec_1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "Atile_V_vec_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "xtile_V_vec_0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "xtile_V_vec_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "xtile_V_vec_1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "xtile_V_vec_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ypartial", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "i1", "Type" : "None", "Direction" : "I"},
			{"Name" : "i2", "Type" : "None", "Direction" : "I"},
			{"Name" : "A_1_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "A_1_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "x_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "x_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "A_0_0", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "A_0_1", "Type" : "OVld", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	tiled_matvec {
		Atile_V_vec_0 {Type I LastRead 1 FirstWrite -1}
		Atile_V_vec_1 {Type I LastRead 1 FirstWrite -1}
		xtile_V_vec_0 {Type I LastRead 1 FirstWrite -1}
		xtile_V_vec_1 {Type I LastRead 1 FirstWrite -1}
		ypartial {Type IO LastRead 4 FirstWrite 5}
		i1 {Type I LastRead -1 FirstWrite -1}
		i2 {Type I LastRead 1 FirstWrite -1}
		A_1_0 {Type IO LastRead -1 FirstWrite -1}
		A_1_1 {Type IO LastRead -1 FirstWrite -1}
		x_0 {Type IO LastRead -1 FirstWrite -1}
		x_1 {Type IO LastRead -1 FirstWrite -1}
		A_0_0 {Type IO LastRead -1 FirstWrite -1}
		A_0_1 {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "28", "Max" : "30"}
	, {"Name" : "Interval", "Min" : "29", "Max" : "31"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	Atile_V_vec_0 { ap_fifo {  { Atile_V_vec_0_dout fifo_data 0 32 }  { Atile_V_vec_0_empty_n fifo_status 0 1 }  { Atile_V_vec_0_read fifo_update 1 1 } } }
	Atile_V_vec_1 { ap_fifo {  { Atile_V_vec_1_dout fifo_data 0 32 }  { Atile_V_vec_1_empty_n fifo_status 0 1 }  { Atile_V_vec_1_read fifo_update 1 1 } } }
	xtile_V_vec_0 { ap_fifo {  { xtile_V_vec_0_dout fifo_data 0 32 }  { xtile_V_vec_0_empty_n fifo_status 0 1 }  { xtile_V_vec_0_read fifo_update 1 1 } } }
	xtile_V_vec_1 { ap_fifo {  { xtile_V_vec_1_dout fifo_data 0 32 }  { xtile_V_vec_1_empty_n fifo_status 0 1 }  { xtile_V_vec_1_read fifo_update 1 1 } } }
	ypartial { ap_memory {  { ypartial_address0 mem_address 1 3 }  { ypartial_ce0 mem_ce 1 1 }  { ypartial_we0 mem_we 1 1 }  { ypartial_d0 mem_din 1 32 }  { ypartial_q0 mem_dout 0 32 } } }
	i1 { ap_none {  { i1 in_data 0 32 } } }
	i2 { ap_none {  { i2 in_data 0 32 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
	Atile_V_vec_0 { fifo_read 2 no_conditional }
	Atile_V_vec_1 { fifo_read 2 no_conditional }
	xtile_V_vec_0 { fifo_read 1 has_conditional }
	xtile_V_vec_1 { fifo_read 1 has_conditional }
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
