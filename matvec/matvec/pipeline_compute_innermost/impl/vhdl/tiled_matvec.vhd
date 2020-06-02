-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tiled_matvec is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    Atile_V_vec_0_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    Atile_V_vec_0_empty_n : IN STD_LOGIC;
    Atile_V_vec_0_read : OUT STD_LOGIC;
    Atile_V_vec_1_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    Atile_V_vec_1_empty_n : IN STD_LOGIC;
    Atile_V_vec_1_read : OUT STD_LOGIC;
    xtile_V_vec_0_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    xtile_V_vec_0_empty_n : IN STD_LOGIC;
    xtile_V_vec_0_read : OUT STD_LOGIC;
    xtile_V_vec_1_dout : IN STD_LOGIC_VECTOR (31 downto 0);
    xtile_V_vec_1_empty_n : IN STD_LOGIC;
    xtile_V_vec_1_read : OUT STD_LOGIC;
    ypartial_address0 : OUT STD_LOGIC_VECTOR (2 downto 0);
    ypartial_ce0 : OUT STD_LOGIC;
    ypartial_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
    ypartial_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    ypartial_we0 : OUT STD_LOGIC;
    ypartial_address1 : OUT STD_LOGIC_VECTOR (2 downto 0);
    ypartial_ce1 : OUT STD_LOGIC;
    ypartial_d1 : OUT STD_LOGIC_VECTOR (31 downto 0);
    ypartial_q1 : IN STD_LOGIC_VECTOR (31 downto 0);
    ypartial_we1 : OUT STD_LOGIC;
    i1 : IN STD_LOGIC_VECTOR (31 downto 0);
    i2 : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC );
end;


architecture behav of tiled_matvec is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "tiled_matvec,hls_ip_2019_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7vx485t-ffg1157-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=6.610000,HLS_SYN_LAT=19,HLS_SYN_TPT=14,HLS_SYN_MEM=0,HLS_SYN_DSP=3,HLS_SYN_FF=512,HLS_SYN_LUT=1140,HLS_VERSION=2019_2}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal y_i_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal y_t_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal tiled_matvec_entry3_U0_ap_start : STD_LOGIC;
    signal tiled_matvec_entry3_U0_ap_done : STD_LOGIC;
    signal tiled_matvec_entry3_U0_ap_continue : STD_LOGIC;
    signal tiled_matvec_entry3_U0_ap_idle : STD_LOGIC;
    signal tiled_matvec_entry3_U0_ap_ready : STD_LOGIC;
    signal tiled_matvec_entry3_U0_start_out : STD_LOGIC;
    signal tiled_matvec_entry3_U0_start_write : STD_LOGIC;
    signal tiled_matvec_entry3_U0_i2_out_din : STD_LOGIC_VECTOR (31 downto 0);
    signal tiled_matvec_entry3_U0_i2_out_write : STD_LOGIC;
    signal tiled_matvec_entry12_U0_ap_start : STD_LOGIC;
    signal tiled_matvec_entry12_U0_ap_done : STD_LOGIC;
    signal tiled_matvec_entry12_U0_ap_continue : STD_LOGIC;
    signal tiled_matvec_entry12_U0_ap_idle : STD_LOGIC;
    signal tiled_matvec_entry12_U0_ap_ready : STD_LOGIC;
    signal tiled_matvec_entry12_U0_i2_read : STD_LOGIC;
    signal tiled_matvec_entry12_U0_i2_out_din : STD_LOGIC_VECTOR (31 downto 0);
    signal tiled_matvec_entry12_U0_i2_out_write : STD_LOGIC;
    signal Loop_1_proc10_U0_ap_start : STD_LOGIC;
    signal Loop_1_proc10_U0_ap_done : STD_LOGIC;
    signal Loop_1_proc10_U0_ap_continue : STD_LOGIC;
    signal Loop_1_proc10_U0_ap_idle : STD_LOGIC;
    signal Loop_1_proc10_U0_ap_ready : STD_LOGIC;
    signal Loop_1_proc10_U0_Atile_V_vec_0_read : STD_LOGIC;
    signal Loop_1_proc10_U0_Atile_V_vec_1_read : STD_LOGIC;
    signal Loop_1_proc10_U0_A_din : STD_LOGIC_VECTOR (31 downto 0);
    signal Loop_1_proc10_U0_A_write : STD_LOGIC;
    signal Block_tiled_matvec_U0_ap_start : STD_LOGIC;
    signal Block_tiled_matvec_U0_ap_done : STD_LOGIC;
    signal Block_tiled_matvec_U0_ap_continue : STD_LOGIC;
    signal Block_tiled_matvec_U0_ap_idle : STD_LOGIC;
    signal Block_tiled_matvec_U0_ap_ready : STD_LOGIC;
    signal Block_tiled_matvec_U0_i2_read : STD_LOGIC;
    signal Block_tiled_matvec_U0_xtile_V_vec_0_read : STD_LOGIC;
    signal Block_tiled_matvec_U0_xtile_V_vec_1_read : STD_LOGIC;
    signal Block_tiled_matvec_U0_x_address0 : STD_LOGIC_VECTOR (0 downto 0);
    signal Block_tiled_matvec_U0_x_ce0 : STD_LOGIC;
    signal Block_tiled_matvec_U0_x_we0 : STD_LOGIC;
    signal Block_tiled_matvec_U0_x_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal Block_tiled_matvec_U0_i2_load_out_out_din : STD_LOGIC_VECTOR (31 downto 0);
    signal Block_tiled_matvec_U0_i2_load_out_out_write : STD_LOGIC;
    signal ap_channel_done_x : STD_LOGIC;
    signal Block_tiled_matvec_U0_x_full_n : STD_LOGIC;
    signal Loop_memset_y_proc_U0_ap_start : STD_LOGIC;
    signal Loop_memset_y_proc_U0_ap_done : STD_LOGIC;
    signal Loop_memset_y_proc_U0_ap_continue : STD_LOGIC;
    signal Loop_memset_y_proc_U0_ap_idle : STD_LOGIC;
    signal Loop_memset_y_proc_U0_ap_ready : STD_LOGIC;
    signal Loop_memset_y_proc_U0_y_address0 : STD_LOGIC_VECTOR (0 downto 0);
    signal Loop_memset_y_proc_U0_y_ce0 : STD_LOGIC;
    signal Loop_memset_y_proc_U0_y_we0 : STD_LOGIC;
    signal Loop_memset_y_proc_U0_y_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal Loop_memset_y_proc_U0_A_read : STD_LOGIC;
    signal Loop_memset_y_proc_U0_x_address0 : STD_LOGIC_VECTOR (0 downto 0);
    signal Loop_memset_y_proc_U0_x_ce0 : STD_LOGIC;
    signal ap_channel_done_y : STD_LOGIC;
    signal Loop_memset_y_proc_U0_y_full_n : STD_LOGIC;
    signal Loop_5_proc_U0_ap_start : STD_LOGIC;
    signal Loop_5_proc_U0_ap_done : STD_LOGIC;
    signal Loop_5_proc_U0_ap_continue : STD_LOGIC;
    signal Loop_5_proc_U0_ap_idle : STD_LOGIC;
    signal Loop_5_proc_U0_ap_ready : STD_LOGIC;
    signal Loop_5_proc_U0_y_address0 : STD_LOGIC_VECTOR (0 downto 0);
    signal Loop_5_proc_U0_y_ce0 : STD_LOGIC;
    signal Loop_5_proc_U0_i2_load_loc_read : STD_LOGIC;
    signal Loop_5_proc_U0_ypartial_address0 : STD_LOGIC_VECTOR (2 downto 0);
    signal Loop_5_proc_U0_ypartial_ce0 : STD_LOGIC;
    signal Loop_5_proc_U0_ypartial_we0 : STD_LOGIC;
    signal Loop_5_proc_U0_ypartial_d0 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_sync_continue : STD_LOGIC;
    signal x_i_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal x_t_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal x_i_full_n : STD_LOGIC;
    signal x_t_empty_n : STD_LOGIC;
    signal y_i_full_n : STD_LOGIC;
    signal y_t_empty_n : STD_LOGIC;
    signal i2_c1_full_n : STD_LOGIC;
    signal i2_c1_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal i2_c1_empty_n : STD_LOGIC;
    signal i2_c_full_n : STD_LOGIC;
    signal i2_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal i2_c_empty_n : STD_LOGIC;
    signal A_full_n : STD_LOGIC;
    signal A_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal A_empty_n : STD_LOGIC;
    signal i2_load_loc_c_full_n : STD_LOGIC;
    signal i2_load_loc_c_dout : STD_LOGIC_VECTOR (31 downto 0);
    signal i2_load_loc_c_empty_n : STD_LOGIC;
    signal ap_sync_done : STD_LOGIC;
    signal ap_sync_ready : STD_LOGIC;
    signal ap_sync_reg_tiled_matvec_entry3_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_tiled_matvec_entry3_U0_ap_ready : STD_LOGIC;
    signal tiled_matvec_entry3_U0_ap_ready_count : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal ap_sync_reg_Loop_1_proc10_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_Loop_1_proc10_U0_ap_ready : STD_LOGIC;
    signal Loop_1_proc10_U0_ap_ready_count : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal ap_sync_reg_Block_tiled_matvec_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_Block_tiled_matvec_U0_ap_ready : STD_LOGIC;
    signal Block_tiled_matvec_U0_ap_ready_count : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal ap_sync_reg_Loop_5_proc_U0_ap_ready : STD_LOGIC := '0';
    signal ap_sync_Loop_5_proc_U0_ap_ready : STD_LOGIC;
    signal Loop_5_proc_U0_ap_ready_count : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal start_for_tiled_matvec_entry12_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_tiled_matvec_entry12_U0_full_n : STD_LOGIC;
    signal start_for_tiled_matvec_entry12_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_tiled_matvec_entry12_U0_empty_n : STD_LOGIC;
    signal tiled_matvec_entry12_U0_start_full_n : STD_LOGIC;
    signal tiled_matvec_entry12_U0_start_write : STD_LOGIC;
    signal Loop_1_proc10_U0_start_full_n : STD_LOGIC;
    signal Loop_1_proc10_U0_start_write : STD_LOGIC;
    signal Block_tiled_matvec_U0_start_full_n : STD_LOGIC;
    signal Block_tiled_matvec_U0_start_write : STD_LOGIC;
    signal Loop_memset_y_proc_U0_start_full_n : STD_LOGIC;
    signal Loop_memset_y_proc_U0_start_write : STD_LOGIC;
    signal Loop_5_proc_U0_start_full_n : STD_LOGIC;
    signal Loop_5_proc_U0_start_write : STD_LOGIC;

    component tiled_matvec_entry3 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        i2 : IN STD_LOGIC_VECTOR (31 downto 0);
        i2_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        i2_out_full_n : IN STD_LOGIC;
        i2_out_write : OUT STD_LOGIC );
    end component;


    component tiled_matvec_entry12 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        i2_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        i2_empty_n : IN STD_LOGIC;
        i2_read : OUT STD_LOGIC;
        i2_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        i2_out_full_n : IN STD_LOGIC;
        i2_out_write : OUT STD_LOGIC );
    end component;


    component Loop_1_proc10 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        Atile_V_vec_0_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        Atile_V_vec_0_empty_n : IN STD_LOGIC;
        Atile_V_vec_0_read : OUT STD_LOGIC;
        Atile_V_vec_1_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        Atile_V_vec_1_empty_n : IN STD_LOGIC;
        Atile_V_vec_1_read : OUT STD_LOGIC;
        A_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        A_full_n : IN STD_LOGIC;
        A_write : OUT STD_LOGIC );
    end component;


    component Block_tiled_matvec_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        i2_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        i2_empty_n : IN STD_LOGIC;
        i2_read : OUT STD_LOGIC;
        xtile_V_vec_0_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        xtile_V_vec_0_empty_n : IN STD_LOGIC;
        xtile_V_vec_0_read : OUT STD_LOGIC;
        xtile_V_vec_1_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        xtile_V_vec_1_empty_n : IN STD_LOGIC;
        xtile_V_vec_1_read : OUT STD_LOGIC;
        x_address0 : OUT STD_LOGIC_VECTOR (0 downto 0);
        x_ce0 : OUT STD_LOGIC;
        x_we0 : OUT STD_LOGIC;
        x_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        i2_load_out_out_din : OUT STD_LOGIC_VECTOR (31 downto 0);
        i2_load_out_out_full_n : IN STD_LOGIC;
        i2_load_out_out_write : OUT STD_LOGIC );
    end component;


    component Loop_memset_y_proc IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        y_address0 : OUT STD_LOGIC_VECTOR (0 downto 0);
        y_ce0 : OUT STD_LOGIC;
        y_we0 : OUT STD_LOGIC;
        y_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        y_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        A_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        A_empty_n : IN STD_LOGIC;
        A_read : OUT STD_LOGIC;
        x_address0 : OUT STD_LOGIC_VECTOR (0 downto 0);
        x_ce0 : OUT STD_LOGIC;
        x_q0 : IN STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component Loop_5_proc IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        y_address0 : OUT STD_LOGIC_VECTOR (0 downto 0);
        y_ce0 : OUT STD_LOGIC;
        y_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        i2_load_loc_dout : IN STD_LOGIC_VECTOR (31 downto 0);
        i2_load_loc_empty_n : IN STD_LOGIC;
        i2_load_loc_read : OUT STD_LOGIC;
        ypartial_address0 : OUT STD_LOGIC_VECTOR (2 downto 0);
        ypartial_ce0 : OUT STD_LOGIC;
        ypartial_we0 : OUT STD_LOGIC;
        ypartial_d0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ypartial_q0 : IN STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component tiled_matvec_y IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        i_address0 : IN STD_LOGIC_VECTOR (0 downto 0);
        i_ce0 : IN STD_LOGIC;
        i_we0 : IN STD_LOGIC;
        i_d0 : IN STD_LOGIC_VECTOR (31 downto 0);
        i_q0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        t_address0 : IN STD_LOGIC_VECTOR (0 downto 0);
        t_ce0 : IN STD_LOGIC;
        t_we0 : IN STD_LOGIC;
        t_d0 : IN STD_LOGIC_VECTOR (31 downto 0);
        t_q0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        i_ce : IN STD_LOGIC;
        t_ce : IN STD_LOGIC;
        i_full_n : OUT STD_LOGIC;
        i_write : IN STD_LOGIC;
        t_empty_n : OUT STD_LOGIC;
        t_read : IN STD_LOGIC );
    end component;


    component tiled_matvec_x IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        i_address0 : IN STD_LOGIC_VECTOR (0 downto 0);
        i_ce0 : IN STD_LOGIC;
        i_we0 : IN STD_LOGIC;
        i_d0 : IN STD_LOGIC_VECTOR (31 downto 0);
        i_q0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        t_address0 : IN STD_LOGIC_VECTOR (0 downto 0);
        t_ce0 : IN STD_LOGIC;
        t_we0 : IN STD_LOGIC;
        t_d0 : IN STD_LOGIC_VECTOR (31 downto 0);
        t_q0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        i_ce : IN STD_LOGIC;
        t_ce : IN STD_LOGIC;
        i_full_n : OUT STD_LOGIC;
        i_write : IN STD_LOGIC;
        t_empty_n : OUT STD_LOGIC;
        t_read : IN STD_LOGIC );
    end component;


    component fifo_w32_d2_A IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component fifo_w32_d4_A IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component fifo_w32_d3_A IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (31 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (31 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_tiled_mbkb IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    y_U : component tiled_matvec_y
    generic map (
        DataWidth => 32,
        AddressRange => 2,
        AddressWidth => 1)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        i_address0 => Loop_memset_y_proc_U0_y_address0,
        i_ce0 => Loop_memset_y_proc_U0_y_ce0,
        i_we0 => Loop_memset_y_proc_U0_y_we0,
        i_d0 => Loop_memset_y_proc_U0_y_d0,
        i_q0 => y_i_q0,
        t_address0 => Loop_5_proc_U0_y_address0,
        t_ce0 => Loop_5_proc_U0_y_ce0,
        t_we0 => ap_const_logic_0,
        t_d0 => ap_const_lv32_0,
        t_q0 => y_t_q0,
        i_ce => ap_const_logic_1,
        t_ce => ap_const_logic_1,
        i_full_n => y_i_full_n,
        i_write => Loop_memset_y_proc_U0_ap_done,
        t_empty_n => y_t_empty_n,
        t_read => Loop_5_proc_U0_ap_ready);

    tiled_matvec_entry3_U0 : component tiled_matvec_entry3
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => tiled_matvec_entry3_U0_ap_start,
        start_full_n => start_for_tiled_matvec_entry12_U0_full_n,
        ap_done => tiled_matvec_entry3_U0_ap_done,
        ap_continue => tiled_matvec_entry3_U0_ap_continue,
        ap_idle => tiled_matvec_entry3_U0_ap_idle,
        ap_ready => tiled_matvec_entry3_U0_ap_ready,
        start_out => tiled_matvec_entry3_U0_start_out,
        start_write => tiled_matvec_entry3_U0_start_write,
        i2 => i2,
        i2_out_din => tiled_matvec_entry3_U0_i2_out_din,
        i2_out_full_n => i2_c1_full_n,
        i2_out_write => tiled_matvec_entry3_U0_i2_out_write);

    tiled_matvec_entry12_U0 : component tiled_matvec_entry12
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => tiled_matvec_entry12_U0_ap_start,
        ap_done => tiled_matvec_entry12_U0_ap_done,
        ap_continue => tiled_matvec_entry12_U0_ap_continue,
        ap_idle => tiled_matvec_entry12_U0_ap_idle,
        ap_ready => tiled_matvec_entry12_U0_ap_ready,
        i2_dout => i2_c1_dout,
        i2_empty_n => i2_c1_empty_n,
        i2_read => tiled_matvec_entry12_U0_i2_read,
        i2_out_din => tiled_matvec_entry12_U0_i2_out_din,
        i2_out_full_n => i2_c_full_n,
        i2_out_write => tiled_matvec_entry12_U0_i2_out_write);

    Loop_1_proc10_U0 : component Loop_1_proc10
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => Loop_1_proc10_U0_ap_start,
        ap_done => Loop_1_proc10_U0_ap_done,
        ap_continue => Loop_1_proc10_U0_ap_continue,
        ap_idle => Loop_1_proc10_U0_ap_idle,
        ap_ready => Loop_1_proc10_U0_ap_ready,
        Atile_V_vec_0_dout => Atile_V_vec_0_dout,
        Atile_V_vec_0_empty_n => Atile_V_vec_0_empty_n,
        Atile_V_vec_0_read => Loop_1_proc10_U0_Atile_V_vec_0_read,
        Atile_V_vec_1_dout => Atile_V_vec_1_dout,
        Atile_V_vec_1_empty_n => Atile_V_vec_1_empty_n,
        Atile_V_vec_1_read => Loop_1_proc10_U0_Atile_V_vec_1_read,
        A_din => Loop_1_proc10_U0_A_din,
        A_full_n => A_full_n,
        A_write => Loop_1_proc10_U0_A_write);

    Block_tiled_matvec_U0 : component Block_tiled_matvec_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => Block_tiled_matvec_U0_ap_start,
        ap_done => Block_tiled_matvec_U0_ap_done,
        ap_continue => Block_tiled_matvec_U0_ap_continue,
        ap_idle => Block_tiled_matvec_U0_ap_idle,
        ap_ready => Block_tiled_matvec_U0_ap_ready,
        i2_dout => i2_c_dout,
        i2_empty_n => i2_c_empty_n,
        i2_read => Block_tiled_matvec_U0_i2_read,
        xtile_V_vec_0_dout => xtile_V_vec_0_dout,
        xtile_V_vec_0_empty_n => xtile_V_vec_0_empty_n,
        xtile_V_vec_0_read => Block_tiled_matvec_U0_xtile_V_vec_0_read,
        xtile_V_vec_1_dout => xtile_V_vec_1_dout,
        xtile_V_vec_1_empty_n => xtile_V_vec_1_empty_n,
        xtile_V_vec_1_read => Block_tiled_matvec_U0_xtile_V_vec_1_read,
        x_address0 => Block_tiled_matvec_U0_x_address0,
        x_ce0 => Block_tiled_matvec_U0_x_ce0,
        x_we0 => Block_tiled_matvec_U0_x_we0,
        x_d0 => Block_tiled_matvec_U0_x_d0,
        i2_load_out_out_din => Block_tiled_matvec_U0_i2_load_out_out_din,
        i2_load_out_out_full_n => i2_load_loc_c_full_n,
        i2_load_out_out_write => Block_tiled_matvec_U0_i2_load_out_out_write);

    Loop_memset_y_proc_U0 : component Loop_memset_y_proc
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => Loop_memset_y_proc_U0_ap_start,
        ap_done => Loop_memset_y_proc_U0_ap_done,
        ap_continue => Loop_memset_y_proc_U0_ap_continue,
        ap_idle => Loop_memset_y_proc_U0_ap_idle,
        ap_ready => Loop_memset_y_proc_U0_ap_ready,
        y_address0 => Loop_memset_y_proc_U0_y_address0,
        y_ce0 => Loop_memset_y_proc_U0_y_ce0,
        y_we0 => Loop_memset_y_proc_U0_y_we0,
        y_d0 => Loop_memset_y_proc_U0_y_d0,
        y_q0 => y_i_q0,
        A_dout => A_dout,
        A_empty_n => A_empty_n,
        A_read => Loop_memset_y_proc_U0_A_read,
        x_address0 => Loop_memset_y_proc_U0_x_address0,
        x_ce0 => Loop_memset_y_proc_U0_x_ce0,
        x_q0 => x_t_q0);

    Loop_5_proc_U0 : component Loop_5_proc
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => Loop_5_proc_U0_ap_start,
        ap_done => Loop_5_proc_U0_ap_done,
        ap_continue => Loop_5_proc_U0_ap_continue,
        ap_idle => Loop_5_proc_U0_ap_idle,
        ap_ready => Loop_5_proc_U0_ap_ready,
        y_address0 => Loop_5_proc_U0_y_address0,
        y_ce0 => Loop_5_proc_U0_y_ce0,
        y_q0 => y_t_q0,
        i2_load_loc_dout => i2_load_loc_c_dout,
        i2_load_loc_empty_n => i2_load_loc_c_empty_n,
        i2_load_loc_read => Loop_5_proc_U0_i2_load_loc_read,
        ypartial_address0 => Loop_5_proc_U0_ypartial_address0,
        ypartial_ce0 => Loop_5_proc_U0_ypartial_ce0,
        ypartial_we0 => Loop_5_proc_U0_ypartial_we0,
        ypartial_d0 => Loop_5_proc_U0_ypartial_d0,
        ypartial_q0 => ypartial_q0);

    x_U : component tiled_matvec_x
    generic map (
        DataWidth => 32,
        AddressRange => 2,
        AddressWidth => 1)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        i_address0 => Block_tiled_matvec_U0_x_address0,
        i_ce0 => Block_tiled_matvec_U0_x_ce0,
        i_we0 => Block_tiled_matvec_U0_x_we0,
        i_d0 => Block_tiled_matvec_U0_x_d0,
        i_q0 => x_i_q0,
        t_address0 => Loop_memset_y_proc_U0_x_address0,
        t_ce0 => Loop_memset_y_proc_U0_x_ce0,
        t_we0 => ap_const_logic_0,
        t_d0 => ap_const_lv32_0,
        t_q0 => x_t_q0,
        i_ce => ap_const_logic_1,
        t_ce => ap_const_logic_1,
        i_full_n => x_i_full_n,
        i_write => Block_tiled_matvec_U0_ap_done,
        t_empty_n => x_t_empty_n,
        t_read => Loop_memset_y_proc_U0_ap_ready);

    i2_c1_U : component fifo_w32_d2_A
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => tiled_matvec_entry3_U0_i2_out_din,
        if_full_n => i2_c1_full_n,
        if_write => tiled_matvec_entry3_U0_i2_out_write,
        if_dout => i2_c1_dout,
        if_empty_n => i2_c1_empty_n,
        if_read => tiled_matvec_entry12_U0_i2_read);

    i2_c_U : component fifo_w32_d2_A
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => tiled_matvec_entry12_U0_i2_out_din,
        if_full_n => i2_c_full_n,
        if_write => tiled_matvec_entry12_U0_i2_out_write,
        if_dout => i2_c_dout,
        if_empty_n => i2_c_empty_n,
        if_read => Block_tiled_matvec_U0_i2_read);

    A_U : component fifo_w32_d4_A
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Loop_1_proc10_U0_A_din,
        if_full_n => A_full_n,
        if_write => Loop_1_proc10_U0_A_write,
        if_dout => A_dout,
        if_empty_n => A_empty_n,
        if_read => Loop_memset_y_proc_U0_A_read);

    i2_load_loc_c_U : component fifo_w32_d3_A
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Block_tiled_matvec_U0_i2_load_out_out_din,
        if_full_n => i2_load_loc_c_full_n,
        if_write => Block_tiled_matvec_U0_i2_load_out_out_write,
        if_dout => i2_load_loc_c_dout,
        if_empty_n => i2_load_loc_c_empty_n,
        if_read => Loop_5_proc_U0_i2_load_loc_read);

    start_for_tiled_mbkb_U : component start_for_tiled_mbkb
    port map (
        clk => ap_clk,
        reset => ap_rst,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_tiled_matvec_entry12_U0_din,
        if_full_n => start_for_tiled_matvec_entry12_U0_full_n,
        if_write => tiled_matvec_entry3_U0_start_write,
        if_dout => start_for_tiled_matvec_entry12_U0_dout,
        if_empty_n => start_for_tiled_matvec_entry12_U0_empty_n,
        if_read => tiled_matvec_entry12_U0_ap_ready);





    ap_sync_reg_Block_tiled_matvec_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_Block_tiled_matvec_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_Block_tiled_matvec_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_Block_tiled_matvec_U0_ap_ready <= ap_sync_Block_tiled_matvec_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_Loop_1_proc10_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_Loop_1_proc10_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_Loop_1_proc10_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_Loop_1_proc10_U0_ap_ready <= ap_sync_Loop_1_proc10_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_Loop_5_proc_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_Loop_5_proc_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_Loop_5_proc_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_Loop_5_proc_U0_ap_ready <= ap_sync_Loop_5_proc_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    ap_sync_reg_tiled_matvec_entry3_U0_ap_ready_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_sync_reg_tiled_matvec_entry3_U0_ap_ready <= ap_const_logic_0;
            else
                if (((ap_sync_ready and ap_start) = ap_const_logic_1)) then 
                    ap_sync_reg_tiled_matvec_entry3_U0_ap_ready <= ap_const_logic_0;
                else 
                    ap_sync_reg_tiled_matvec_entry3_U0_ap_ready <= ap_sync_tiled_matvec_entry3_U0_ap_ready;
                end if; 
            end if;
        end if;
    end process;


    Block_tiled_matvec_U0_ap_ready_count_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_0 = Block_tiled_matvec_U0_ap_ready) and (ap_sync_ready = ap_const_logic_1))) then 
                Block_tiled_matvec_U0_ap_ready_count <= std_logic_vector(unsigned(Block_tiled_matvec_U0_ap_ready_count) - unsigned(ap_const_lv2_1));
            elsif (((ap_sync_ready = ap_const_logic_0) and (ap_const_logic_1 = Block_tiled_matvec_U0_ap_ready))) then 
                Block_tiled_matvec_U0_ap_ready_count <= std_logic_vector(unsigned(Block_tiled_matvec_U0_ap_ready_count) + unsigned(ap_const_lv2_1));
            end if; 
        end if;
    end process;

    Loop_1_proc10_U0_ap_ready_count_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_0 = Loop_1_proc10_U0_ap_ready) and (ap_sync_ready = ap_const_logic_1))) then 
                Loop_1_proc10_U0_ap_ready_count <= std_logic_vector(unsigned(Loop_1_proc10_U0_ap_ready_count) - unsigned(ap_const_lv2_1));
            elsif (((ap_sync_ready = ap_const_logic_0) and (ap_const_logic_1 = Loop_1_proc10_U0_ap_ready))) then 
                Loop_1_proc10_U0_ap_ready_count <= std_logic_vector(unsigned(Loop_1_proc10_U0_ap_ready_count) + unsigned(ap_const_lv2_1));
            end if; 
        end if;
    end process;

    Loop_5_proc_U0_ap_ready_count_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_0 = Loop_5_proc_U0_ap_ready) and (ap_sync_ready = ap_const_logic_1))) then 
                Loop_5_proc_U0_ap_ready_count <= std_logic_vector(unsigned(Loop_5_proc_U0_ap_ready_count) - unsigned(ap_const_lv2_1));
            elsif (((ap_sync_ready = ap_const_logic_0) and (ap_const_logic_1 = Loop_5_proc_U0_ap_ready))) then 
                Loop_5_proc_U0_ap_ready_count <= std_logic_vector(unsigned(Loop_5_proc_U0_ap_ready_count) + unsigned(ap_const_lv2_1));
            end if; 
        end if;
    end process;

    tiled_matvec_entry3_U0_ap_ready_count_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((tiled_matvec_entry3_U0_ap_ready = ap_const_logic_0) and (ap_sync_ready = ap_const_logic_1))) then 
                tiled_matvec_entry3_U0_ap_ready_count <= std_logic_vector(unsigned(tiled_matvec_entry3_U0_ap_ready_count) - unsigned(ap_const_lv2_1));
            elsif (((ap_sync_ready = ap_const_logic_0) and (tiled_matvec_entry3_U0_ap_ready = ap_const_logic_1))) then 
                tiled_matvec_entry3_U0_ap_ready_count <= std_logic_vector(unsigned(tiled_matvec_entry3_U0_ap_ready_count) + unsigned(ap_const_lv2_1));
            end if; 
        end if;
    end process;
    Atile_V_vec_0_read <= Loop_1_proc10_U0_Atile_V_vec_0_read;
    Atile_V_vec_1_read <= Loop_1_proc10_U0_Atile_V_vec_1_read;
    Block_tiled_matvec_U0_ap_continue <= x_i_full_n;
    Block_tiled_matvec_U0_ap_start <= ((ap_sync_reg_Block_tiled_matvec_U0_ap_ready xor ap_const_logic_1) and ap_start);
    Block_tiled_matvec_U0_start_full_n <= ap_const_logic_1;
    Block_tiled_matvec_U0_start_write <= ap_const_logic_0;
    Block_tiled_matvec_U0_x_full_n <= x_i_full_n;
    Loop_1_proc10_U0_ap_continue <= ap_const_logic_1;
    Loop_1_proc10_U0_ap_start <= ((ap_sync_reg_Loop_1_proc10_U0_ap_ready xor ap_const_logic_1) and ap_start);
    Loop_1_proc10_U0_start_full_n <= ap_const_logic_1;
    Loop_1_proc10_U0_start_write <= ap_const_logic_0;
    Loop_5_proc_U0_ap_continue <= ap_const_logic_1;
    Loop_5_proc_U0_ap_start <= (y_t_empty_n and (ap_sync_reg_Loop_5_proc_U0_ap_ready xor ap_const_logic_1) and ap_start);
    Loop_5_proc_U0_start_full_n <= ap_const_logic_1;
    Loop_5_proc_U0_start_write <= ap_const_logic_0;
    Loop_memset_y_proc_U0_ap_continue <= y_i_full_n;
    Loop_memset_y_proc_U0_ap_start <= x_t_empty_n;
    Loop_memset_y_proc_U0_start_full_n <= ap_const_logic_1;
    Loop_memset_y_proc_U0_start_write <= ap_const_logic_0;
    Loop_memset_y_proc_U0_y_full_n <= y_i_full_n;
    ap_channel_done_x <= Block_tiled_matvec_U0_ap_done;
    ap_channel_done_y <= Loop_memset_y_proc_U0_ap_done;
    ap_done <= Loop_5_proc_U0_ap_done;
    ap_idle <= (tiled_matvec_entry3_U0_ap_idle and tiled_matvec_entry12_U0_ap_idle and (y_t_empty_n xor ap_const_logic_1) and (x_t_empty_n xor ap_const_logic_1) and Loop_memset_y_proc_U0_ap_idle and Loop_5_proc_U0_ap_idle and Loop_1_proc10_U0_ap_idle and Block_tiled_matvec_U0_ap_idle);
    ap_ready <= ap_sync_ready;
    ap_sync_Block_tiled_matvec_U0_ap_ready <= (ap_sync_reg_Block_tiled_matvec_U0_ap_ready or Block_tiled_matvec_U0_ap_ready);
    ap_sync_Loop_1_proc10_U0_ap_ready <= (ap_sync_reg_Loop_1_proc10_U0_ap_ready or Loop_1_proc10_U0_ap_ready);
    ap_sync_Loop_5_proc_U0_ap_ready <= (ap_sync_reg_Loop_5_proc_U0_ap_ready or Loop_5_proc_U0_ap_ready);
    ap_sync_continue <= ap_const_logic_1;
    ap_sync_done <= Loop_5_proc_U0_ap_done;
    ap_sync_ready <= (ap_sync_tiled_matvec_entry3_U0_ap_ready and ap_sync_Loop_5_proc_U0_ap_ready and ap_sync_Loop_1_proc10_U0_ap_ready and ap_sync_Block_tiled_matvec_U0_ap_ready);
    ap_sync_tiled_matvec_entry3_U0_ap_ready <= (tiled_matvec_entry3_U0_ap_ready or ap_sync_reg_tiled_matvec_entry3_U0_ap_ready);
    start_for_tiled_matvec_entry12_U0_din <= (0=>ap_const_logic_1, others=>'-');
    tiled_matvec_entry12_U0_ap_continue <= ap_const_logic_1;
    tiled_matvec_entry12_U0_ap_start <= start_for_tiled_matvec_entry12_U0_empty_n;
    tiled_matvec_entry12_U0_start_full_n <= ap_const_logic_1;
    tiled_matvec_entry12_U0_start_write <= ap_const_logic_0;
    tiled_matvec_entry3_U0_ap_continue <= ap_const_logic_1;
    tiled_matvec_entry3_U0_ap_start <= ((ap_sync_reg_tiled_matvec_entry3_U0_ap_ready xor ap_const_logic_1) and ap_start);
    xtile_V_vec_0_read <= Block_tiled_matvec_U0_xtile_V_vec_0_read;
    xtile_V_vec_1_read <= Block_tiled_matvec_U0_xtile_V_vec_1_read;
    ypartial_address0 <= Loop_5_proc_U0_ypartial_address0;
    ypartial_address1 <= ap_const_lv3_0;
    ypartial_ce0 <= Loop_5_proc_U0_ypartial_ce0;
    ypartial_ce1 <= ap_const_logic_0;
    ypartial_d0 <= Loop_5_proc_U0_ypartial_d0;
    ypartial_d1 <= ap_const_lv32_0;
    ypartial_we0 <= Loop_5_proc_U0_ypartial_we0;
    ypartial_we1 <= ap_const_logic_0;
end behav;
