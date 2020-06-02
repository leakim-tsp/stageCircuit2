// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="tiled_matvec,hls_ip_2019_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7vx485t-ffg1157-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=6.610000,HLS_SYN_LAT=19,HLS_SYN_TPT=14,HLS_SYN_MEM=0,HLS_SYN_DSP=3,HLS_SYN_FF=512,HLS_SYN_LUT=1140,HLS_VERSION=2019_2}" *)

module tiled_matvec (
        ap_clk,
        ap_rst,
        Atile_V_vec_0_dout,
        Atile_V_vec_0_empty_n,
        Atile_V_vec_0_read,
        Atile_V_vec_1_dout,
        Atile_V_vec_1_empty_n,
        Atile_V_vec_1_read,
        xtile_V_vec_0_dout,
        xtile_V_vec_0_empty_n,
        xtile_V_vec_0_read,
        xtile_V_vec_1_dout,
        xtile_V_vec_1_empty_n,
        xtile_V_vec_1_read,
        ypartial_address0,
        ypartial_ce0,
        ypartial_d0,
        ypartial_q0,
        ypartial_we0,
        ypartial_address1,
        ypartial_ce1,
        ypartial_d1,
        ypartial_q1,
        ypartial_we1,
        i1,
        i2,
        ap_start,
        ap_done,
        ap_ready,
        ap_idle
);


input   ap_clk;
input   ap_rst;
input  [31:0] Atile_V_vec_0_dout;
input   Atile_V_vec_0_empty_n;
output   Atile_V_vec_0_read;
input  [31:0] Atile_V_vec_1_dout;
input   Atile_V_vec_1_empty_n;
output   Atile_V_vec_1_read;
input  [31:0] xtile_V_vec_0_dout;
input   xtile_V_vec_0_empty_n;
output   xtile_V_vec_0_read;
input  [31:0] xtile_V_vec_1_dout;
input   xtile_V_vec_1_empty_n;
output   xtile_V_vec_1_read;
output  [2:0] ypartial_address0;
output   ypartial_ce0;
output  [31:0] ypartial_d0;
input  [31:0] ypartial_q0;
output   ypartial_we0;
output  [2:0] ypartial_address1;
output   ypartial_ce1;
output  [31:0] ypartial_d1;
input  [31:0] ypartial_q1;
output   ypartial_we1;
input  [31:0] i1;
input  [31:0] i2;
input   ap_start;
output   ap_done;
output   ap_ready;
output   ap_idle;

wire   [31:0] y_i_q0;
wire   [31:0] y_t_q0;
wire    tiled_matvec_entry3_U0_ap_start;
wire    tiled_matvec_entry3_U0_ap_done;
wire    tiled_matvec_entry3_U0_ap_continue;
wire    tiled_matvec_entry3_U0_ap_idle;
wire    tiled_matvec_entry3_U0_ap_ready;
wire    tiled_matvec_entry3_U0_start_out;
wire    tiled_matvec_entry3_U0_start_write;
wire   [31:0] tiled_matvec_entry3_U0_i2_out_din;
wire    tiled_matvec_entry3_U0_i2_out_write;
wire    tiled_matvec_entry12_U0_ap_start;
wire    tiled_matvec_entry12_U0_ap_done;
wire    tiled_matvec_entry12_U0_ap_continue;
wire    tiled_matvec_entry12_U0_ap_idle;
wire    tiled_matvec_entry12_U0_ap_ready;
wire    tiled_matvec_entry12_U0_i2_read;
wire   [31:0] tiled_matvec_entry12_U0_i2_out_din;
wire    tiled_matvec_entry12_U0_i2_out_write;
wire    Loop_1_proc10_U0_ap_start;
wire    Loop_1_proc10_U0_ap_done;
wire    Loop_1_proc10_U0_ap_continue;
wire    Loop_1_proc10_U0_ap_idle;
wire    Loop_1_proc10_U0_ap_ready;
wire    Loop_1_proc10_U0_Atile_V_vec_0_read;
wire    Loop_1_proc10_U0_Atile_V_vec_1_read;
wire   [31:0] Loop_1_proc10_U0_A_din;
wire    Loop_1_proc10_U0_A_write;
wire    Block_tiled_matvec_U0_ap_start;
wire    Block_tiled_matvec_U0_ap_done;
wire    Block_tiled_matvec_U0_ap_continue;
wire    Block_tiled_matvec_U0_ap_idle;
wire    Block_tiled_matvec_U0_ap_ready;
wire    Block_tiled_matvec_U0_i2_read;
wire    Block_tiled_matvec_U0_xtile_V_vec_0_read;
wire    Block_tiled_matvec_U0_xtile_V_vec_1_read;
wire   [0:0] Block_tiled_matvec_U0_x_address0;
wire    Block_tiled_matvec_U0_x_ce0;
wire    Block_tiled_matvec_U0_x_we0;
wire   [31:0] Block_tiled_matvec_U0_x_d0;
wire   [31:0] Block_tiled_matvec_U0_i2_load_out_out_din;
wire    Block_tiled_matvec_U0_i2_load_out_out_write;
wire    ap_channel_done_x;
wire    Block_tiled_matvec_U0_x_full_n;
wire    Loop_memset_y_proc_U0_ap_start;
wire    Loop_memset_y_proc_U0_ap_done;
wire    Loop_memset_y_proc_U0_ap_continue;
wire    Loop_memset_y_proc_U0_ap_idle;
wire    Loop_memset_y_proc_U0_ap_ready;
wire   [0:0] Loop_memset_y_proc_U0_y_address0;
wire    Loop_memset_y_proc_U0_y_ce0;
wire    Loop_memset_y_proc_U0_y_we0;
wire   [31:0] Loop_memset_y_proc_U0_y_d0;
wire    Loop_memset_y_proc_U0_A_read;
wire   [0:0] Loop_memset_y_proc_U0_x_address0;
wire    Loop_memset_y_proc_U0_x_ce0;
wire    ap_channel_done_y;
wire    Loop_memset_y_proc_U0_y_full_n;
wire    Loop_5_proc_U0_ap_start;
wire    Loop_5_proc_U0_ap_done;
wire    Loop_5_proc_U0_ap_continue;
wire    Loop_5_proc_U0_ap_idle;
wire    Loop_5_proc_U0_ap_ready;
wire   [0:0] Loop_5_proc_U0_y_address0;
wire    Loop_5_proc_U0_y_ce0;
wire    Loop_5_proc_U0_i2_load_loc_read;
wire   [2:0] Loop_5_proc_U0_ypartial_address0;
wire    Loop_5_proc_U0_ypartial_ce0;
wire    Loop_5_proc_U0_ypartial_we0;
wire   [31:0] Loop_5_proc_U0_ypartial_d0;
wire    ap_sync_continue;
wire   [31:0] x_i_q0;
wire   [31:0] x_t_q0;
wire    x_i_full_n;
wire    x_t_empty_n;
wire    y_i_full_n;
wire    y_t_empty_n;
wire    i2_c1_full_n;
wire   [31:0] i2_c1_dout;
wire    i2_c1_empty_n;
wire    i2_c_full_n;
wire   [31:0] i2_c_dout;
wire    i2_c_empty_n;
wire    A_full_n;
wire   [31:0] A_dout;
wire    A_empty_n;
wire    i2_load_loc_c_full_n;
wire   [31:0] i2_load_loc_c_dout;
wire    i2_load_loc_c_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
reg    ap_sync_reg_tiled_matvec_entry3_U0_ap_ready;
wire    ap_sync_tiled_matvec_entry3_U0_ap_ready;
reg   [1:0] tiled_matvec_entry3_U0_ap_ready_count;
reg    ap_sync_reg_Loop_1_proc10_U0_ap_ready;
wire    ap_sync_Loop_1_proc10_U0_ap_ready;
reg   [1:0] Loop_1_proc10_U0_ap_ready_count;
reg    ap_sync_reg_Block_tiled_matvec_U0_ap_ready;
wire    ap_sync_Block_tiled_matvec_U0_ap_ready;
reg   [1:0] Block_tiled_matvec_U0_ap_ready_count;
reg    ap_sync_reg_Loop_5_proc_U0_ap_ready;
wire    ap_sync_Loop_5_proc_U0_ap_ready;
reg   [1:0] Loop_5_proc_U0_ap_ready_count;
wire   [0:0] start_for_tiled_matvec_entry12_U0_din;
wire    start_for_tiled_matvec_entry12_U0_full_n;
wire   [0:0] start_for_tiled_matvec_entry12_U0_dout;
wire    start_for_tiled_matvec_entry12_U0_empty_n;
wire    tiled_matvec_entry12_U0_start_full_n;
wire    tiled_matvec_entry12_U0_start_write;
wire    Loop_1_proc10_U0_start_full_n;
wire    Loop_1_proc10_U0_start_write;
wire    Block_tiled_matvec_U0_start_full_n;
wire    Block_tiled_matvec_U0_start_write;
wire    Loop_memset_y_proc_U0_start_full_n;
wire    Loop_memset_y_proc_U0_start_write;
wire    Loop_5_proc_U0_start_full_n;
wire    Loop_5_proc_U0_start_write;

// power-on initialization
initial begin
#0 ap_sync_reg_tiled_matvec_entry3_U0_ap_ready = 1'b0;
#0 tiled_matvec_entry3_U0_ap_ready_count = 2'd0;
#0 ap_sync_reg_Loop_1_proc10_U0_ap_ready = 1'b0;
#0 Loop_1_proc10_U0_ap_ready_count = 2'd0;
#0 ap_sync_reg_Block_tiled_matvec_U0_ap_ready = 1'b0;
#0 Block_tiled_matvec_U0_ap_ready_count = 2'd0;
#0 ap_sync_reg_Loop_5_proc_U0_ap_ready = 1'b0;
#0 Loop_5_proc_U0_ap_ready_count = 2'd0;
end

tiled_matvec_y #(
    .DataWidth( 32 ),
    .AddressRange( 2 ),
    .AddressWidth( 1 ))
y_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_address0(Loop_memset_y_proc_U0_y_address0),
    .i_ce0(Loop_memset_y_proc_U0_y_ce0),
    .i_we0(Loop_memset_y_proc_U0_y_we0),
    .i_d0(Loop_memset_y_proc_U0_y_d0),
    .i_q0(y_i_q0),
    .t_address0(Loop_5_proc_U0_y_address0),
    .t_ce0(Loop_5_proc_U0_y_ce0),
    .t_we0(1'b0),
    .t_d0(32'd0),
    .t_q0(y_t_q0),
    .i_ce(1'b1),
    .t_ce(1'b1),
    .i_full_n(y_i_full_n),
    .i_write(Loop_memset_y_proc_U0_ap_done),
    .t_empty_n(y_t_empty_n),
    .t_read(Loop_5_proc_U0_ap_ready)
);

tiled_matvec_entry3 tiled_matvec_entry3_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tiled_matvec_entry3_U0_ap_start),
    .start_full_n(start_for_tiled_matvec_entry12_U0_full_n),
    .ap_done(tiled_matvec_entry3_U0_ap_done),
    .ap_continue(tiled_matvec_entry3_U0_ap_continue),
    .ap_idle(tiled_matvec_entry3_U0_ap_idle),
    .ap_ready(tiled_matvec_entry3_U0_ap_ready),
    .start_out(tiled_matvec_entry3_U0_start_out),
    .start_write(tiled_matvec_entry3_U0_start_write),
    .i2(i2),
    .i2_out_din(tiled_matvec_entry3_U0_i2_out_din),
    .i2_out_full_n(i2_c1_full_n),
    .i2_out_write(tiled_matvec_entry3_U0_i2_out_write)
);

tiled_matvec_entry12 tiled_matvec_entry12_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(tiled_matvec_entry12_U0_ap_start),
    .ap_done(tiled_matvec_entry12_U0_ap_done),
    .ap_continue(tiled_matvec_entry12_U0_ap_continue),
    .ap_idle(tiled_matvec_entry12_U0_ap_idle),
    .ap_ready(tiled_matvec_entry12_U0_ap_ready),
    .i2_dout(i2_c1_dout),
    .i2_empty_n(i2_c1_empty_n),
    .i2_read(tiled_matvec_entry12_U0_i2_read),
    .i2_out_din(tiled_matvec_entry12_U0_i2_out_din),
    .i2_out_full_n(i2_c_full_n),
    .i2_out_write(tiled_matvec_entry12_U0_i2_out_write)
);

Loop_1_proc10 Loop_1_proc10_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Loop_1_proc10_U0_ap_start),
    .ap_done(Loop_1_proc10_U0_ap_done),
    .ap_continue(Loop_1_proc10_U0_ap_continue),
    .ap_idle(Loop_1_proc10_U0_ap_idle),
    .ap_ready(Loop_1_proc10_U0_ap_ready),
    .Atile_V_vec_0_dout(Atile_V_vec_0_dout),
    .Atile_V_vec_0_empty_n(Atile_V_vec_0_empty_n),
    .Atile_V_vec_0_read(Loop_1_proc10_U0_Atile_V_vec_0_read),
    .Atile_V_vec_1_dout(Atile_V_vec_1_dout),
    .Atile_V_vec_1_empty_n(Atile_V_vec_1_empty_n),
    .Atile_V_vec_1_read(Loop_1_proc10_U0_Atile_V_vec_1_read),
    .A_din(Loop_1_proc10_U0_A_din),
    .A_full_n(A_full_n),
    .A_write(Loop_1_proc10_U0_A_write)
);

Block_tiled_matvec_s Block_tiled_matvec_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Block_tiled_matvec_U0_ap_start),
    .ap_done(Block_tiled_matvec_U0_ap_done),
    .ap_continue(Block_tiled_matvec_U0_ap_continue),
    .ap_idle(Block_tiled_matvec_U0_ap_idle),
    .ap_ready(Block_tiled_matvec_U0_ap_ready),
    .i2_dout(i2_c_dout),
    .i2_empty_n(i2_c_empty_n),
    .i2_read(Block_tiled_matvec_U0_i2_read),
    .xtile_V_vec_0_dout(xtile_V_vec_0_dout),
    .xtile_V_vec_0_empty_n(xtile_V_vec_0_empty_n),
    .xtile_V_vec_0_read(Block_tiled_matvec_U0_xtile_V_vec_0_read),
    .xtile_V_vec_1_dout(xtile_V_vec_1_dout),
    .xtile_V_vec_1_empty_n(xtile_V_vec_1_empty_n),
    .xtile_V_vec_1_read(Block_tiled_matvec_U0_xtile_V_vec_1_read),
    .x_address0(Block_tiled_matvec_U0_x_address0),
    .x_ce0(Block_tiled_matvec_U0_x_ce0),
    .x_we0(Block_tiled_matvec_U0_x_we0),
    .x_d0(Block_tiled_matvec_U0_x_d0),
    .i2_load_out_out_din(Block_tiled_matvec_U0_i2_load_out_out_din),
    .i2_load_out_out_full_n(i2_load_loc_c_full_n),
    .i2_load_out_out_write(Block_tiled_matvec_U0_i2_load_out_out_write)
);

Loop_memset_y_proc Loop_memset_y_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Loop_memset_y_proc_U0_ap_start),
    .ap_done(Loop_memset_y_proc_U0_ap_done),
    .ap_continue(Loop_memset_y_proc_U0_ap_continue),
    .ap_idle(Loop_memset_y_proc_U0_ap_idle),
    .ap_ready(Loop_memset_y_proc_U0_ap_ready),
    .y_address0(Loop_memset_y_proc_U0_y_address0),
    .y_ce0(Loop_memset_y_proc_U0_y_ce0),
    .y_we0(Loop_memset_y_proc_U0_y_we0),
    .y_d0(Loop_memset_y_proc_U0_y_d0),
    .y_q0(y_i_q0),
    .A_dout(A_dout),
    .A_empty_n(A_empty_n),
    .A_read(Loop_memset_y_proc_U0_A_read),
    .x_address0(Loop_memset_y_proc_U0_x_address0),
    .x_ce0(Loop_memset_y_proc_U0_x_ce0),
    .x_q0(x_t_q0)
);

Loop_5_proc Loop_5_proc_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Loop_5_proc_U0_ap_start),
    .ap_done(Loop_5_proc_U0_ap_done),
    .ap_continue(Loop_5_proc_U0_ap_continue),
    .ap_idle(Loop_5_proc_U0_ap_idle),
    .ap_ready(Loop_5_proc_U0_ap_ready),
    .y_address0(Loop_5_proc_U0_y_address0),
    .y_ce0(Loop_5_proc_U0_y_ce0),
    .y_q0(y_t_q0),
    .i2_load_loc_dout(i2_load_loc_c_dout),
    .i2_load_loc_empty_n(i2_load_loc_c_empty_n),
    .i2_load_loc_read(Loop_5_proc_U0_i2_load_loc_read),
    .ypartial_address0(Loop_5_proc_U0_ypartial_address0),
    .ypartial_ce0(Loop_5_proc_U0_ypartial_ce0),
    .ypartial_we0(Loop_5_proc_U0_ypartial_we0),
    .ypartial_d0(Loop_5_proc_U0_ypartial_d0),
    .ypartial_q0(ypartial_q0)
);

tiled_matvec_x #(
    .DataWidth( 32 ),
    .AddressRange( 2 ),
    .AddressWidth( 1 ))
x_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .i_address0(Block_tiled_matvec_U0_x_address0),
    .i_ce0(Block_tiled_matvec_U0_x_ce0),
    .i_we0(Block_tiled_matvec_U0_x_we0),
    .i_d0(Block_tiled_matvec_U0_x_d0),
    .i_q0(x_i_q0),
    .t_address0(Loop_memset_y_proc_U0_x_address0),
    .t_ce0(Loop_memset_y_proc_U0_x_ce0),
    .t_we0(1'b0),
    .t_d0(32'd0),
    .t_q0(x_t_q0),
    .i_ce(1'b1),
    .t_ce(1'b1),
    .i_full_n(x_i_full_n),
    .i_write(Block_tiled_matvec_U0_ap_done),
    .t_empty_n(x_t_empty_n),
    .t_read(Loop_memset_y_proc_U0_ap_ready)
);

fifo_w32_d2_A i2_c1_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(tiled_matvec_entry3_U0_i2_out_din),
    .if_full_n(i2_c1_full_n),
    .if_write(tiled_matvec_entry3_U0_i2_out_write),
    .if_dout(i2_c1_dout),
    .if_empty_n(i2_c1_empty_n),
    .if_read(tiled_matvec_entry12_U0_i2_read)
);

fifo_w32_d2_A i2_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(tiled_matvec_entry12_U0_i2_out_din),
    .if_full_n(i2_c_full_n),
    .if_write(tiled_matvec_entry12_U0_i2_out_write),
    .if_dout(i2_c_dout),
    .if_empty_n(i2_c_empty_n),
    .if_read(Block_tiled_matvec_U0_i2_read)
);

fifo_w32_d4_A A_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Loop_1_proc10_U0_A_din),
    .if_full_n(A_full_n),
    .if_write(Loop_1_proc10_U0_A_write),
    .if_dout(A_dout),
    .if_empty_n(A_empty_n),
    .if_read(Loop_memset_y_proc_U0_A_read)
);

fifo_w32_d3_A i2_load_loc_c_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Block_tiled_matvec_U0_i2_load_out_out_din),
    .if_full_n(i2_load_loc_c_full_n),
    .if_write(Block_tiled_matvec_U0_i2_load_out_out_write),
    .if_dout(i2_load_loc_c_dout),
    .if_empty_n(i2_load_loc_c_empty_n),
    .if_read(Loop_5_proc_U0_i2_load_loc_read)
);

start_for_tiled_mbkb start_for_tiled_mbkb_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_tiled_matvec_entry12_U0_din),
    .if_full_n(start_for_tiled_matvec_entry12_U0_full_n),
    .if_write(tiled_matvec_entry3_U0_start_write),
    .if_dout(start_for_tiled_matvec_entry12_U0_dout),
    .if_empty_n(start_for_tiled_matvec_entry12_U0_empty_n),
    .if_read(tiled_matvec_entry12_U0_ap_ready)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_Block_tiled_matvec_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Block_tiled_matvec_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Block_tiled_matvec_U0_ap_ready <= ap_sync_Block_tiled_matvec_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_Loop_1_proc10_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Loop_1_proc10_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Loop_1_proc10_U0_ap_ready <= ap_sync_Loop_1_proc10_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_Loop_5_proc_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Loop_5_proc_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Loop_5_proc_U0_ap_ready <= ap_sync_Loop_5_proc_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_sync_reg_tiled_matvec_entry3_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_tiled_matvec_entry3_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_tiled_matvec_entry3_U0_ap_ready <= ap_sync_tiled_matvec_entry3_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == Block_tiled_matvec_U0_ap_ready) & (ap_sync_ready == 1'b1))) begin
        Block_tiled_matvec_U0_ap_ready_count <= (Block_tiled_matvec_U0_ap_ready_count - 2'd1);
    end else if (((ap_sync_ready == 1'b0) & (1'b1 == Block_tiled_matvec_U0_ap_ready))) begin
        Block_tiled_matvec_U0_ap_ready_count <= (Block_tiled_matvec_U0_ap_ready_count + 2'd1);
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == Loop_1_proc10_U0_ap_ready) & (ap_sync_ready == 1'b1))) begin
        Loop_1_proc10_U0_ap_ready_count <= (Loop_1_proc10_U0_ap_ready_count - 2'd1);
    end else if (((ap_sync_ready == 1'b0) & (1'b1 == Loop_1_proc10_U0_ap_ready))) begin
        Loop_1_proc10_U0_ap_ready_count <= (Loop_1_proc10_U0_ap_ready_count + 2'd1);
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == Loop_5_proc_U0_ap_ready) & (ap_sync_ready == 1'b1))) begin
        Loop_5_proc_U0_ap_ready_count <= (Loop_5_proc_U0_ap_ready_count - 2'd1);
    end else if (((ap_sync_ready == 1'b0) & (1'b1 == Loop_5_proc_U0_ap_ready))) begin
        Loop_5_proc_U0_ap_ready_count <= (Loop_5_proc_U0_ap_ready_count + 2'd1);
    end
end

always @ (posedge ap_clk) begin
    if (((tiled_matvec_entry3_U0_ap_ready == 1'b0) & (ap_sync_ready == 1'b1))) begin
        tiled_matvec_entry3_U0_ap_ready_count <= (tiled_matvec_entry3_U0_ap_ready_count - 2'd1);
    end else if (((ap_sync_ready == 1'b0) & (tiled_matvec_entry3_U0_ap_ready == 1'b1))) begin
        tiled_matvec_entry3_U0_ap_ready_count <= (tiled_matvec_entry3_U0_ap_ready_count + 2'd1);
    end
end

assign Atile_V_vec_0_read = Loop_1_proc10_U0_Atile_V_vec_0_read;

assign Atile_V_vec_1_read = Loop_1_proc10_U0_Atile_V_vec_1_read;

assign Block_tiled_matvec_U0_ap_continue = x_i_full_n;

assign Block_tiled_matvec_U0_ap_start = ((ap_sync_reg_Block_tiled_matvec_U0_ap_ready ^ 1'b1) & ap_start);

assign Block_tiled_matvec_U0_start_full_n = 1'b1;

assign Block_tiled_matvec_U0_start_write = 1'b0;

assign Block_tiled_matvec_U0_x_full_n = x_i_full_n;

assign Loop_1_proc10_U0_ap_continue = 1'b1;

assign Loop_1_proc10_U0_ap_start = ((ap_sync_reg_Loop_1_proc10_U0_ap_ready ^ 1'b1) & ap_start);

assign Loop_1_proc10_U0_start_full_n = 1'b1;

assign Loop_1_proc10_U0_start_write = 1'b0;

assign Loop_5_proc_U0_ap_continue = 1'b1;

assign Loop_5_proc_U0_ap_start = (y_t_empty_n & (ap_sync_reg_Loop_5_proc_U0_ap_ready ^ 1'b1) & ap_start);

assign Loop_5_proc_U0_start_full_n = 1'b1;

assign Loop_5_proc_U0_start_write = 1'b0;

assign Loop_memset_y_proc_U0_ap_continue = y_i_full_n;

assign Loop_memset_y_proc_U0_ap_start = x_t_empty_n;

assign Loop_memset_y_proc_U0_start_full_n = 1'b1;

assign Loop_memset_y_proc_U0_start_write = 1'b0;

assign Loop_memset_y_proc_U0_y_full_n = y_i_full_n;

assign ap_channel_done_x = Block_tiled_matvec_U0_ap_done;

assign ap_channel_done_y = Loop_memset_y_proc_U0_ap_done;

assign ap_done = Loop_5_proc_U0_ap_done;

assign ap_idle = (tiled_matvec_entry3_U0_ap_idle & tiled_matvec_entry12_U0_ap_idle & (y_t_empty_n ^ 1'b1) & (x_t_empty_n ^ 1'b1) & Loop_memset_y_proc_U0_ap_idle & Loop_5_proc_U0_ap_idle & Loop_1_proc10_U0_ap_idle & Block_tiled_matvec_U0_ap_idle);

assign ap_ready = ap_sync_ready;

assign ap_sync_Block_tiled_matvec_U0_ap_ready = (ap_sync_reg_Block_tiled_matvec_U0_ap_ready | Block_tiled_matvec_U0_ap_ready);

assign ap_sync_Loop_1_proc10_U0_ap_ready = (ap_sync_reg_Loop_1_proc10_U0_ap_ready | Loop_1_proc10_U0_ap_ready);

assign ap_sync_Loop_5_proc_U0_ap_ready = (ap_sync_reg_Loop_5_proc_U0_ap_ready | Loop_5_proc_U0_ap_ready);

assign ap_sync_continue = 1'b1;

assign ap_sync_done = Loop_5_proc_U0_ap_done;

assign ap_sync_ready = (ap_sync_tiled_matvec_entry3_U0_ap_ready & ap_sync_Loop_5_proc_U0_ap_ready & ap_sync_Loop_1_proc10_U0_ap_ready & ap_sync_Block_tiled_matvec_U0_ap_ready);

assign ap_sync_tiled_matvec_entry3_U0_ap_ready = (tiled_matvec_entry3_U0_ap_ready | ap_sync_reg_tiled_matvec_entry3_U0_ap_ready);

assign start_for_tiled_matvec_entry12_U0_din = 1'b1;

assign tiled_matvec_entry12_U0_ap_continue = 1'b1;

assign tiled_matvec_entry12_U0_ap_start = start_for_tiled_matvec_entry12_U0_empty_n;

assign tiled_matvec_entry12_U0_start_full_n = 1'b1;

assign tiled_matvec_entry12_U0_start_write = 1'b0;

assign tiled_matvec_entry3_U0_ap_continue = 1'b1;

assign tiled_matvec_entry3_U0_ap_start = ((ap_sync_reg_tiled_matvec_entry3_U0_ap_ready ^ 1'b1) & ap_start);

assign xtile_V_vec_0_read = Block_tiled_matvec_U0_xtile_V_vec_0_read;

assign xtile_V_vec_1_read = Block_tiled_matvec_U0_xtile_V_vec_1_read;

assign ypartial_address0 = Loop_5_proc_U0_ypartial_address0;

assign ypartial_address1 = 3'd0;

assign ypartial_ce0 = Loop_5_proc_U0_ypartial_ce0;

assign ypartial_ce1 = 1'b0;

assign ypartial_d0 = Loop_5_proc_U0_ypartial_d0;

assign ypartial_d1 = 32'd0;

assign ypartial_we0 = Loop_5_proc_U0_ypartial_we0;

assign ypartial_we1 = 1'b0;

endmodule //tiled_matvec
