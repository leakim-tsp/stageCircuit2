############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
############################################################
open_project matvec
set_top tiled_matvec
add_files matvec.cpp
add_files matvec.h
add_files matvec_pragma.cpp
add_files -tb matvec_testbecnch.cpp
open_solution "Dflow_pipeline_load"
set_part {xc7vx485tffg1157-1}
create_clock -period 10 -name default
source "./matvec/Dflow_pipeline_load/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
