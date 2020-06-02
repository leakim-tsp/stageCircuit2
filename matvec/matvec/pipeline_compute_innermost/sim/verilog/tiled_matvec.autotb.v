// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
 `timescale 1ns/1ps


`define AUTOTB_DUT      tiled_matvec
`define AUTOTB_DUT_INST AESL_inst_tiled_matvec
`define AUTOTB_TOP      apatb_tiled_matvec_top
`define AUTOTB_LAT_RESULT_FILE "tiled_matvec.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "tiled_matvec.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_tiled_matvec_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 5.00

`define AESL_FIFO_Atile_V_vec_0 AESL_autofifo_Atile_V_vec_0
`define AESL_FIFO_INST_Atile_V_vec_0 AESL_autofifo_inst_Atile_V_vec_0
`define AESL_FIFO_Atile_V_vec_1 AESL_autofifo_Atile_V_vec_1
`define AESL_FIFO_INST_Atile_V_vec_1 AESL_autofifo_inst_Atile_V_vec_1
`define AESL_FIFO_xtile_V_vec_0 AESL_autofifo_xtile_V_vec_0
`define AESL_FIFO_INST_xtile_V_vec_0 AESL_autofifo_inst_xtile_V_vec_0
`define AESL_FIFO_xtile_V_vec_1 AESL_autofifo_xtile_V_vec_1
`define AESL_FIFO_INST_xtile_V_vec_1 AESL_autofifo_inst_xtile_V_vec_1
`define AESL_MEM_ypartial AESL_automem_ypartial
`define AESL_MEM_INST_ypartial mem_inst_ypartial
`define AESL_DEPTH_i1 0
`define AESL_DEPTH_i2 1
`define AUTOTB_TVIN_Atile_V_vec_0  "../tv/cdatafile/c.tiled_matvec.autotvin_Atile_V_vec_0.dat"
`define AUTOTB_TVIN_Atile_V_vec_1  "../tv/cdatafile/c.tiled_matvec.autotvin_Atile_V_vec_1.dat"
`define AUTOTB_TVIN_xtile_V_vec_0  "../tv/cdatafile/c.tiled_matvec.autotvin_xtile_V_vec_0.dat"
`define AUTOTB_TVIN_xtile_V_vec_1  "../tv/cdatafile/c.tiled_matvec.autotvin_xtile_V_vec_1.dat"
`define AUTOTB_TVIN_ypartial  "../tv/cdatafile/c.tiled_matvec.autotvin_ypartial.dat"
`define AUTOTB_TVIN_i2  "../tv/cdatafile/c.tiled_matvec.autotvin_i2.dat"
`define AUTOTB_TVIN_Atile_V_vec_0_out_wrapc  "../tv/rtldatafile/rtl.tiled_matvec.autotvin_Atile_V_vec_0.dat"
`define AUTOTB_TVIN_Atile_V_vec_1_out_wrapc  "../tv/rtldatafile/rtl.tiled_matvec.autotvin_Atile_V_vec_1.dat"
`define AUTOTB_TVIN_xtile_V_vec_0_out_wrapc  "../tv/rtldatafile/rtl.tiled_matvec.autotvin_xtile_V_vec_0.dat"
`define AUTOTB_TVIN_xtile_V_vec_1_out_wrapc  "../tv/rtldatafile/rtl.tiled_matvec.autotvin_xtile_V_vec_1.dat"
`define AUTOTB_TVIN_ypartial_out_wrapc  "../tv/rtldatafile/rtl.tiled_matvec.autotvin_ypartial.dat"
`define AUTOTB_TVIN_i2_out_wrapc  "../tv/rtldatafile/rtl.tiled_matvec.autotvin_i2.dat"
`define AUTOTB_TVOUT_ypartial  "../tv/cdatafile/c.tiled_matvec.autotvout_ypartial.dat"
`define AUTOTB_TVOUT_ypartial_out_wrapc  "../tv/rtldatafile/rtl.tiled_matvec.autotvout_ypartial.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 16;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = 20;
parameter LENGTH_Atile_V_vec_0 = 2;
parameter LENGTH_Atile_V_vec_1 = 2;
parameter LENGTH_xtile_V_vec_0 = 1;
parameter LENGTH_xtile_V_vec_1 = 1;
parameter LENGTH_ypartial = 8;
parameter LENGTH_i2 = 1;

task read_token;
    input integer fp;
    output reg [191 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end
endtask

reg AESL_clock;
reg rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire [31 : 0] Atile_V_vec_0_dout;
wire  Atile_V_vec_0_empty_n;
wire  Atile_V_vec_0_read;
wire [31 : 0] Atile_V_vec_1_dout;
wire  Atile_V_vec_1_empty_n;
wire  Atile_V_vec_1_read;
wire [31 : 0] xtile_V_vec_0_dout;
wire  xtile_V_vec_0_empty_n;
wire  xtile_V_vec_0_read;
wire [31 : 0] xtile_V_vec_1_dout;
wire  xtile_V_vec_1_empty_n;
wire  xtile_V_vec_1_read;
wire [2 : 0] ypartial_address0;
wire  ypartial_ce0;
wire [31 : 0] ypartial_d0;
wire [31 : 0] ypartial_q0;
wire  ypartial_we0;
wire [2 : 0] ypartial_address1;
wire  ypartial_ce1;
wire [31 : 0] ypartial_d1;
wire [31 : 0] ypartial_q1;
wire  ypartial_we1;
wire [31 : 0] i1;
wire [31 : 0] i2;
wire ap_start;
wire ap_done;
wire ap_ready;
wire ap_idle;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;

wire ap_clk;
wire ap_rst;
wire ap_rst_n;

`AUTOTB_DUT `AUTOTB_DUT_INST(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .Atile_V_vec_0_dout(Atile_V_vec_0_dout),
    .Atile_V_vec_0_empty_n(Atile_V_vec_0_empty_n),
    .Atile_V_vec_0_read(Atile_V_vec_0_read),
    .Atile_V_vec_1_dout(Atile_V_vec_1_dout),
    .Atile_V_vec_1_empty_n(Atile_V_vec_1_empty_n),
    .Atile_V_vec_1_read(Atile_V_vec_1_read),
    .xtile_V_vec_0_dout(xtile_V_vec_0_dout),
    .xtile_V_vec_0_empty_n(xtile_V_vec_0_empty_n),
    .xtile_V_vec_0_read(xtile_V_vec_0_read),
    .xtile_V_vec_1_dout(xtile_V_vec_1_dout),
    .xtile_V_vec_1_empty_n(xtile_V_vec_1_empty_n),
    .xtile_V_vec_1_read(xtile_V_vec_1_read),
    .ypartial_address0(ypartial_address0),
    .ypartial_ce0(ypartial_ce0),
    .ypartial_d0(ypartial_d0),
    .ypartial_q0(ypartial_q0),
    .ypartial_we0(ypartial_we0),
    .ypartial_address1(ypartial_address1),
    .ypartial_ce1(ypartial_ce1),
    .ypartial_d1(ypartial_d1),
    .ypartial_q1(ypartial_q1),
    .ypartial_we1(ypartial_we1),
    .i1(i1),
    .i2(i2),
    .ap_start(ap_start),
    .ap_done(ap_done),
    .ap_ready(ap_ready),
    .ap_idle(ap_idle));

// Assignment for control signal
assign ap_clk = AESL_clock;
assign ap_rst = AESL_reset;
assign ap_rst_n = ~AESL_reset;
assign AESL_reset = rst;
assign ap_start = AESL_start;
assign AESL_start = start;
assign AESL_done = ap_done;
assign AESL_ready = ap_ready;
assign AESL_idle = ap_idle;
assign AESL_ce = ce;
assign AESL_continue = tb_continue;
    always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_done !== 1 && AESL_done !== 0) begin
                $display("ERROR: Control signal AESL_done is invalid!");
                $finish;
            end
        end
    end
    always @(posedge AESL_clock) begin
        if (AESL_reset) begin
        end else begin
            if (AESL_ready !== 1 && AESL_ready !== 0) begin
                $display("ERROR: Control signal AESL_ready is invalid!");
                $finish;
            end
        end
    end
// Fifo Instantiation Atile_V_vec_0

wire fifoAtile_V_vec_0_rd;
wire [31 : 0] fifoAtile_V_vec_0_dout;
wire fifoAtile_V_vec_0_empty_n;
wire fifoAtile_V_vec_0_ready;
wire fifoAtile_V_vec_0_done;
reg [31:0] ap_c_n_tvin_trans_num_Atile_V_vec_0;
reg Atile_V_vec_0_ready_reg;

`AESL_FIFO_Atile_V_vec_0 `AESL_FIFO_INST_Atile_V_vec_0 (
    .clk          (AESL_clock),
    .reset        (AESL_reset),
    .if_write     (),
    .if_din       (),
    .if_full_n    (),
    .if_read      (fifoAtile_V_vec_0_rd),
    .if_dout      (fifoAtile_V_vec_0_dout),
    .if_empty_n   (fifoAtile_V_vec_0_empty_n),
    .ready        (fifoAtile_V_vec_0_ready),
    .done         (fifoAtile_V_vec_0_done)
);

// Assignment between dut and fifoAtile_V_vec_0

// Assign input of fifoAtile_V_vec_0
assign      fifoAtile_V_vec_0_rd        =   Atile_V_vec_0_read & Atile_V_vec_0_empty_n;
assign    fifoAtile_V_vec_0_ready   =   Atile_V_vec_0_ready_reg | ready_initial;
assign    fifoAtile_V_vec_0_done    =   0;
// Assign input of dut
assign      Atile_V_vec_0_dout       =   fifoAtile_V_vec_0_dout;
reg   reg_fifoAtile_V_vec_0_empty_n;
initial begin : gen_reg_fifoAtile_V_vec_0_empty_n_process
    integer proc_rand;
    reg_fifoAtile_V_vec_0_empty_n = fifoAtile_V_vec_0_empty_n;
    while (1) begin
        @ (fifoAtile_V_vec_0_empty_n);
        reg_fifoAtile_V_vec_0_empty_n = fifoAtile_V_vec_0_empty_n;
    end
end

assign      Atile_V_vec_0_empty_n    =   reg_fifoAtile_V_vec_0_empty_n;


// Fifo Instantiation Atile_V_vec_1

wire fifoAtile_V_vec_1_rd;
wire [31 : 0] fifoAtile_V_vec_1_dout;
wire fifoAtile_V_vec_1_empty_n;
wire fifoAtile_V_vec_1_ready;
wire fifoAtile_V_vec_1_done;
reg [31:0] ap_c_n_tvin_trans_num_Atile_V_vec_1;
reg Atile_V_vec_1_ready_reg;

`AESL_FIFO_Atile_V_vec_1 `AESL_FIFO_INST_Atile_V_vec_1 (
    .clk          (AESL_clock),
    .reset        (AESL_reset),
    .if_write     (),
    .if_din       (),
    .if_full_n    (),
    .if_read      (fifoAtile_V_vec_1_rd),
    .if_dout      (fifoAtile_V_vec_1_dout),
    .if_empty_n   (fifoAtile_V_vec_1_empty_n),
    .ready        (fifoAtile_V_vec_1_ready),
    .done         (fifoAtile_V_vec_1_done)
);

// Assignment between dut and fifoAtile_V_vec_1

// Assign input of fifoAtile_V_vec_1
assign      fifoAtile_V_vec_1_rd        =   Atile_V_vec_1_read & Atile_V_vec_1_empty_n;
assign    fifoAtile_V_vec_1_ready   =   Atile_V_vec_1_ready_reg | ready_initial;
assign    fifoAtile_V_vec_1_done    =   0;
// Assign input of dut
assign      Atile_V_vec_1_dout       =   fifoAtile_V_vec_1_dout;
reg   reg_fifoAtile_V_vec_1_empty_n;
initial begin : gen_reg_fifoAtile_V_vec_1_empty_n_process
    integer proc_rand;
    reg_fifoAtile_V_vec_1_empty_n = fifoAtile_V_vec_1_empty_n;
    while (1) begin
        @ (fifoAtile_V_vec_1_empty_n);
        reg_fifoAtile_V_vec_1_empty_n = fifoAtile_V_vec_1_empty_n;
    end
end

assign      Atile_V_vec_1_empty_n    =   reg_fifoAtile_V_vec_1_empty_n;


// Fifo Instantiation xtile_V_vec_0

wire fifoxtile_V_vec_0_rd;
wire [31 : 0] fifoxtile_V_vec_0_dout;
wire fifoxtile_V_vec_0_empty_n;
wire fifoxtile_V_vec_0_ready;
wire fifoxtile_V_vec_0_done;
reg [31:0] ap_c_n_tvin_trans_num_xtile_V_vec_0;
reg xtile_V_vec_0_ready_reg;

`AESL_FIFO_xtile_V_vec_0 `AESL_FIFO_INST_xtile_V_vec_0 (
    .clk          (AESL_clock),
    .reset        (AESL_reset),
    .if_write     (),
    .if_din       (),
    .if_full_n    (),
    .if_read      (fifoxtile_V_vec_0_rd),
    .if_dout      (fifoxtile_V_vec_0_dout),
    .if_empty_n   (fifoxtile_V_vec_0_empty_n),
    .ready        (fifoxtile_V_vec_0_ready),
    .done         (fifoxtile_V_vec_0_done)
);

// Assignment between dut and fifoxtile_V_vec_0

// Assign input of fifoxtile_V_vec_0
assign      fifoxtile_V_vec_0_rd        =   xtile_V_vec_0_read & xtile_V_vec_0_empty_n;
assign    fifoxtile_V_vec_0_ready   =   xtile_V_vec_0_ready_reg | ready_initial;
assign    fifoxtile_V_vec_0_done    =   0;
// Assign input of dut
assign      xtile_V_vec_0_dout       =   fifoxtile_V_vec_0_dout;
reg   reg_fifoxtile_V_vec_0_empty_n;
initial begin : gen_reg_fifoxtile_V_vec_0_empty_n_process
    integer proc_rand;
    reg_fifoxtile_V_vec_0_empty_n = fifoxtile_V_vec_0_empty_n;
    while (1) begin
        @ (fifoxtile_V_vec_0_empty_n);
        reg_fifoxtile_V_vec_0_empty_n = fifoxtile_V_vec_0_empty_n;
    end
end

assign      xtile_V_vec_0_empty_n    =   reg_fifoxtile_V_vec_0_empty_n;


// Fifo Instantiation xtile_V_vec_1

wire fifoxtile_V_vec_1_rd;
wire [31 : 0] fifoxtile_V_vec_1_dout;
wire fifoxtile_V_vec_1_empty_n;
wire fifoxtile_V_vec_1_ready;
wire fifoxtile_V_vec_1_done;
reg [31:0] ap_c_n_tvin_trans_num_xtile_V_vec_1;
reg xtile_V_vec_1_ready_reg;

`AESL_FIFO_xtile_V_vec_1 `AESL_FIFO_INST_xtile_V_vec_1 (
    .clk          (AESL_clock),
    .reset        (AESL_reset),
    .if_write     (),
    .if_din       (),
    .if_full_n    (),
    .if_read      (fifoxtile_V_vec_1_rd),
    .if_dout      (fifoxtile_V_vec_1_dout),
    .if_empty_n   (fifoxtile_V_vec_1_empty_n),
    .ready        (fifoxtile_V_vec_1_ready),
    .done         (fifoxtile_V_vec_1_done)
);

// Assignment between dut and fifoxtile_V_vec_1

// Assign input of fifoxtile_V_vec_1
assign      fifoxtile_V_vec_1_rd        =   xtile_V_vec_1_read & xtile_V_vec_1_empty_n;
assign    fifoxtile_V_vec_1_ready   =   xtile_V_vec_1_ready_reg | ready_initial;
assign    fifoxtile_V_vec_1_done    =   0;
// Assign input of dut
assign      xtile_V_vec_1_dout       =   fifoxtile_V_vec_1_dout;
reg   reg_fifoxtile_V_vec_1_empty_n;
initial begin : gen_reg_fifoxtile_V_vec_1_empty_n_process
    integer proc_rand;
    reg_fifoxtile_V_vec_1_empty_n = fifoxtile_V_vec_1_empty_n;
    while (1) begin
        @ (fifoxtile_V_vec_1_empty_n);
        reg_fifoxtile_V_vec_1_empty_n = fifoxtile_V_vec_1_empty_n;
    end
end

assign      xtile_V_vec_1_empty_n    =   reg_fifoxtile_V_vec_1_empty_n;


//------------------------arrayypartial Instantiation--------------

// The input and output of arrayypartial
wire    arrayypartial_ce0, arrayypartial_ce1;
wire    arrayypartial_we0, arrayypartial_we1;
wire    [2 : 0]    arrayypartial_address0, arrayypartial_address1;
wire    [31 : 0]    arrayypartial_din0, arrayypartial_din1;
wire    [31 : 0]    arrayypartial_dout0, arrayypartial_dout1;
wire    arrayypartial_ready;
wire    arrayypartial_done;

`AESL_MEM_ypartial `AESL_MEM_INST_ypartial(
    .clk        (AESL_clock),
    .rst        (AESL_reset),
    .ce0        (arrayypartial_ce0),
    .we0        (arrayypartial_we0),
    .address0   (arrayypartial_address0),
    .din0       (arrayypartial_din0),
    .dout0      (arrayypartial_dout0),
    .ce1        (arrayypartial_ce1),
    .we1        (arrayypartial_we1),
    .address1   (arrayypartial_address1),
    .din1       (arrayypartial_din1),
    .dout1      (arrayypartial_dout1),
    .ready      (arrayypartial_ready),
    .done    (arrayypartial_done)
);

// Assignment between dut and arrayypartial
assign arrayypartial_address0 = ypartial_address0;
assign arrayypartial_ce0 = ypartial_ce0;
assign ypartial_q0 = arrayypartial_dout0;
assign arrayypartial_we0 = ypartial_we0;
assign arrayypartial_din0 = ypartial_d0;
assign arrayypartial_we1 = 0;
assign arrayypartial_din1 = 0;
assign arrayypartial_ready= ready;
assign arrayypartial_done = interface_done;


// The signal of port i1
reg [31: 0] AESL_REG_i1 = 0;
assign i1 = AESL_REG_i1;

// The signal of port i2
reg [31: 0] AESL_REG_i2 = 0;
assign i2 = AESL_REG_i2;
initial begin : read_file_process_i2
    integer fp;
    integer err;
    integer ret;
    integer proc_rand;
    reg [191  : 0] token;
    integer i;
    reg transaction_finish;
    integer transaction_idx;
    transaction_idx = 0;
    wait(AESL_reset === 0);
    fp = $fopen(`AUTOTB_TVIN_i2,"r");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_i2);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    if (token != "[[[runtime]]]") begin
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    read_token(fp, token);
    while (token != "[[[/runtime]]]") begin
        if (token != "[[transaction]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
              $finish;
        end
        read_token(fp, token);  // skip transaction number
          read_token(fp, token);
            # 0.2;
            while(ready_wire !== 1) begin
                @(posedge AESL_clock);
                # 0.2;
            end
        if(token != "[[/transaction]]") begin
            ret = $sscanf(token, "0x%x", AESL_REG_i2);
              if (ret != 1) begin
                  $display("Failed to parse token!");
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
              end
            @(posedge AESL_clock);
              read_token(fp, token);
        end
          read_token(fp, token);
    end
    $fclose(fp);
end


initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 0);
    while(AESL_ready_cnt != AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

    event next_trigger_ready_cnt;
    
    initial begin : gen_ready_cnt
        ready_cnt = 0;
        wait (AESL_reset === 0);
        forever begin
            @ (posedge AESL_clock);
            if (ready == 1) begin
                if (ready_cnt < AUTOTB_TRANSACTION_NUM) begin
                    ready_cnt = ready_cnt + 1;
                end
            end
            -> next_trigger_ready_cnt;
        end
    end
    
    wire all_finish = (done_cnt == AUTOTB_TRANSACTION_NUM);
    
    // done_cnt
    always @ (posedge AESL_clock) begin
        if (AESL_reset) begin
            done_cnt <= 0;
        end else begin
            if (AESL_done == 1) begin
                if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
                    done_cnt <= done_cnt + 1;
                end
            end
        end
    end
    
    initial begin : finish_simulation
        wait (all_finish == 1);
        // last transaction is saved at negedge right after last done
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        $finish;
    end
    
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_Atile_V_vec_0;
reg [31:0] size_Atile_V_vec_0;
reg [31:0] size_Atile_V_vec_0_backup;
reg end_Atile_V_vec_1;
reg [31:0] size_Atile_V_vec_1;
reg [31:0] size_Atile_V_vec_1_backup;
reg end_xtile_V_vec_0;
reg [31:0] size_xtile_V_vec_0;
reg [31:0] size_xtile_V_vec_0_backup;
reg end_xtile_V_vec_1;
reg [31:0] size_xtile_V_vec_1;
reg [31:0] size_xtile_V_vec_1_backup;
reg end_ypartial;
reg [31:0] size_ypartial;
reg [31:0] size_ypartial_backup;
reg end_i2;
reg [31:0] size_i2;
reg [31:0] size_i2_backup;

initial begin : initial_process
    integer proc_rand;
    rst = 1;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    rst = 0;
end
initial begin : start_process
    integer proc_rand;
    reg [31:0] start_cnt;
    ce = 1;
    start = 0;
    start_cnt = 0;
    wait (AESL_reset === 0);
    @ (posedge AESL_clock);
    #0 start = 1;
    start_cnt = start_cnt + 1;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt >= AUTOTB_TRANSACTION_NUM) begin
            // keep pushing garbage in
            #0 start = 1;
        end
        if (AESL_ready) begin
            start_cnt = start_cnt + 1;
        end
    end
end

always @(AESL_done)
begin
    tb_continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt < AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end
initial begin : proc_gen_Atile_V_vec_0_internal_ready
    integer internal_trans_num;
    wait(AESL_reset === 0);
    wait (ready_initial === 1);
    Atile_V_vec_0_ready_reg <= 0;
    @(posedge AESL_clock);
    internal_trans_num = 1;
    while(internal_trans_num != AUTOTB_TRANSACTION_NUM + 1) begin
        if (ap_c_n_tvin_trans_num_Atile_V_vec_0 > internal_trans_num) begin
            Atile_V_vec_0_ready_reg <= 1;
            @(posedge AESL_clock);
            Atile_V_vec_0_ready_reg <= 0;
            internal_trans_num = internal_trans_num + 1;
        end
        else begin
            @(posedge AESL_clock);
        end
    end
    Atile_V_vec_0_ready_reg <= 0;
end
initial begin : proc_gen_Atile_V_vec_1_internal_ready
    integer internal_trans_num;
    wait(AESL_reset === 0);
    wait (ready_initial === 1);
    Atile_V_vec_1_ready_reg <= 0;
    @(posedge AESL_clock);
    internal_trans_num = 1;
    while(internal_trans_num != AUTOTB_TRANSACTION_NUM + 1) begin
        if (ap_c_n_tvin_trans_num_Atile_V_vec_1 > internal_trans_num) begin
            Atile_V_vec_1_ready_reg <= 1;
            @(posedge AESL_clock);
            Atile_V_vec_1_ready_reg <= 0;
            internal_trans_num = internal_trans_num + 1;
        end
        else begin
            @(posedge AESL_clock);
        end
    end
    Atile_V_vec_1_ready_reg <= 0;
end
initial begin : proc_gen_xtile_V_vec_0_internal_ready
    integer internal_trans_num;
    wait(AESL_reset === 0);
    wait (ready_initial === 1);
    xtile_V_vec_0_ready_reg <= 0;
    @(posedge AESL_clock);
    internal_trans_num = 1;
    while(internal_trans_num != AUTOTB_TRANSACTION_NUM + 1) begin
        if (ap_c_n_tvin_trans_num_xtile_V_vec_0 > internal_trans_num) begin
            xtile_V_vec_0_ready_reg <= 1;
            @(posedge AESL_clock);
            xtile_V_vec_0_ready_reg <= 0;
            internal_trans_num = internal_trans_num + 1;
        end
        else begin
            @(posedge AESL_clock);
        end
    end
    xtile_V_vec_0_ready_reg <= 0;
end
initial begin : proc_gen_xtile_V_vec_1_internal_ready
    integer internal_trans_num;
    wait(AESL_reset === 0);
    wait (ready_initial === 1);
    xtile_V_vec_1_ready_reg <= 0;
    @(posedge AESL_clock);
    internal_trans_num = 1;
    while(internal_trans_num != AUTOTB_TRANSACTION_NUM + 1) begin
        if (ap_c_n_tvin_trans_num_xtile_V_vec_1 > internal_trans_num) begin
            xtile_V_vec_1_ready_reg <= 1;
            @(posedge AESL_clock);
            xtile_V_vec_1_ready_reg <= 0;
            internal_trans_num = internal_trans_num + 1;
        end
        else begin
            @(posedge AESL_clock);
        end
    end
    xtile_V_vec_1_ready_reg <= 0;
end
    
    `define STREAM_SIZE_IN_Atile_V_vec_0 "../tv/stream_size/stream_size_in_Atile_V_vec_0.dat"
    
    initial begin : gen_ap_c_n_tvin_trans_num_Atile_V_vec_0
        integer fp_Atile_V_vec_0;
        reg [127:0] token_Atile_V_vec_0;
        integer ret;
        
        ap_c_n_tvin_trans_num_Atile_V_vec_0 = 0;
        end_Atile_V_vec_0 = 0;
        wait (AESL_reset === 0);
        
        fp_Atile_V_vec_0 = $fopen(`STREAM_SIZE_IN_Atile_V_vec_0, "r");
        if(fp_Atile_V_vec_0 == 0) begin
            $display("Failed to open file \"%s\"!", `STREAM_SIZE_IN_Atile_V_vec_0);
            $finish;
        end
        read_token(fp_Atile_V_vec_0, token_Atile_V_vec_0); // should be [[[runtime]]]
        if (token_Atile_V_vec_0 != "[[[runtime]]]") begin
            $display("ERROR: token_Atile_V_vec_0 != \"[[[runtime]]]\"");
            $finish;
        end
        size_Atile_V_vec_0 = 0;
        size_Atile_V_vec_0_backup = 0;
        while (size_Atile_V_vec_0 == 0 && end_Atile_V_vec_0 == 0) begin
            ap_c_n_tvin_trans_num_Atile_V_vec_0 = ap_c_n_tvin_trans_num_Atile_V_vec_0 + 1;
            read_token(fp_Atile_V_vec_0, token_Atile_V_vec_0); // should be [[transaction]] or [[[/runtime]]]
            if (token_Atile_V_vec_0 == "[[transaction]]") begin
                read_token(fp_Atile_V_vec_0, token_Atile_V_vec_0); // should be transaction number
                read_token(fp_Atile_V_vec_0, token_Atile_V_vec_0); // should be size for hls::stream
                ret = $sscanf(token_Atile_V_vec_0, "%d", size_Atile_V_vec_0);
                if (size_Atile_V_vec_0 > 0) begin
                    size_Atile_V_vec_0_backup = size_Atile_V_vec_0;
                end
                read_token(fp_Atile_V_vec_0, token_Atile_V_vec_0); // should be [[/transaction]]
            end else if (token_Atile_V_vec_0 == "[[[/runtime]]]") begin
                $fclose(fp_Atile_V_vec_0);
                end_Atile_V_vec_0 = 1;
            end else begin
                $display("ERROR: unknown token_Atile_V_vec_0");
                $finish;
            end
        end
        forever begin
            @ (posedge AESL_clock);
            if (end_Atile_V_vec_0 == 0) begin
                if (Atile_V_vec_0_read == 1) begin
                    if (size_Atile_V_vec_0 > 0) begin
                        size_Atile_V_vec_0 = size_Atile_V_vec_0 - 1;
                        while (size_Atile_V_vec_0 == 0 && end_Atile_V_vec_0 == 0) begin
                            ap_c_n_tvin_trans_num_Atile_V_vec_0 = ap_c_n_tvin_trans_num_Atile_V_vec_0 + 1;
                            read_token(fp_Atile_V_vec_0, token_Atile_V_vec_0); // should be [[transaction]] or [[[/runtime]]]
                            if (token_Atile_V_vec_0 == "[[transaction]]") begin
                                read_token(fp_Atile_V_vec_0, token_Atile_V_vec_0); // should be transaction number
                                read_token(fp_Atile_V_vec_0, token_Atile_V_vec_0); // should be size for hls::stream
                                ret = $sscanf(token_Atile_V_vec_0, "%d", size_Atile_V_vec_0);
                                if (size_Atile_V_vec_0 > 0) begin
                                    size_Atile_V_vec_0_backup = size_Atile_V_vec_0;
                                end
                                read_token(fp_Atile_V_vec_0, token_Atile_V_vec_0); // should be [[/transaction]]
                            end else if (token_Atile_V_vec_0 == "[[[/runtime]]]") begin
                                size_Atile_V_vec_0 = size_Atile_V_vec_0_backup;
                                $fclose(fp_Atile_V_vec_0);
                                end_Atile_V_vec_0 = 1;
                            end else begin
                                $display("ERROR: unknown token_Atile_V_vec_0");
                                $finish;
                            end
                        end
                    end
                end
            end else begin
                if (Atile_V_vec_0_read == 1) begin
                    if (size_Atile_V_vec_0 > 0) begin
                        size_Atile_V_vec_0 = size_Atile_V_vec_0 - 1;
                        if (size_Atile_V_vec_0 == 0) begin
                            ap_c_n_tvin_trans_num_Atile_V_vec_0 = ap_c_n_tvin_trans_num_Atile_V_vec_0 + 1;
                            size_Atile_V_vec_0 = size_Atile_V_vec_0_backup;
                        end
                    end
                end
            end
        end
    end
    
    
    `define STREAM_SIZE_IN_Atile_V_vec_1 "../tv/stream_size/stream_size_in_Atile_V_vec_1.dat"
    
    initial begin : gen_ap_c_n_tvin_trans_num_Atile_V_vec_1
        integer fp_Atile_V_vec_1;
        reg [127:0] token_Atile_V_vec_1;
        integer ret;
        
        ap_c_n_tvin_trans_num_Atile_V_vec_1 = 0;
        end_Atile_V_vec_1 = 0;
        wait (AESL_reset === 0);
        
        fp_Atile_V_vec_1 = $fopen(`STREAM_SIZE_IN_Atile_V_vec_1, "r");
        if(fp_Atile_V_vec_1 == 0) begin
            $display("Failed to open file \"%s\"!", `STREAM_SIZE_IN_Atile_V_vec_1);
            $finish;
        end
        read_token(fp_Atile_V_vec_1, token_Atile_V_vec_1); // should be [[[runtime]]]
        if (token_Atile_V_vec_1 != "[[[runtime]]]") begin
            $display("ERROR: token_Atile_V_vec_1 != \"[[[runtime]]]\"");
            $finish;
        end
        size_Atile_V_vec_1 = 0;
        size_Atile_V_vec_1_backup = 0;
        while (size_Atile_V_vec_1 == 0 && end_Atile_V_vec_1 == 0) begin
            ap_c_n_tvin_trans_num_Atile_V_vec_1 = ap_c_n_tvin_trans_num_Atile_V_vec_1 + 1;
            read_token(fp_Atile_V_vec_1, token_Atile_V_vec_1); // should be [[transaction]] or [[[/runtime]]]
            if (token_Atile_V_vec_1 == "[[transaction]]") begin
                read_token(fp_Atile_V_vec_1, token_Atile_V_vec_1); // should be transaction number
                read_token(fp_Atile_V_vec_1, token_Atile_V_vec_1); // should be size for hls::stream
                ret = $sscanf(token_Atile_V_vec_1, "%d", size_Atile_V_vec_1);
                if (size_Atile_V_vec_1 > 0) begin
                    size_Atile_V_vec_1_backup = size_Atile_V_vec_1;
                end
                read_token(fp_Atile_V_vec_1, token_Atile_V_vec_1); // should be [[/transaction]]
            end else if (token_Atile_V_vec_1 == "[[[/runtime]]]") begin
                $fclose(fp_Atile_V_vec_1);
                end_Atile_V_vec_1 = 1;
            end else begin
                $display("ERROR: unknown token_Atile_V_vec_1");
                $finish;
            end
        end
        forever begin
            @ (posedge AESL_clock);
            if (end_Atile_V_vec_1 == 0) begin
                if (Atile_V_vec_1_read == 1) begin
                    if (size_Atile_V_vec_1 > 0) begin
                        size_Atile_V_vec_1 = size_Atile_V_vec_1 - 1;
                        while (size_Atile_V_vec_1 == 0 && end_Atile_V_vec_1 == 0) begin
                            ap_c_n_tvin_trans_num_Atile_V_vec_1 = ap_c_n_tvin_trans_num_Atile_V_vec_1 + 1;
                            read_token(fp_Atile_V_vec_1, token_Atile_V_vec_1); // should be [[transaction]] or [[[/runtime]]]
                            if (token_Atile_V_vec_1 == "[[transaction]]") begin
                                read_token(fp_Atile_V_vec_1, token_Atile_V_vec_1); // should be transaction number
                                read_token(fp_Atile_V_vec_1, token_Atile_V_vec_1); // should be size for hls::stream
                                ret = $sscanf(token_Atile_V_vec_1, "%d", size_Atile_V_vec_1);
                                if (size_Atile_V_vec_1 > 0) begin
                                    size_Atile_V_vec_1_backup = size_Atile_V_vec_1;
                                end
                                read_token(fp_Atile_V_vec_1, token_Atile_V_vec_1); // should be [[/transaction]]
                            end else if (token_Atile_V_vec_1 == "[[[/runtime]]]") begin
                                size_Atile_V_vec_1 = size_Atile_V_vec_1_backup;
                                $fclose(fp_Atile_V_vec_1);
                                end_Atile_V_vec_1 = 1;
                            end else begin
                                $display("ERROR: unknown token_Atile_V_vec_1");
                                $finish;
                            end
                        end
                    end
                end
            end else begin
                if (Atile_V_vec_1_read == 1) begin
                    if (size_Atile_V_vec_1 > 0) begin
                        size_Atile_V_vec_1 = size_Atile_V_vec_1 - 1;
                        if (size_Atile_V_vec_1 == 0) begin
                            ap_c_n_tvin_trans_num_Atile_V_vec_1 = ap_c_n_tvin_trans_num_Atile_V_vec_1 + 1;
                            size_Atile_V_vec_1 = size_Atile_V_vec_1_backup;
                        end
                    end
                end
            end
        end
    end
    
    
    `define STREAM_SIZE_IN_xtile_V_vec_0 "../tv/stream_size/stream_size_in_xtile_V_vec_0.dat"
    
    initial begin : gen_ap_c_n_tvin_trans_num_xtile_V_vec_0
        integer fp_xtile_V_vec_0;
        reg [127:0] token_xtile_V_vec_0;
        integer ret;
        
        ap_c_n_tvin_trans_num_xtile_V_vec_0 = 0;
        end_xtile_V_vec_0 = 0;
        wait (AESL_reset === 0);
        
        fp_xtile_V_vec_0 = $fopen(`STREAM_SIZE_IN_xtile_V_vec_0, "r");
        if(fp_xtile_V_vec_0 == 0) begin
            $display("Failed to open file \"%s\"!", `STREAM_SIZE_IN_xtile_V_vec_0);
            $finish;
        end
        read_token(fp_xtile_V_vec_0, token_xtile_V_vec_0); // should be [[[runtime]]]
        if (token_xtile_V_vec_0 != "[[[runtime]]]") begin
            $display("ERROR: token_xtile_V_vec_0 != \"[[[runtime]]]\"");
            $finish;
        end
        size_xtile_V_vec_0 = 0;
        size_xtile_V_vec_0_backup = 0;
        while (size_xtile_V_vec_0 == 0 && end_xtile_V_vec_0 == 0) begin
            ap_c_n_tvin_trans_num_xtile_V_vec_0 = ap_c_n_tvin_trans_num_xtile_V_vec_0 + 1;
            read_token(fp_xtile_V_vec_0, token_xtile_V_vec_0); // should be [[transaction]] or [[[/runtime]]]
            if (token_xtile_V_vec_0 == "[[transaction]]") begin
                read_token(fp_xtile_V_vec_0, token_xtile_V_vec_0); // should be transaction number
                read_token(fp_xtile_V_vec_0, token_xtile_V_vec_0); // should be size for hls::stream
                ret = $sscanf(token_xtile_V_vec_0, "%d", size_xtile_V_vec_0);
                if (size_xtile_V_vec_0 > 0) begin
                    size_xtile_V_vec_0_backup = size_xtile_V_vec_0;
                end
                read_token(fp_xtile_V_vec_0, token_xtile_V_vec_0); // should be [[/transaction]]
            end else if (token_xtile_V_vec_0 == "[[[/runtime]]]") begin
                $fclose(fp_xtile_V_vec_0);
                end_xtile_V_vec_0 = 1;
            end else begin
                $display("ERROR: unknown token_xtile_V_vec_0");
                $finish;
            end
        end
        forever begin
            @ (posedge AESL_clock);
            if (end_xtile_V_vec_0 == 0) begin
                if (xtile_V_vec_0_read == 1) begin
                    if (size_xtile_V_vec_0 > 0) begin
                        size_xtile_V_vec_0 = size_xtile_V_vec_0 - 1;
                        while (size_xtile_V_vec_0 == 0 && end_xtile_V_vec_0 == 0) begin
                            ap_c_n_tvin_trans_num_xtile_V_vec_0 = ap_c_n_tvin_trans_num_xtile_V_vec_0 + 1;
                            read_token(fp_xtile_V_vec_0, token_xtile_V_vec_0); // should be [[transaction]] or [[[/runtime]]]
                            if (token_xtile_V_vec_0 == "[[transaction]]") begin
                                read_token(fp_xtile_V_vec_0, token_xtile_V_vec_0); // should be transaction number
                                read_token(fp_xtile_V_vec_0, token_xtile_V_vec_0); // should be size for hls::stream
                                ret = $sscanf(token_xtile_V_vec_0, "%d", size_xtile_V_vec_0);
                                if (size_xtile_V_vec_0 > 0) begin
                                    size_xtile_V_vec_0_backup = size_xtile_V_vec_0;
                                end
                                read_token(fp_xtile_V_vec_0, token_xtile_V_vec_0); // should be [[/transaction]]
                            end else if (token_xtile_V_vec_0 == "[[[/runtime]]]") begin
                                size_xtile_V_vec_0 = size_xtile_V_vec_0_backup;
                                $fclose(fp_xtile_V_vec_0);
                                end_xtile_V_vec_0 = 1;
                            end else begin
                                $display("ERROR: unknown token_xtile_V_vec_0");
                                $finish;
                            end
                        end
                    end
                end
            end else begin
                if (xtile_V_vec_0_read == 1) begin
                    if (size_xtile_V_vec_0 > 0) begin
                        size_xtile_V_vec_0 = size_xtile_V_vec_0 - 1;
                        if (size_xtile_V_vec_0 == 0) begin
                            ap_c_n_tvin_trans_num_xtile_V_vec_0 = ap_c_n_tvin_trans_num_xtile_V_vec_0 + 1;
                            size_xtile_V_vec_0 = size_xtile_V_vec_0_backup;
                        end
                    end
                end
            end
        end
    end
    
    
    `define STREAM_SIZE_IN_xtile_V_vec_1 "../tv/stream_size/stream_size_in_xtile_V_vec_1.dat"
    
    initial begin : gen_ap_c_n_tvin_trans_num_xtile_V_vec_1
        integer fp_xtile_V_vec_1;
        reg [127:0] token_xtile_V_vec_1;
        integer ret;
        
        ap_c_n_tvin_trans_num_xtile_V_vec_1 = 0;
        end_xtile_V_vec_1 = 0;
        wait (AESL_reset === 0);
        
        fp_xtile_V_vec_1 = $fopen(`STREAM_SIZE_IN_xtile_V_vec_1, "r");
        if(fp_xtile_V_vec_1 == 0) begin
            $display("Failed to open file \"%s\"!", `STREAM_SIZE_IN_xtile_V_vec_1);
            $finish;
        end
        read_token(fp_xtile_V_vec_1, token_xtile_V_vec_1); // should be [[[runtime]]]
        if (token_xtile_V_vec_1 != "[[[runtime]]]") begin
            $display("ERROR: token_xtile_V_vec_1 != \"[[[runtime]]]\"");
            $finish;
        end
        size_xtile_V_vec_1 = 0;
        size_xtile_V_vec_1_backup = 0;
        while (size_xtile_V_vec_1 == 0 && end_xtile_V_vec_1 == 0) begin
            ap_c_n_tvin_trans_num_xtile_V_vec_1 = ap_c_n_tvin_trans_num_xtile_V_vec_1 + 1;
            read_token(fp_xtile_V_vec_1, token_xtile_V_vec_1); // should be [[transaction]] or [[[/runtime]]]
            if (token_xtile_V_vec_1 == "[[transaction]]") begin
                read_token(fp_xtile_V_vec_1, token_xtile_V_vec_1); // should be transaction number
                read_token(fp_xtile_V_vec_1, token_xtile_V_vec_1); // should be size for hls::stream
                ret = $sscanf(token_xtile_V_vec_1, "%d", size_xtile_V_vec_1);
                if (size_xtile_V_vec_1 > 0) begin
                    size_xtile_V_vec_1_backup = size_xtile_V_vec_1;
                end
                read_token(fp_xtile_V_vec_1, token_xtile_V_vec_1); // should be [[/transaction]]
            end else if (token_xtile_V_vec_1 == "[[[/runtime]]]") begin
                $fclose(fp_xtile_V_vec_1);
                end_xtile_V_vec_1 = 1;
            end else begin
                $display("ERROR: unknown token_xtile_V_vec_1");
                $finish;
            end
        end
        forever begin
            @ (posedge AESL_clock);
            if (end_xtile_V_vec_1 == 0) begin
                if (xtile_V_vec_1_read == 1) begin
                    if (size_xtile_V_vec_1 > 0) begin
                        size_xtile_V_vec_1 = size_xtile_V_vec_1 - 1;
                        while (size_xtile_V_vec_1 == 0 && end_xtile_V_vec_1 == 0) begin
                            ap_c_n_tvin_trans_num_xtile_V_vec_1 = ap_c_n_tvin_trans_num_xtile_V_vec_1 + 1;
                            read_token(fp_xtile_V_vec_1, token_xtile_V_vec_1); // should be [[transaction]] or [[[/runtime]]]
                            if (token_xtile_V_vec_1 == "[[transaction]]") begin
                                read_token(fp_xtile_V_vec_1, token_xtile_V_vec_1); // should be transaction number
                                read_token(fp_xtile_V_vec_1, token_xtile_V_vec_1); // should be size for hls::stream
                                ret = $sscanf(token_xtile_V_vec_1, "%d", size_xtile_V_vec_1);
                                if (size_xtile_V_vec_1 > 0) begin
                                    size_xtile_V_vec_1_backup = size_xtile_V_vec_1;
                                end
                                read_token(fp_xtile_V_vec_1, token_xtile_V_vec_1); // should be [[/transaction]]
                            end else if (token_xtile_V_vec_1 == "[[[/runtime]]]") begin
                                size_xtile_V_vec_1 = size_xtile_V_vec_1_backup;
                                $fclose(fp_xtile_V_vec_1);
                                end_xtile_V_vec_1 = 1;
                            end else begin
                                $display("ERROR: unknown token_xtile_V_vec_1");
                                $finish;
                            end
                        end
                    end
                end
            end else begin
                if (xtile_V_vec_1_read == 1) begin
                    if (size_xtile_V_vec_1 > 0) begin
                        size_xtile_V_vec_1 = size_xtile_V_vec_1 - 1;
                        if (size_xtile_V_vec_1 == 0) begin
                            ap_c_n_tvin_trans_num_xtile_V_vec_1 = ap_c_n_tvin_trans_num_xtile_V_vec_1 + 1;
                            size_xtile_V_vec_1 = size_xtile_V_vec_1_backup;
                        end
                    end
                end
            end
        end
    end
    

reg dump_tvout_finish_ypartial;

initial begin : dump_tvout_runtime_sign_ypartial
    integer fp;
    dump_tvout_finish_ypartial = 0;
    fp = $fopen(`AUTOTB_TVOUT_ypartial_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_ypartial_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_ypartial_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_ypartial_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_ypartial = 1;
end


////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    clk_cnt <= clk_cnt + 1;
    AESL_ready_p1 <= AESL_ready;
    AESL_start_p1 <= AESL_start;
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
event report_progress;

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 0);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 0);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = start_timestamp[i + 1] - start_timestamp[i];
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

`endif

AESL_deadlock_detector deadlock_detector(
    .reset(~AESL_reset),
    .clock(AESL_clock));


endmodule
