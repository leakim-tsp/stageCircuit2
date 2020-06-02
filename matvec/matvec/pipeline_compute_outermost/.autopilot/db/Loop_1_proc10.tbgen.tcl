set moduleName Loop_1_proc10
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
set C_modelName {Loop_1_proc10}
set C_modelType { void 0 }
set C_modelArgList {
	{ Atile_V_vec_0 int 32 regular {fifo 0 volatile }  }
	{ Atile_V_vec_1 int 32 regular {fifo 0 volatile }  }
	{ A int 32 regular {array 4 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "Atile_V_vec_0", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "Atile_V_vec_1", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "A", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 17
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ Atile_V_vec_0_dout sc_in sc_lv 32 signal 0 } 
	{ Atile_V_vec_0_empty_n sc_in sc_logic 1 signal 0 } 
	{ Atile_V_vec_0_read sc_out sc_logic 1 signal 0 } 
	{ Atile_V_vec_1_dout sc_in sc_lv 32 signal 1 } 
	{ Atile_V_vec_1_empty_n sc_in sc_logic 1 signal 1 } 
	{ Atile_V_vec_1_read sc_out sc_logic 1 signal 1 } 
	{ A_address0 sc_out sc_lv 2 signal 2 } 
	{ A_ce0 sc_out sc_logic 1 signal 2 } 
	{ A_we0 sc_out sc_logic 1 signal 2 } 
	{ A_d0 sc_out sc_lv 32 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "Atile_V_vec_0_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Atile_V_vec_0", "role": "dout" }} , 
 	{ "name": "Atile_V_vec_0_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Atile_V_vec_0", "role": "empty_n" }} , 
 	{ "name": "Atile_V_vec_0_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Atile_V_vec_0", "role": "read" }} , 
 	{ "name": "Atile_V_vec_1_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Atile_V_vec_1", "role": "dout" }} , 
 	{ "name": "Atile_V_vec_1_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Atile_V_vec_1", "role": "empty_n" }} , 
 	{ "name": "Atile_V_vec_1_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Atile_V_vec_1", "role": "read" }} , 
 	{ "name": "A_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "A", "role": "address0" }} , 
 	{ "name": "A_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "ce0" }} , 
 	{ "name": "A_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "we0" }} , 
 	{ "name": "A_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "Loop_1_proc10",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "11", "EstimateLatencyMax" : "11",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "Atile_V_vec_0", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "Atile_V_vec_0_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Atile_V_vec_1", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "Atile_V_vec_1_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "A", "Type" : "Memory", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0"}]}]}


set ArgLastReadFirstWriteLatency {
	Loop_1_proc10 {
		Atile_V_vec_0 {Type I LastRead 1 FirstWrite -1}
		Atile_V_vec_1 {Type I LastRead 1 FirstWrite -1}
		A {Type O LastRead -1 FirstWrite 2}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "11", "Max" : "11"}
	, {"Name" : "Interval", "Min" : "11", "Max" : "11"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	Atile_V_vec_0 { ap_fifo {  { Atile_V_vec_0_dout fifo_data 0 32 }  { Atile_V_vec_0_empty_n fifo_status 0 1 }  { Atile_V_vec_0_read fifo_update 1 1 } } }
	Atile_V_vec_1 { ap_fifo {  { Atile_V_vec_1_dout fifo_data 0 32 }  { Atile_V_vec_1_empty_n fifo_status 0 1 }  { Atile_V_vec_1_read fifo_update 1 1 } } }
	A { ap_memory {  { A_address0 mem_address 1 2 }  { A_ce0 mem_ce 1 1 }  { A_we0 mem_we 1 1 }  { A_d0 mem_din 1 32 } } }
}
