-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Loop_memset_y_proc is
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
end;


architecture behav of Loop_memset_y_proc is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state7 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv3_4 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";

    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal A_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal icmp_ln26_reg_226 : STD_LOGIC_VECTOR (0 downto 0);
    signal indvar_flatten_reg_113 : STD_LOGIC_VECTOR (2 downto 0);
    signal i4_0_i_reg_124 : STD_LOGIC_VECTOR (1 downto 0);
    signal j5_0_i_reg_135 : STD_LOGIC_VECTOR (1 downto 0);
    signal xor_ln25_fu_151_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal icmp_ln26_fu_157_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_block_state3_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln26_reg_226_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln26_fu_163_p2 : STD_LOGIC_VECTOR (2 downto 0);
    signal add_ln26_reg_230 : STD_LOGIC_VECTOR (2 downto 0);
    signal select_ln28_fu_175_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln28_reg_235 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln28_1_fu_189_p3 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln28_1_reg_240 : STD_LOGIC_VECTOR (1 downto 0);
    signal A_read_reg_251 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_state4_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_state6_pp0_stage1_iter1 : BOOLEAN;
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal x_load_reg_256 : STD_LOGIC_VECTOR (31 downto 0);
    signal j_fu_202_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal j_reg_261 : STD_LOGIC_VECTOR (1 downto 0);
    signal mul_ln28_fu_211_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal mul_ln28_reg_266 : STD_LOGIC_VECTOR (31 downto 0);
    signal y_addr_1_reg_271 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_phi_mux_phi_ln25_i_phi_fu_105_p4 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_condition_pp0_exit_iter0_state3 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal phi_ln25_i_reg_101 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state1 : BOOLEAN;
    signal ap_phi_mux_indvar_flatten_phi_fu_117_p4 : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal ap_phi_mux_i4_0_i_phi_fu_128_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_phi_mux_j5_0_i_phi_fu_139_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal zext_ln25_fu_146_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln28_1_fu_197_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal zext_ln28_fu_207_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln28_fu_215_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal icmp_ln27_fu_169_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln26_1_fu_183_p2 : STD_LOGIC_VECTOR (1 downto 0);
    signal ap_CS_fsm_state7 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;


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
                elsif ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_const_logic_1 = ap_condition_pp0_exit_iter0_state3) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_phi_mux_phi_ln25_i_phi_fu_105_p4 = ap_const_lv1_1))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_phi_mux_phi_ln25_i_phi_fu_105_p4 = ap_const_lv1_1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    i4_0_i_reg_124_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_phi_mux_phi_ln25_i_phi_fu_105_p4 = ap_const_lv1_1))) then 
                i4_0_i_reg_124 <= ap_const_lv2_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                i4_0_i_reg_124 <= select_ln28_1_reg_240;
            end if; 
        end if;
    end process;

    indvar_flatten_reg_113_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_phi_mux_phi_ln25_i_phi_fu_105_p4 = ap_const_lv1_1))) then 
                indvar_flatten_reg_113 <= ap_const_lv3_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                indvar_flatten_reg_113 <= add_ln26_reg_230;
            end if; 
        end if;
    end process;

    j5_0_i_reg_135_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_phi_mux_phi_ln25_i_phi_fu_105_p4 = ap_const_lv1_1))) then 
                j5_0_i_reg_135 <= ap_const_lv2_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                j5_0_i_reg_135 <= j_reg_261;
            end if; 
        end if;
    end process;

    phi_ln25_i_reg_101_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_phi_mux_phi_ln25_i_phi_fu_105_p4 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state2))) then 
                phi_ln25_i_reg_101 <= xor_ln25_fu_151_p2;
            elsif ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                phi_ln25_i_reg_101 <= ap_const_lv1_0;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001))) then
                A_read_reg_251 <= A_dout;
                x_load_reg_256 <= x_q0;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then
                add_ln26_reg_230 <= add_ln26_fu_163_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                icmp_ln26_reg_226 <= icmp_ln26_fu_157_p2;
                icmp_ln26_reg_226_pp0_iter1_reg <= icmp_ln26_reg_226;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001))) then
                j_reg_261 <= j_fu_202_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                mul_ln28_reg_266 <= mul_ln28_fu_211_p2;
                y_addr_1_reg_271 <= zext_ln28_fu_207_p1(1 - 1 downto 0);
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_fu_157_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then
                select_ln28_1_reg_240 <= select_ln28_1_fu_189_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (icmp_ln26_fu_157_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                select_ln28_reg_235 <= select_ln28_fu_175_p3;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0, ap_CS_fsm_state2, icmp_ln26_fu_157_p2, ap_phi_mux_phi_ln25_i_phi_fu_105_p4, ap_block_pp0_stage0_subdone, ap_enable_reg_pp0_iter1, ap_block_pp0_stage1_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (ap_phi_mux_phi_ln25_i_phi_fu_105_p4 = ap_const_lv1_1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((icmp_ln26_fu_157_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                elsif (((icmp_ln26_fu_157_p2 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((not(((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone))) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_state7;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when ap_ST_fsm_state7 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;

    A_blk_n_assign_proc : process(A_empty_n, ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0, ap_block_pp0_stage1, icmp_ln26_reg_226)
    begin
        if (((icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            A_blk_n <= A_empty_n;
        else 
            A_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    A_read_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_enable_reg_pp0_iter0, icmp_ln26_reg_226, ap_block_pp0_stage1_11001)
    begin
        if (((icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001))) then 
            A_read <= ap_const_logic_1;
        else 
            A_read <= ap_const_logic_0;
        end if; 
    end process;

    add_ln26_1_fu_183_p2 <= std_logic_vector(unsigned(ap_phi_mux_i4_0_i_phi_fu_128_p4) + unsigned(ap_const_lv2_1));
    add_ln26_fu_163_p2 <= std_logic_vector(unsigned(ap_phi_mux_indvar_flatten_phi_fu_117_p4) + unsigned(ap_const_lv3_1));
    add_ln28_fu_215_p2 <= std_logic_vector(unsigned(y_q0) + unsigned(mul_ln28_reg_266));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(2);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(3);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state7 <= ap_CS_fsm(4);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage1_11001_assign_proc : process(A_empty_n, ap_enable_reg_pp0_iter0, icmp_ln26_reg_226)
    begin
                ap_block_pp0_stage1_11001 <= ((icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_const_logic_0 = A_empty_n) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1));
    end process;


    ap_block_pp0_stage1_subdone_assign_proc : process(A_empty_n, ap_enable_reg_pp0_iter0, icmp_ln26_reg_226)
    begin
                ap_block_pp0_stage1_subdone <= ((icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_const_logic_0 = A_empty_n) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1));
    end process;


    ap_block_state1_assign_proc : process(ap_start, ap_done_reg)
    begin
                ap_block_state1 <= ((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;

        ap_block_state3_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage1_iter0_assign_proc : process(A_empty_n, icmp_ln26_reg_226)
    begin
                ap_block_state4_pp0_stage1_iter0 <= ((icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_const_logic_0 = A_empty_n));
    end process;

        ap_block_state5_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage1_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_pp0_exit_iter0_state3_assign_proc : process(icmp_ln26_fu_157_p2)
    begin
        if ((icmp_ln26_fu_157_p2 = ap_const_lv1_1)) then 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_1;
        else 
            ap_condition_pp0_exit_iter0_state3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_phi_mux_i4_0_i_phi_fu_128_p4_assign_proc : process(icmp_ln26_reg_226, i4_0_i_reg_124, ap_CS_fsm_pp0_stage0, select_ln28_1_reg_240, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_phi_mux_i4_0_i_phi_fu_128_p4 <= select_ln28_1_reg_240;
        else 
            ap_phi_mux_i4_0_i_phi_fu_128_p4 <= i4_0_i_reg_124;
        end if; 
    end process;


    ap_phi_mux_indvar_flatten_phi_fu_117_p4_assign_proc : process(icmp_ln26_reg_226, indvar_flatten_reg_113, ap_CS_fsm_pp0_stage0, add_ln26_reg_230, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_phi_mux_indvar_flatten_phi_fu_117_p4 <= add_ln26_reg_230;
        else 
            ap_phi_mux_indvar_flatten_phi_fu_117_p4 <= indvar_flatten_reg_113;
        end if; 
    end process;


    ap_phi_mux_j5_0_i_phi_fu_139_p4_assign_proc : process(icmp_ln26_reg_226, j5_0_i_reg_135, ap_CS_fsm_pp0_stage0, j_reg_261, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0)
    begin
        if (((icmp_ln26_reg_226 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            ap_phi_mux_j5_0_i_phi_fu_139_p4 <= j_reg_261;
        else 
            ap_phi_mux_j5_0_i_phi_fu_139_p4 <= j5_0_i_reg_135;
        end if; 
    end process;

    ap_phi_mux_phi_ln25_i_phi_fu_105_p4 <= phi_ln25_i_reg_101;

    ap_ready_assign_proc : process(ap_CS_fsm_state7)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state7)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln26_fu_157_p2 <= "1" when (ap_phi_mux_indvar_flatten_phi_fu_117_p4 = ap_const_lv3_4) else "0";
    icmp_ln27_fu_169_p2 <= "1" when (ap_phi_mux_j5_0_i_phi_fu_139_p4 = ap_const_lv2_2) else "0";
    j_fu_202_p2 <= std_logic_vector(unsigned(select_ln28_reg_235) + unsigned(ap_const_lv2_1));
    mul_ln28_fu_211_p2 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(std_logic_vector(signed(A_read_reg_251) * signed(x_load_reg_256))), 32));
    select_ln28_1_fu_189_p3 <= 
        add_ln26_1_fu_183_p2 when (icmp_ln27_fu_169_p2(0) = '1') else 
        ap_phi_mux_i4_0_i_phi_fu_128_p4;
    select_ln28_fu_175_p3 <= 
        ap_const_lv2_0 when (icmp_ln27_fu_169_p2(0) = '1') else 
        ap_phi_mux_j5_0_i_phi_fu_139_p4;
    x_address0 <= zext_ln28_1_fu_197_p1(1 - 1 downto 0);

    x_ce0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1))) then 
            x_ce0 <= ap_const_logic_1;
        else 
            x_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    xor_ln25_fu_151_p2 <= (phi_ln25_i_reg_101 xor ap_const_lv1_1);

    y_address0_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1, ap_CS_fsm_state2, ap_CS_fsm_pp0_stage0, y_addr_1_reg_271, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0, zext_ln25_fu_146_p1, zext_ln28_fu_207_p1)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
            y_address0 <= y_addr_1_reg_271;
        elsif (((ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0))) then 
            y_address0 <= zext_ln28_fu_207_p1(1 - 1 downto 0);
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            y_address0 <= zext_ln25_fu_146_p1(1 - 1 downto 0);
        else 
            y_address0 <= "X";
        end if; 
    end process;


    y_ce0_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_CS_fsm_state2, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001, ap_block_pp0_stage1_11001, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1)) or ((ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001)))) then 
            y_ce0 <= ap_const_logic_1;
        else 
            y_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    y_d0_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1, ap_CS_fsm_state2, ap_enable_reg_pp0_iter1, add_ln28_fu_215_p2)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
            y_d0 <= add_ln28_fu_215_p2;
        elsif ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            y_d0 <= ap_const_lv32_0;
        else 
            y_d0 <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;


    y_we0_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_CS_fsm_state2, icmp_ln26_reg_226_pp0_iter1_reg, ap_block_pp0_stage1_11001, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) or ((icmp_ln26_reg_226_pp0_iter1_reg = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001)))) then 
            y_we0 <= ap_const_logic_1;
        else 
            y_we0 <= ap_const_logic_0;
        end if; 
    end process;

    zext_ln25_fu_146_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(phi_ln25_i_reg_101),64));
    zext_ln28_1_fu_197_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln28_fu_175_p3),64));
    zext_ln28_fu_207_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln28_1_reg_240),64));
end behav;
