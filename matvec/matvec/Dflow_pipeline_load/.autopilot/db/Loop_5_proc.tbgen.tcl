set moduleName Loop_5_proc
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
set C_modelName {Loop_5_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ y int 32 regular {array 2 { 1 3 } 1 1 }  }
	{ i2_load_loc int 32 regular {fifo 0}  }
	{ ypartial int 32 regular {array 8 { 2 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "y", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "i2_load_loc", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "ypartial", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} ]}
# RTL Port declarations: 
set portNum 18
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ y_address0 sc_out sc_lv 1 signal 0 } 
	{ y_ce0 sc_out sc_logic 1 signal 0 } 
	{ y_q0 sc_in sc_lv 32 signal 0 } 
	{ i2_load_loc_dout sc_in sc_lv 32 signal 1 } 
	{ i2_load_loc_empty_n sc_in sc_logic 1 signal 1 } 
	{ i2_load_loc_read sc_out sc_logic 1 signal 1 } 
	{ ypartial_address0 sc_out sc_lv 3 signal 2 } 
	{ ypartial_ce0 sc_out sc_logic 1 signal 2 } 
	{ ypartial_we0 sc_out sc_logic 1 signal 2 } 
	{ ypartial_d0 sc_out sc_lv 32 signal 2 } 
	{ ypartial_q0 sc_in sc_lv 32 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "y", "role": "address0" }} , 
 	{ "name": "y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "y", "role": "ce0" }} , 
 	{ "name": "y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "y", "role": "q0" }} , 
 	{ "name": "i2_load_loc_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "i2_load_loc", "role": "dout" }} , 
 	{ "name": "i2_load_loc_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "i2_load_loc", "role": "empty_n" }} , 
 	{ "name": "i2_load_loc_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "i2_load_loc", "role": "read" }} , 
 	{ "name": "ypartial_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "ypartial", "role": "address0" }} , 
 	{ "name": "ypartial_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ypartial", "role": "ce0" }} , 
 	{ "name": "ypartial_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ypartial", "role": "we0" }} , 
 	{ "name": "ypartial_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ypartial", "role": "d0" }} , 
 	{ "name": "ypartial_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ypartial", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "Loop_5_proc",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5", "EstimateLatencyMax" : "5",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "y", "Type" : "Memory", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0"},
			{"Name" : "i2_load_loc", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0",
				"BlockSignal" : [
					{"Name" : "i2_load_loc_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "ypartial", "Type" : "Memory", "Direction" : "IO"}]}]}


set ArgLastReadFirstWriteLatency {
	Loop_5_proc {
		y {Type I LastRead 1 FirstWrite -1}
		i2_load_loc {Type I LastRead 0 FirstWrite -1}
		ypartial {Type IO LastRead 1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5", "Max" : "5"}
	, {"Name" : "Interval", "Min" : "5", "Max" : "5"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	y { ap_memory {  { y_address0 mem_address 1 1 }  { y_ce0 mem_ce 1 1 }  { y_q0 mem_dout 0 32 } } }
	i2_load_loc { ap_fifo {  { i2_load_loc_dout fifo_data 0 32 }  { i2_load_loc_empty_n fifo_status 0 1 }  { i2_load_loc_read fifo_update 1 1 } } }
	ypartial { ap_memory {  { ypartial_address0 mem_address 1 3 }  { ypartial_ce0 mem_ce 1 1 }  { ypartial_we0 mem_we 1 1 }  { ypartial_d0 mem_din 1 32 }  { ypartial_q0 mem_dout 0 32 } } }
}
