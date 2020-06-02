// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _tiled_matvec_HH_
#define _tiled_matvec_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "tiled_matvec_entry3.h"
#include "tiled_matvec_entry12.h"
#include "Loop_1_proc10.h"
#include "Block_tiled_matvec_s.h"
#include "Loop_memset_y_proc.h"
#include "Loop_5_proc.h"
#include "tiled_matvec_y.h"
#include "tiled_matvec_x.h"
#include "fifo_w32_d2_A.h"
#include "fifo_w32_d4_A.h"
#include "fifo_w32_d3_A.h"
#include "start_for_tiled_mbkb.h"

namespace ap_rtl {

struct tiled_matvec : public sc_module {
    // Port declarations 30
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_lv<32> > Atile_V_vec_0_dout;
    sc_in< sc_logic > Atile_V_vec_0_empty_n;
    sc_out< sc_logic > Atile_V_vec_0_read;
    sc_in< sc_lv<32> > Atile_V_vec_1_dout;
    sc_in< sc_logic > Atile_V_vec_1_empty_n;
    sc_out< sc_logic > Atile_V_vec_1_read;
    sc_in< sc_lv<32> > xtile_V_vec_0_dout;
    sc_in< sc_logic > xtile_V_vec_0_empty_n;
    sc_out< sc_logic > xtile_V_vec_0_read;
    sc_in< sc_lv<32> > xtile_V_vec_1_dout;
    sc_in< sc_logic > xtile_V_vec_1_empty_n;
    sc_out< sc_logic > xtile_V_vec_1_read;
    sc_out< sc_lv<3> > ypartial_address0;
    sc_out< sc_logic > ypartial_ce0;
    sc_out< sc_lv<32> > ypartial_d0;
    sc_in< sc_lv<32> > ypartial_q0;
    sc_out< sc_logic > ypartial_we0;
    sc_out< sc_lv<3> > ypartial_address1;
    sc_out< sc_logic > ypartial_ce1;
    sc_out< sc_lv<32> > ypartial_d1;
    sc_in< sc_lv<32> > ypartial_q1;
    sc_out< sc_logic > ypartial_we1;
    sc_in< sc_lv<32> > i1;
    sc_in< sc_lv<32> > i2;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_ready;
    sc_out< sc_logic > ap_idle;
    sc_signal< sc_logic > ap_var_for_const2;
    sc_signal< sc_logic > ap_var_for_const0;
    sc_signal< sc_lv<32> > ap_var_for_const1;


    // Module declarations
    tiled_matvec(sc_module_name name);
    SC_HAS_PROCESS(tiled_matvec);

    ~tiled_matvec();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    tiled_matvec_y* y_U;
    tiled_matvec_entry3* tiled_matvec_entry3_U0;
    tiled_matvec_entry12* tiled_matvec_entry12_U0;
    Loop_1_proc10* Loop_1_proc10_U0;
    Block_tiled_matvec_s* Block_tiled_matvec_U0;
    Loop_memset_y_proc* Loop_memset_y_proc_U0;
    Loop_5_proc* Loop_5_proc_U0;
    tiled_matvec_x* x_U;
    fifo_w32_d2_A* i2_c1_U;
    fifo_w32_d2_A* i2_c_U;
    fifo_w32_d4_A* A_U;
    fifo_w32_d3_A* i2_load_loc_c_U;
    start_for_tiled_mbkb* start_for_tiled_mbkb_U;
    sc_signal< sc_lv<32> > y_i_q0;
    sc_signal< sc_lv<32> > y_t_q0;
    sc_signal< sc_logic > tiled_matvec_entry3_U0_ap_start;
    sc_signal< sc_logic > tiled_matvec_entry3_U0_ap_done;
    sc_signal< sc_logic > tiled_matvec_entry3_U0_ap_continue;
    sc_signal< sc_logic > tiled_matvec_entry3_U0_ap_idle;
    sc_signal< sc_logic > tiled_matvec_entry3_U0_ap_ready;
    sc_signal< sc_logic > tiled_matvec_entry3_U0_start_out;
    sc_signal< sc_logic > tiled_matvec_entry3_U0_start_write;
    sc_signal< sc_lv<32> > tiled_matvec_entry3_U0_i2_out_din;
    sc_signal< sc_logic > tiled_matvec_entry3_U0_i2_out_write;
    sc_signal< sc_logic > tiled_matvec_entry12_U0_ap_start;
    sc_signal< sc_logic > tiled_matvec_entry12_U0_ap_done;
    sc_signal< sc_logic > tiled_matvec_entry12_U0_ap_continue;
    sc_signal< sc_logic > tiled_matvec_entry12_U0_ap_idle;
    sc_signal< sc_logic > tiled_matvec_entry12_U0_ap_ready;
    sc_signal< sc_logic > tiled_matvec_entry12_U0_i2_read;
    sc_signal< sc_lv<32> > tiled_matvec_entry12_U0_i2_out_din;
    sc_signal< sc_logic > tiled_matvec_entry12_U0_i2_out_write;
    sc_signal< sc_logic > Loop_1_proc10_U0_ap_start;
    sc_signal< sc_logic > Loop_1_proc10_U0_ap_done;
    sc_signal< sc_logic > Loop_1_proc10_U0_ap_continue;
    sc_signal< sc_logic > Loop_1_proc10_U0_ap_idle;
    sc_signal< sc_logic > Loop_1_proc10_U0_ap_ready;
    sc_signal< sc_logic > Loop_1_proc10_U0_Atile_V_vec_0_read;
    sc_signal< sc_logic > Loop_1_proc10_U0_Atile_V_vec_1_read;
    sc_signal< sc_lv<32> > Loop_1_proc10_U0_A_din;
    sc_signal< sc_logic > Loop_1_proc10_U0_A_write;
    sc_signal< sc_logic > Block_tiled_matvec_U0_ap_start;
    sc_signal< sc_logic > Block_tiled_matvec_U0_ap_done;
    sc_signal< sc_logic > Block_tiled_matvec_U0_ap_continue;
    sc_signal< sc_logic > Block_tiled_matvec_U0_ap_idle;
    sc_signal< sc_logic > Block_tiled_matvec_U0_ap_ready;
    sc_signal< sc_logic > Block_tiled_matvec_U0_i2_read;
    sc_signal< sc_logic > Block_tiled_matvec_U0_xtile_V_vec_0_read;
    sc_signal< sc_logic > Block_tiled_matvec_U0_xtile_V_vec_1_read;
    sc_signal< sc_lv<1> > Block_tiled_matvec_U0_x_address0;
    sc_signal< sc_logic > Block_tiled_matvec_U0_x_ce0;
    sc_signal< sc_logic > Block_tiled_matvec_U0_x_we0;
    sc_signal< sc_lv<32> > Block_tiled_matvec_U0_x_d0;
    sc_signal< sc_lv<32> > Block_tiled_matvec_U0_i2_load_out_out_din;
    sc_signal< sc_logic > Block_tiled_matvec_U0_i2_load_out_out_write;
    sc_signal< sc_logic > ap_channel_done_x;
    sc_signal< sc_logic > Block_tiled_matvec_U0_x_full_n;
    sc_signal< sc_logic > Loop_memset_y_proc_U0_ap_start;
    sc_signal< sc_logic > Loop_memset_y_proc_U0_ap_done;
    sc_signal< sc_logic > Loop_memset_y_proc_U0_ap_continue;
    sc_signal< sc_logic > Loop_memset_y_proc_U0_ap_idle;
    sc_signal< sc_logic > Loop_memset_y_proc_U0_ap_ready;
    sc_signal< sc_lv<1> > Loop_memset_y_proc_U0_y_address0;
    sc_signal< sc_logic > Loop_memset_y_proc_U0_y_ce0;
    sc_signal< sc_logic > Loop_memset_y_proc_U0_y_we0;
    sc_signal< sc_lv<32> > Loop_memset_y_proc_U0_y_d0;
    sc_signal< sc_logic > Loop_memset_y_proc_U0_A_read;
    sc_signal< sc_lv<1> > Loop_memset_y_proc_U0_x_address0;
    sc_signal< sc_logic > Loop_memset_y_proc_U0_x_ce0;
    sc_signal< sc_logic > ap_channel_done_y;
    sc_signal< sc_logic > Loop_memset_y_proc_U0_y_full_n;
    sc_signal< sc_logic > Loop_5_proc_U0_ap_start;
    sc_signal< sc_logic > Loop_5_proc_U0_ap_done;
    sc_signal< sc_logic > Loop_5_proc_U0_ap_continue;
    sc_signal< sc_logic > Loop_5_proc_U0_ap_idle;
    sc_signal< sc_logic > Loop_5_proc_U0_ap_ready;
    sc_signal< sc_lv<1> > Loop_5_proc_U0_y_address0;
    sc_signal< sc_logic > Loop_5_proc_U0_y_ce0;
    sc_signal< sc_logic > Loop_5_proc_U0_i2_load_loc_read;
    sc_signal< sc_lv<3> > Loop_5_proc_U0_ypartial_address0;
    sc_signal< sc_logic > Loop_5_proc_U0_ypartial_ce0;
    sc_signal< sc_logic > Loop_5_proc_U0_ypartial_we0;
    sc_signal< sc_lv<32> > Loop_5_proc_U0_ypartial_d0;
    sc_signal< sc_logic > ap_sync_continue;
    sc_signal< sc_lv<32> > x_i_q0;
    sc_signal< sc_lv<32> > x_t_q0;
    sc_signal< sc_logic > x_i_full_n;
    sc_signal< sc_logic > x_t_empty_n;
    sc_signal< sc_logic > y_i_full_n;
    sc_signal< sc_logic > y_t_empty_n;
    sc_signal< sc_logic > i2_c1_full_n;
    sc_signal< sc_lv<32> > i2_c1_dout;
    sc_signal< sc_logic > i2_c1_empty_n;
    sc_signal< sc_logic > i2_c_full_n;
    sc_signal< sc_lv<32> > i2_c_dout;
    sc_signal< sc_logic > i2_c_empty_n;
    sc_signal< sc_logic > A_full_n;
    sc_signal< sc_lv<32> > A_dout;
    sc_signal< sc_logic > A_empty_n;
    sc_signal< sc_logic > i2_load_loc_c_full_n;
    sc_signal< sc_lv<32> > i2_load_loc_c_dout;
    sc_signal< sc_logic > i2_load_loc_c_empty_n;
    sc_signal< sc_logic > ap_sync_done;
    sc_signal< sc_logic > ap_sync_ready;
    sc_signal< sc_logic > ap_sync_reg_tiled_matvec_entry3_U0_ap_ready;
    sc_signal< sc_logic > ap_sync_tiled_matvec_entry3_U0_ap_ready;
    sc_signal< sc_lv<2> > tiled_matvec_entry3_U0_ap_ready_count;
    sc_signal< sc_logic > ap_sync_reg_Loop_1_proc10_U0_ap_ready;
    sc_signal< sc_logic > ap_sync_Loop_1_proc10_U0_ap_ready;
    sc_signal< sc_lv<2> > Loop_1_proc10_U0_ap_ready_count;
    sc_signal< sc_logic > ap_sync_reg_Block_tiled_matvec_U0_ap_ready;
    sc_signal< sc_logic > ap_sync_Block_tiled_matvec_U0_ap_ready;
    sc_signal< sc_lv<2> > Block_tiled_matvec_U0_ap_ready_count;
    sc_signal< sc_logic > ap_sync_reg_Loop_5_proc_U0_ap_ready;
    sc_signal< sc_logic > ap_sync_Loop_5_proc_U0_ap_ready;
    sc_signal< sc_lv<2> > Loop_5_proc_U0_ap_ready_count;
    sc_signal< sc_lv<1> > start_for_tiled_matvec_entry12_U0_din;
    sc_signal< sc_logic > start_for_tiled_matvec_entry12_U0_full_n;
    sc_signal< sc_lv<1> > start_for_tiled_matvec_entry12_U0_dout;
    sc_signal< sc_logic > start_for_tiled_matvec_entry12_U0_empty_n;
    sc_signal< sc_logic > tiled_matvec_entry12_U0_start_full_n;
    sc_signal< sc_logic > tiled_matvec_entry12_U0_start_write;
    sc_signal< sc_logic > Loop_1_proc10_U0_start_full_n;
    sc_signal< sc_logic > Loop_1_proc10_U0_start_write;
    sc_signal< sc_logic > Block_tiled_matvec_U0_start_full_n;
    sc_signal< sc_logic > Block_tiled_matvec_U0_start_write;
    sc_signal< sc_logic > Loop_memset_y_proc_U0_start_full_n;
    sc_signal< sc_logic > Loop_memset_y_proc_U0_start_write;
    sc_signal< sc_logic > Loop_5_proc_U0_start_full_n;
    sc_signal< sc_logic > Loop_5_proc_U0_start_write;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<3> ap_const_lv3_0;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<2> ap_const_lv2_0;
    static const sc_lv<2> ap_const_lv2_1;
    static const bool ap_const_boolean_1;
    // Thread declarations
    void thread_ap_var_for_const2();
    void thread_ap_var_for_const0();
    void thread_ap_var_for_const1();
    void thread_ap_clk_no_reset_();
    void thread_Atile_V_vec_0_read();
    void thread_Atile_V_vec_1_read();
    void thread_Block_tiled_matvec_U0_ap_continue();
    void thread_Block_tiled_matvec_U0_ap_start();
    void thread_Block_tiled_matvec_U0_start_full_n();
    void thread_Block_tiled_matvec_U0_start_write();
    void thread_Block_tiled_matvec_U0_x_full_n();
    void thread_Loop_1_proc10_U0_ap_continue();
    void thread_Loop_1_proc10_U0_ap_start();
    void thread_Loop_1_proc10_U0_start_full_n();
    void thread_Loop_1_proc10_U0_start_write();
    void thread_Loop_5_proc_U0_ap_continue();
    void thread_Loop_5_proc_U0_ap_start();
    void thread_Loop_5_proc_U0_start_full_n();
    void thread_Loop_5_proc_U0_start_write();
    void thread_Loop_memset_y_proc_U0_ap_continue();
    void thread_Loop_memset_y_proc_U0_ap_start();
    void thread_Loop_memset_y_proc_U0_start_full_n();
    void thread_Loop_memset_y_proc_U0_start_write();
    void thread_Loop_memset_y_proc_U0_y_full_n();
    void thread_ap_channel_done_x();
    void thread_ap_channel_done_y();
    void thread_ap_done();
    void thread_ap_idle();
    void thread_ap_ready();
    void thread_ap_sync_Block_tiled_matvec_U0_ap_ready();
    void thread_ap_sync_Loop_1_proc10_U0_ap_ready();
    void thread_ap_sync_Loop_5_proc_U0_ap_ready();
    void thread_ap_sync_continue();
    void thread_ap_sync_done();
    void thread_ap_sync_ready();
    void thread_ap_sync_tiled_matvec_entry3_U0_ap_ready();
    void thread_start_for_tiled_matvec_entry12_U0_din();
    void thread_tiled_matvec_entry12_U0_ap_continue();
    void thread_tiled_matvec_entry12_U0_ap_start();
    void thread_tiled_matvec_entry12_U0_start_full_n();
    void thread_tiled_matvec_entry12_U0_start_write();
    void thread_tiled_matvec_entry3_U0_ap_continue();
    void thread_tiled_matvec_entry3_U0_ap_start();
    void thread_xtile_V_vec_0_read();
    void thread_xtile_V_vec_1_read();
    void thread_ypartial_address0();
    void thread_ypartial_address1();
    void thread_ypartial_ce0();
    void thread_ypartial_ce1();
    void thread_ypartial_d0();
    void thread_ypartial_d1();
    void thread_ypartial_we0();
    void thread_ypartial_we1();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif
