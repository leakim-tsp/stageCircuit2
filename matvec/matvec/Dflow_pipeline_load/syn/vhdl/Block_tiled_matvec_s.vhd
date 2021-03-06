-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Block_tiled_matvec_s is
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
end;


architecture behav of Block_tiled_matvec_s is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal i2_blk_n : STD_LOGIC;
    signal xtile_V_vec_0_blk_n : STD_LOGIC;
    signal icmp_ln17_fu_99_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xtile_V_vec_1_blk_n : STD_LOGIC;
    signal i2_load_out_out_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal i2_read_reg_141 : STD_LOGIC_VECTOR (31 downto 0);
    signal io_acc_block_signal_op10 : STD_LOGIC;
    signal ap_block_state1 : BOOLEAN;
    signal tmp_vec_0_reg_150 : STD_LOGIC_VECTOR (31 downto 0);
    signal tmp_vec_1_reg_155 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_fu_119_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal i3_0_i_i_reg_88 : STD_LOGIC_VECTOR (1 downto 0);
    signal icmp_ln19_fu_113_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln20_fu_136_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln20_fu_125_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((i2_load_out_out_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    i3_0_i_i_reg_88_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln19_fu_113_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                i3_0_i_i_reg_88 <= i_fu_119_p2;
            elsif ((not(((ap_start = ap_const_logic_0) or (i2_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (io_acc_block_signal_op10 = ap_const_logic_0)))) and (icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                i3_0_i_i_reg_88 <= ap_const_lv2_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (i2_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (io_acc_block_signal_op10 = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                i2_read_reg_141 <= i2_dout;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((not(((ap_start = ap_const_logic_0) or (i2_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (io_acc_block_signal_op10 = ap_const_logic_0)))) and (icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                tmp_vec_0_reg_150 <= xtile_V_vec_0_dout;
                tmp_vec_1_reg_155 <= xtile_V_vec_1_dout;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, i2_empty_n, i2_load_out_out_full_n, icmp_ln17_fu_99_p2, ap_CS_fsm_state3, io_acc_block_signal_op10, ap_CS_fsm_state2, icmp_ln19_fu_113_p2)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (i2_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (io_acc_block_signal_op10 = ap_const_logic_0)))) and (icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                elsif ((not(((ap_start = ap_const_logic_0) or (i2_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (io_acc_block_signal_op10 = ap_const_logic_0)))) and (icmp_ln17_fu_99_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((icmp_ln19_fu_113_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when ap_ST_fsm_state3 => 
                if (((i2_load_out_out_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);

    ap_block_state1_assign_proc : process(ap_start, ap_done_reg, i2_empty_n, icmp_ln17_fu_99_p2, io_acc_block_signal_op10)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (i2_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (io_acc_block_signal_op10 = ap_const_logic_0)));
    end process;


    ap_done_assign_proc : process(ap_done_reg, i2_load_out_out_full_n, ap_CS_fsm_state3)
    begin
        if (((i2_load_out_out_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(i2_load_out_out_full_n, ap_CS_fsm_state3)
    begin
        if (((i2_load_out_out_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    i2_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, i2_empty_n)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            i2_blk_n <= i2_empty_n;
        else 
            i2_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    i2_load_out_out_blk_n_assign_proc : process(i2_load_out_out_full_n, ap_CS_fsm_state3)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state3)) then 
            i2_load_out_out_blk_n <= i2_load_out_out_full_n;
        else 
            i2_load_out_out_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    i2_load_out_out_din <= i2_read_reg_141;

    i2_load_out_out_write_assign_proc : process(i2_load_out_out_full_n, ap_CS_fsm_state3)
    begin
        if (((i2_load_out_out_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state3))) then 
            i2_load_out_out_write <= ap_const_logic_1;
        else 
            i2_load_out_out_write <= ap_const_logic_0;
        end if; 
    end process;


    i2_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, i2_empty_n, icmp_ln17_fu_99_p2, io_acc_block_signal_op10)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (i2_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (io_acc_block_signal_op10 = ap_const_logic_0)))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            i2_read <= ap_const_logic_1;
        else 
            i2_read <= ap_const_logic_0;
        end if; 
    end process;

    i_fu_119_p2 <= std_logic_vector(unsigned(i3_0_i_i_reg_88) + unsigned(ap_const_lv2_1));
    icmp_ln17_fu_99_p2 <= "1" when (i2_dout = ap_const_lv32_0) else "0";
    icmp_ln19_fu_113_p2 <= "1" when (i3_0_i_i_reg_88 = ap_const_lv2_2) else "0";
    io_acc_block_signal_op10 <= (xtile_V_vec_1_empty_n and xtile_V_vec_0_empty_n);
    trunc_ln20_fu_125_p1 <= i3_0_i_i_reg_88(1 - 1 downto 0);
    x_address0 <= zext_ln20_fu_136_p1(1 - 1 downto 0);

    x_ce0_assign_proc : process(ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            x_ce0 <= ap_const_logic_1;
        else 
            x_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    x_d0 <= 
        tmp_vec_1_reg_155 when (trunc_ln20_fu_125_p1(0) = '1') else 
        tmp_vec_0_reg_150;

    x_we0_assign_proc : process(ap_CS_fsm_state2, icmp_ln19_fu_113_p2)
    begin
        if (((icmp_ln19_fu_113_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
            x_we0 <= ap_const_logic_1;
        else 
            x_we0 <= ap_const_logic_0;
        end if; 
    end process;


    xtile_V_vec_0_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, xtile_V_vec_0_empty_n, icmp_ln17_fu_99_p2)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            xtile_V_vec_0_blk_n <= xtile_V_vec_0_empty_n;
        else 
            xtile_V_vec_0_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    xtile_V_vec_0_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, i2_empty_n, icmp_ln17_fu_99_p2, io_acc_block_signal_op10)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (i2_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (io_acc_block_signal_op10 = ap_const_logic_0)))) and (icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            xtile_V_vec_0_read <= ap_const_logic_1;
        else 
            xtile_V_vec_0_read <= ap_const_logic_0;
        end if; 
    end process;


    xtile_V_vec_1_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, xtile_V_vec_1_empty_n, icmp_ln17_fu_99_p2)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            xtile_V_vec_1_blk_n <= xtile_V_vec_1_empty_n;
        else 
            xtile_V_vec_1_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    xtile_V_vec_1_read_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_state1, i2_empty_n, icmp_ln17_fu_99_p2, io_acc_block_signal_op10)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (i2_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or ((icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (io_acc_block_signal_op10 = ap_const_logic_0)))) and (icmp_ln17_fu_99_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            xtile_V_vec_1_read <= ap_const_logic_1;
        else 
            xtile_V_vec_1_read <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln20_fu_136_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(i3_0_i_i_reg_88),64));
end behav;
