
/tools/Xilinx/Vivado/2019.2/bin/xelab xil_defaultlib.apatb_tiled_matvec_top glbl -prj tiled_matvec.prj -L smartconnect_v1_0 -L axi_protocol_checker_v1_1_12 -L axi_protocol_checker_v1_1_13 -L axis_protocol_checker_v1_1_11 -L axis_protocol_checker_v1_1_12 -L xil_defaultlib -L unisims_ver -L xpm --initfile "/tools/Xilinx/Vivado/2019.2/data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s tiled_matvec 
/tools/Xilinx/Vivado/2019.2/bin/xsim --noieeewarnings tiled_matvec -tclbatch tiled_matvec.tcl
