set moduleName Block_tiled_matvec_s
set isTopModule 0
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
set C_modelName {Block_tiled_matvec_.}
set C_modelType { void 0 }
set C_modelArgList {
	{ i2 int 32 regular {fifo 0}  }
	{ xtile_V_vec_0 int 32 regular {fifo 0 volatile }  }
	{ xtile_V_vec_1 int 32 regular {fifo 0 volatile }  }
	{ x int 32 regular {array 2 { 0 3 } 0 1 }  }
	{ i2_load_out_out int 32 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "i2", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "xtile_V_vec_0", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "xtile_V_vec_1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "x", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "i2_load_out_out", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 23
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ i2_dout sc_in sc_lv 32 signal 0 } 
	{ i2_empty_n sc_in sc_logic 1 signal 0 } 
	{ i2_read sc_out sc_logic 1 signal 0 } 
	{ xtile_V_vec_0_dout sc_in sc_lv 32 signal 1 } 
	{ xtile_V_vec_0_empty_n sc_in sc_logic 1 signal 1 } 
	{ xtile_V_vec_0_read sc_out sc_logic 1 signal 1 } 
	{ xtile_V_vec_1_dout sc_in sc_lv 32 signal 2 } 
	{ xtile_V_vec_1_empty_n sc_in sc_logic 1 signal 2 } 
	{ xtile_V_vec_1_read sc_out sc_logic 1 signal 2 } 
	{ x_address0 sc_out sc_lv 1 signal 3 } 
	{ x_ce0 sc_out sc_logic 1 signal 3 } 
	{ x_we0 sc_out sc_logic 1 signal 3 } 
	{ x_d0 sc_out sc_lv 32 signal 3 } 
	{ i2_load_out_out_din sc_out sc_lv 32 signal 4 } 
	{ i2_load_out_out_full_n sc_in sc_logic 1 signal 4 } 
	{ i2_load_out_out_write sc_out sc_logic 1 signal 4 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "i2_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "i2", "role": "dout" }} , 
 	{ "name": "i2_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "i2", "role": "empty_n" }} , 
 	{ "name": "i2_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "i2", "role": "read" }} , 
 	{ "name": "xtile_V_vec_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "xtile_V_vec_0", "role": "dout" }} , 
 	{ "name": "xtile_V_vec_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xtile_V_vec_0", "role": "empty_n" }} , 
 	{ "name": "xtile_V_vec_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xtile_V_vec_0", "role": "read" }} , 
 	{ "name": "xtile_V_vec_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "xtile_V_vec_1", "role": "dout" }} , 
 	{ "name": "xtile_V_vec_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xtile_V_vec_1", "role": "empty_n" }} , 
 	{ "name": "xtile_V_vec_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "xtile_V_vec_1", "role": "read" }} , 
 	{ "name": "x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "x", "role": "address0" }} , 
 	{ "name": "x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x", "role": "ce0" }} , 
 	{ "name": "x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "x", "role": "we0" }} , 
 	{ "name": "x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "x", "role": "d0" }} , 
 	{ "name": "i2_load_out_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "i2_load_out_out", "role": "din" }} , 
 	{ "name": "i2_load_out_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "i2_load_out_out", "role": "full_n" }} , 
 	{ "name": "i2_load_out_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "i2_load_out_out", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "Block_tiled_matvec_s",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "i2", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "i2_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "xtile_V_vec_0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "xtile_V_vec_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "xtile_V_vec_1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "xtile_V_vec_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "x", "Type" : "Memory", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "i2_load_out_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "i2_load_out_out_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	Block_tiled_matvec_s {
		i2 {Type I LastRead 0 FirstWrite -1}
		xtile_V_vec_0 {Type I LastRead 0 FirstWrite -1}
		xtile_V_vec_1 {Type I LastRead 0 FirstWrite -1}
		x {Type O LastRead -1 FirstWrite 1}
		i2_load_out_out {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "4"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "4"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	i2 { ap_fifo {  { i2_dout fifo_data 0 32 }  { i2_empty_n fifo_status 0 1 }  { i2_read fifo_update 1 1 } } }
	xtile_V_vec_0 { ap_fifo {  { xtile_V_vec_0_dout fifo_data 0 32 }  { xtile_V_vec_0_empty_n fifo_status 0 1 }  { xtile_V_vec_0_read fifo_update 1 1 } } }
	xtile_V_vec_1 { ap_fifo {  { xtile_V_vec_1_dout fifo_data 0 32 }  { xtile_V_vec_1_empty_n fifo_status 0 1 }  { xtile_V_vec_1_read fifo_update 1 1 } } }
	x { ap_memory {  { x_address0 mem_address 1 1 }  { x_ce0 mem_ce 1 1 }  { x_we0 mem_we 1 1 }  { x_d0 mem_din 1 32 } } }
	i2_load_out_out { ap_fifo {  { i2_load_out_out_din fifo_data 1 32 }  { i2_load_out_out_full_n fifo_status 0 1 }  { i2_load_out_out_write fifo_update 1 1 } } }
}
