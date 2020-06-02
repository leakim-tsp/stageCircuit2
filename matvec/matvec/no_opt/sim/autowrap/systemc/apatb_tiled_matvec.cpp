// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================

#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;


// [dump_struct_tree [build_nameSpaceTree] dumpedStructList] ---------->
    typedef struct  {
        int vec[2];
       } tilevec;



// [dump_enumeration [get_enumeration_list]] ---------->


// wrapc file define: "Atile_V_vec_0"
#define AUTOTB_TVIN_Atile_V_vec_0  "../tv/cdatafile/c.tiled_matvec.autotvin_Atile_V_vec_0.dat"
#define WRAPC_STREAM_SIZE_IN_Atile_V_vec_0  "../tv/stream_size/stream_size_in_Atile_V_vec_0.dat"
#define WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_0  "../tv/stream_size/stream_ingress_status_Atile_V_vec_0.dat"
// wrapc file define: "Atile_V_vec_1"
#define AUTOTB_TVIN_Atile_V_vec_1  "../tv/cdatafile/c.tiled_matvec.autotvin_Atile_V_vec_1.dat"
#define WRAPC_STREAM_SIZE_IN_Atile_V_vec_1  "../tv/stream_size/stream_size_in_Atile_V_vec_1.dat"
#define WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_1  "../tv/stream_size/stream_ingress_status_Atile_V_vec_1.dat"
// wrapc file define: "xtile_V_vec_0"
#define AUTOTB_TVIN_xtile_V_vec_0  "../tv/cdatafile/c.tiled_matvec.autotvin_xtile_V_vec_0.dat"
#define WRAPC_STREAM_SIZE_IN_xtile_V_vec_0  "../tv/stream_size/stream_size_in_xtile_V_vec_0.dat"
#define WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_0  "../tv/stream_size/stream_ingress_status_xtile_V_vec_0.dat"
// wrapc file define: "xtile_V_vec_1"
#define AUTOTB_TVIN_xtile_V_vec_1  "../tv/cdatafile/c.tiled_matvec.autotvin_xtile_V_vec_1.dat"
#define WRAPC_STREAM_SIZE_IN_xtile_V_vec_1  "../tv/stream_size/stream_size_in_xtile_V_vec_1.dat"
#define WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_1  "../tv/stream_size/stream_ingress_status_xtile_V_vec_1.dat"
// wrapc file define: "ypartial"
#define AUTOTB_TVIN_ypartial  "../tv/cdatafile/c.tiled_matvec.autotvin_ypartial.dat"
#define AUTOTB_TVOUT_ypartial  "../tv/cdatafile/c.tiled_matvec.autotvout_ypartial.dat"
// wrapc file define: "i2"
#define AUTOTB_TVIN_i2  "../tv/cdatafile/c.tiled_matvec.autotvin_i2.dat"

#define INTER_TCL  "../tv/cdatafile/ref.tcl"

// tvout file define: "ypartial"
#define AUTOTB_TVOUT_PC_ypartial  "../tv/rtldatafile/rtl.tiled_matvec.autotvout_ypartial.dat"

class INTER_TCL_FILE {
	public:
		INTER_TCL_FILE(const char* name) {
			mName = name;
			Atile_V_vec_0_depth = 0;
			Atile_V_vec_1_depth = 0;
			xtile_V_vec_0_depth = 0;
			xtile_V_vec_1_depth = 0;
			ypartial_depth = 0;
			i2_depth = 0;
			trans_num =0;
		}

		~INTER_TCL_FILE() {
			mFile.open(mName);
			if (!mFile.good()) {
				cout << "Failed to open file ref.tcl" << endl;
				exit (1);
			}
			string total_list = get_depth_list();
			mFile << "set depth_list {\n";
			mFile << total_list;
			mFile << "}\n";
			mFile << "set trans_num "<<trans_num<<endl;
			mFile.close();
		}

		string get_depth_list () {
			stringstream total_list;
			total_list << "{Atile_V_vec_0 " << Atile_V_vec_0_depth << "}\n";
			total_list << "{Atile_V_vec_1 " << Atile_V_vec_1_depth << "}\n";
			total_list << "{xtile_V_vec_0 " << xtile_V_vec_0_depth << "}\n";
			total_list << "{xtile_V_vec_1 " << xtile_V_vec_1_depth << "}\n";
			total_list << "{ypartial " << ypartial_depth << "}\n";
			total_list << "{i2 " << i2_depth << "}\n";
			return total_list.str();
		}

		void set_num (int num , int* class_num) {
			(*class_num) = (*class_num) > num ? (*class_num) : num;
		}
	public:
		int Atile_V_vec_0_depth;
		int Atile_V_vec_1_depth;
		int xtile_V_vec_0_depth;
		int xtile_V_vec_1_depth;
		int ypartial_depth;
		int i2_depth;
		int trans_num;

	private:
		ofstream mFile;
		const char* mName;
};

extern void tiled_matvec (
hls::stream<tilevec > (&Atile),
hls::stream<tilevec > (&xtile),
int ypartial[4],
int (&i1),
int (&i2));

void AESL_WRAP_tiled_matvec (
hls::stream<tilevec > (&Atile),
hls::stream<tilevec > (&xtile),
int ypartial[4],
int (&i1),
int (&i2))
{
	refine_signal_handler();
	fstream wrapc_switch_file_token;
	wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
	int AESL_i;
	if (wrapc_switch_file_token.good())
	{
		CodeState = ENTER_WRAPC_PC;
		static unsigned AESL_transaction_pc = 0;
		string AESL_token;
		string AESL_num;
		static AESL_FILE_HANDLER aesl_fh;

		// pop stream input: "Atile"
		aesl_fh.read(WRAPC_STREAM_SIZE_IN_Atile_V_vec_0, AESL_token); // [[transaction]]
		aesl_fh.read(WRAPC_STREAM_SIZE_IN_Atile_V_vec_0, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(WRAPC_STREAM_SIZE_IN_Atile_V_vec_0, AESL_token); // pop_size
			int aesl_tmp_1 = atoi(AESL_token.c_str());
			for (int i = 0; i < aesl_tmp_1; i++)
			{
				Atile.read();
			}
			aesl_fh.read(WRAPC_STREAM_SIZE_IN_Atile_V_vec_0, AESL_token); // [[/transaction]]
		}

		// pop stream input: "xtile"
		aesl_fh.read(WRAPC_STREAM_SIZE_IN_xtile_V_vec_0, AESL_token); // [[transaction]]
		aesl_fh.read(WRAPC_STREAM_SIZE_IN_xtile_V_vec_0, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(WRAPC_STREAM_SIZE_IN_xtile_V_vec_0, AESL_token); // pop_size
			int aesl_tmp_4 = atoi(AESL_token.c_str());
			for (int i = 0; i < aesl_tmp_4; i++)
			{
				xtile.read();
			}
			aesl_fh.read(WRAPC_STREAM_SIZE_IN_xtile_V_vec_0, AESL_token); // [[/transaction]]
		}

		// output port post check: "ypartial"
		aesl_fh.read(AUTOTB_TVOUT_PC_ypartial, AESL_token); // [[transaction]]
		if (AESL_token != "[[transaction]]")
		{
			exit(1);
		}
		aesl_fh.read(AUTOTB_TVOUT_PC_ypartial, AESL_num); // transaction number

		if (atoi(AESL_num.c_str()) == AESL_transaction_pc)
		{
			aesl_fh.read(AUTOTB_TVOUT_PC_ypartial, AESL_token); // data

			sc_bv<32> *ypartial_pc_buffer = new sc_bv<32>[4];
			int i = 0;

			while (AESL_token != "[[/transaction]]")
			{
				bool no_x = false;
				bool err = false;

				// search and replace 'X' with "0" from the 1st char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('X');
					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'ypartial', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				no_x = false;

				// search and replace 'x' with "0" from the 3rd char of token
				while (!no_x)
				{
					size_t x_found = AESL_token.find('x', 2);

					if (x_found != string::npos)
					{
						if (!err)
						{
							cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port 'ypartial', possible cause: There are uninitialized variables in the C design." << endl;
							err = true;
						}
						AESL_token.replace(x_found, 1, "0");
					}
					else
					{
						no_x = true;
					}
				}

				// push token into output port buffer
				if (AESL_token != "")
				{
					ypartial_pc_buffer[i] = AESL_token.c_str();
					i++;
				}

				aesl_fh.read(AUTOTB_TVOUT_PC_ypartial, AESL_token); // data or [[/transaction]]

				if (AESL_token == "[[[/runtime]]]" || aesl_fh.eof(AUTOTB_TVOUT_PC_ypartial))
				{
					exit(1);
				}
			}

			// ***********************************
			if (i > 0)
			{
				// RTL Name: ypartial
				{
					// bitslice(31, 0)
					// {
						// celement: ypartial(31, 0)
						// {
							sc_lv<32>* ypartial_lv0_0_3_1 = new sc_lv<32>[4];
						// }
					// }

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: ypartial(31, 0)
						{
							// carray: (0) => (3) @ (1)
							for (int i_0 = 0; i_0 <= 3; i_0 += 1)
							{
								if (&(ypartial[0]) != NULL) // check the null address if the c port is array or others
								{
									ypartial_lv0_0_3_1[hls_map_index].range(31, 0) = sc_bv<32>(ypartial_pc_buffer[hls_map_index].range(31, 0));
									hls_map_index++;
								}
							}
						}
					}

					// bitslice(31, 0)
					{
						int hls_map_index = 0;
						// celement: ypartial(31, 0)
						{
							// carray: (0) => (3) @ (1)
							for (int i_0 = 0; i_0 <= 3; i_0 += 1)
							{
								// sub                    : i_0
								// ori_name               : ypartial[i_0]
								// sub_1st_elem           : 0
								// ori_name_1st_elem      : ypartial[0]
								// output_left_conversion : ypartial[i_0]
								// output_type_conversion : (ypartial_lv0_0_3_1[hls_map_index]).to_uint64()
								if (&(ypartial[0]) != NULL) // check the null address if the c port is array or others
								{
									ypartial[i_0] = (ypartial_lv0_0_3_1[hls_map_index]).to_uint64();
									hls_map_index++;
								}
							}
						}
					}
				}
			}

			// release memory allocation
			delete [] ypartial_pc_buffer;
		}

		AESL_transaction_pc++;
	}
	else
	{
		CodeState = ENTER_WRAPC;
		static unsigned AESL_transaction;

		static AESL_FILE_HANDLER aesl_fh;

		// "Atile_V_vec_0"
		char* tvin_Atile_V_vec_0 = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_Atile_V_vec_0);
		char* wrapc_stream_size_in_Atile_V_vec_0 = new char[50];
		aesl_fh.touch(WRAPC_STREAM_SIZE_IN_Atile_V_vec_0);
		char* wrapc_stream_ingress_status_Atile_V_vec_0 = new char[50];
		aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_0);

		// "Atile_V_vec_1"
		char* tvin_Atile_V_vec_1 = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_Atile_V_vec_1);
		char* wrapc_stream_size_in_Atile_V_vec_1 = new char[50];
		aesl_fh.touch(WRAPC_STREAM_SIZE_IN_Atile_V_vec_1);
		char* wrapc_stream_ingress_status_Atile_V_vec_1 = new char[50];
		aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_1);

		// "xtile_V_vec_0"
		char* tvin_xtile_V_vec_0 = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_xtile_V_vec_0);
		char* wrapc_stream_size_in_xtile_V_vec_0 = new char[50];
		aesl_fh.touch(WRAPC_STREAM_SIZE_IN_xtile_V_vec_0);
		char* wrapc_stream_ingress_status_xtile_V_vec_0 = new char[50];
		aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_0);

		// "xtile_V_vec_1"
		char* tvin_xtile_V_vec_1 = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_xtile_V_vec_1);
		char* wrapc_stream_size_in_xtile_V_vec_1 = new char[50];
		aesl_fh.touch(WRAPC_STREAM_SIZE_IN_xtile_V_vec_1);
		char* wrapc_stream_ingress_status_xtile_V_vec_1 = new char[50];
		aesl_fh.touch(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_1);

		// "ypartial"
		char* tvin_ypartial = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_ypartial);
		char* tvout_ypartial = new char[50];
		aesl_fh.touch(AUTOTB_TVOUT_ypartial);

		// "i2"
		char* tvin_i2 = new char[50];
		aesl_fh.touch(AUTOTB_TVIN_i2);

		CodeState = DUMP_INPUTS;
		static INTER_TCL_FILE tcl_file(INTER_TCL);
		int leading_zero;

		// dump stream tvin: "Atile"
		std::vector<tilevec > aesl_tmp_0;
		int aesl_tmp_1 = 0;
		while (!Atile.empty())
		{
			aesl_tmp_0.push_back(Atile.read());
			aesl_tmp_1++;
		}

		// dump stream tvin: "xtile"
		std::vector<tilevec > aesl_tmp_3;
		int aesl_tmp_4 = 0;
		while (!xtile.empty())
		{
			aesl_tmp_3.push_back(xtile.read());
			aesl_tmp_4++;
		}

		// [[transaction]]
		sprintf(tvin_ypartial, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_ypartial, tvin_ypartial);

		sc_bv<32>* ypartial_tvin_wrapc_buffer = new sc_bv<32>[4];

		// RTL Name: ypartial
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: ypartial(31, 0)
				{
					// carray: (0) => (3) @ (1)
					for (int i_0 = 0; i_0 <= 3; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : ypartial[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : ypartial[0]
						// regulate_c_name       : ypartial
						// input_type_conversion : ypartial[i_0]
						if (&(ypartial[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> ypartial_tmp_mem;
							ypartial_tmp_mem = ypartial[i_0];
							ypartial_tvin_wrapc_buffer[hls_map_index].range(31, 0) = ypartial_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 4; i++)
		{
			sprintf(tvin_ypartial, "%s\n", (ypartial_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_ypartial, tvin_ypartial);
		}

		tcl_file.set_num(4, &tcl_file.ypartial_depth);
		sprintf(tvin_ypartial, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_ypartial, tvin_ypartial);

		// release memory allocation
		delete [] ypartial_tvin_wrapc_buffer;

		// [[transaction]]
		sprintf(tvin_i2, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_i2, tvin_i2);

		sc_bv<32>* i2_tvin_wrapc_buffer = new sc_bv<32>[1];

		// RTL Name: i2
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: i2(31, 0)
				{
					// carray: (0) => (0) @ (1)
					for (int i_0 = 0; i_0 <= 0; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : i2
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : i2
						// regulate_c_name       : i2
						// input_type_conversion : i2
						if (&(i2) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> i2_tmp_mem;
							i2_tmp_mem = i2;
							i2_tvin_wrapc_buffer[hls_map_index].range(31, 0) = i2_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 1; i++)
		{
			sprintf(tvin_i2, "%s\n", (i2_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_i2, tvin_i2);
		}

		tcl_file.set_num(1, &tcl_file.i2_depth);
		sprintf(tvin_i2, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_i2, tvin_i2);

		// release memory allocation
		delete [] i2_tvin_wrapc_buffer;

		// push back input stream: "Atile"
		for (int i = 0; i < aesl_tmp_1; i++)
		{
			Atile.write(aesl_tmp_0[i]);
		}

		// push back input stream: "xtile"
		for (int i = 0; i < aesl_tmp_4; i++)
		{
			xtile.write(aesl_tmp_3[i]);
		}

// [call_c_dut] ---------->

		CodeState = CALL_C_DUT;
		tiled_matvec(Atile, xtile, ypartial, i1, i2);

		CodeState = DUMP_OUTPUTS;
		// record input size to tv3: "Atile"
		int aesl_tmp_2 = Atile.size();

		// record input size to tv3: "xtile"
		int aesl_tmp_5 = xtile.size();

		// [[transaction]]
		sprintf(tvin_Atile_V_vec_0, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_Atile_V_vec_0, tvin_Atile_V_vec_0);
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_0, tvin_Atile_V_vec_0);

		sc_bv<32>* Atile_V_vec_0_tvin_wrapc_buffer = new sc_bv<32>[aesl_tmp_1 - aesl_tmp_2];

		// RTL Name: Atile_V_vec_0
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: Atile.V.vec(31, 0)
				{
					// carray: (0) => (aesl_tmp_1 - aesl_tmp_2 - 1) @ (1)
					for (int i_0 = 0; i_0 <= aesl_tmp_1 - aesl_tmp_2 - 1; i_0 += 1)
					{
						// carray: (0) => (0) @ (2)
						for (int i_1 = 0; i_1 <= 0; i_1 += 2)
						{
							// sub                   : i_0 i_1
							// ori_name              : aesl_tmp_0[i_0].vec[i_1]
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : aesl_tmp_0[0].vec[0]
							// regulate_c_name       : Atile_V_vec
							// input_type_conversion : aesl_tmp_0[i_0].vec[i_1]
							if (&(aesl_tmp_0[0].vec[0]) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<32> Atile_V_vec_tmp_mem;
								Atile_V_vec_tmp_mem = aesl_tmp_0[i_0].vec[i_1];
								Atile_V_vec_0_tvin_wrapc_buffer[hls_map_index].range(31, 0) = Atile_V_vec_tmp_mem.range(31, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < aesl_tmp_1 - aesl_tmp_2; i++)
		{
			sprintf(tvin_Atile_V_vec_0, "%s\n", (Atile_V_vec_0_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_Atile_V_vec_0, tvin_Atile_V_vec_0);
		}

		// dump stream ingress status to file
     if (aesl_tmp_1 > aesl_tmp_2)
     {
		sc_int<32> stream_ingress_size_Atile_V_vec_0 = aesl_tmp_1;
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_0, stream_ingress_size_Atile_V_vec_0.to_string().c_str());
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_0, "\n");

		for (int i = 0; i < aesl_tmp_1 - aesl_tmp_2; i++)
		{
			stream_ingress_size_Atile_V_vec_0--;
			aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_0, stream_ingress_size_Atile_V_vec_0.to_string().c_str());
			aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_0, "\n");
		}
     }
     else {
		    sc_int<32> stream_ingress_size_Atile_V_vec_0 = 0;
		    aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_0, stream_ingress_size_Atile_V_vec_0.to_string().c_str());
		    aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_0, "\n");
     }

		tcl_file.set_num(aesl_tmp_1 - aesl_tmp_2, &tcl_file.Atile_V_vec_0_depth);
		sprintf(tvin_Atile_V_vec_0, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_Atile_V_vec_0, tvin_Atile_V_vec_0);
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_0, tvin_Atile_V_vec_0);

		// release memory allocation
		delete [] Atile_V_vec_0_tvin_wrapc_buffer;

		// dump stream size
		sprintf(wrapc_stream_size_in_Atile_V_vec_0, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_Atile_V_vec_0, wrapc_stream_size_in_Atile_V_vec_0);
		sprintf(wrapc_stream_size_in_Atile_V_vec_0, "%d\n", aesl_tmp_1 - aesl_tmp_2);
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_Atile_V_vec_0, wrapc_stream_size_in_Atile_V_vec_0);
		sprintf(wrapc_stream_size_in_Atile_V_vec_0, "[[/transaction]] \n");
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_Atile_V_vec_0, wrapc_stream_size_in_Atile_V_vec_0);

		// [[transaction]]
		sprintf(tvin_Atile_V_vec_1, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_Atile_V_vec_1, tvin_Atile_V_vec_1);
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_1, tvin_Atile_V_vec_1);

		sc_bv<32>* Atile_V_vec_1_tvin_wrapc_buffer = new sc_bv<32>[aesl_tmp_1 - aesl_tmp_2];

		// RTL Name: Atile_V_vec_1
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: Atile.V.vec(31, 0)
				{
					// carray: (0) => (aesl_tmp_1 - aesl_tmp_2 - 1) @ (1)
					for (int i_0 = 0; i_0 <= aesl_tmp_1 - aesl_tmp_2 - 1; i_0 += 1)
					{
						// carray: (1) => (1) @ (2)
						for (int i_1 = 1; i_1 <= 1; i_1 += 2)
						{
							// sub                   : i_0 i_1
							// ori_name              : aesl_tmp_0[i_0].vec[i_1]
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : aesl_tmp_0[0].vec[0]
							// regulate_c_name       : Atile_V_vec
							// input_type_conversion : aesl_tmp_0[i_0].vec[i_1]
							if (&(aesl_tmp_0[0].vec[0]) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<32> Atile_V_vec_tmp_mem;
								Atile_V_vec_tmp_mem = aesl_tmp_0[i_0].vec[i_1];
								Atile_V_vec_1_tvin_wrapc_buffer[hls_map_index].range(31, 0) = Atile_V_vec_tmp_mem.range(31, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < aesl_tmp_1 - aesl_tmp_2; i++)
		{
			sprintf(tvin_Atile_V_vec_1, "%s\n", (Atile_V_vec_1_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_Atile_V_vec_1, tvin_Atile_V_vec_1);
		}

		// dump stream ingress status to file
     if (aesl_tmp_1 > aesl_tmp_2)
     {
		sc_int<32> stream_ingress_size_Atile_V_vec_1 = aesl_tmp_1;
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_1, stream_ingress_size_Atile_V_vec_1.to_string().c_str());
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_1, "\n");

		for (int i = 0; i < aesl_tmp_1 - aesl_tmp_2; i++)
		{
			stream_ingress_size_Atile_V_vec_1--;
			aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_1, stream_ingress_size_Atile_V_vec_1.to_string().c_str());
			aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_1, "\n");
		}
     }
     else {
		    sc_int<32> stream_ingress_size_Atile_V_vec_1 = 0;
		    aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_1, stream_ingress_size_Atile_V_vec_1.to_string().c_str());
		    aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_1, "\n");
     }

		tcl_file.set_num(aesl_tmp_1 - aesl_tmp_2, &tcl_file.Atile_V_vec_1_depth);
		sprintf(tvin_Atile_V_vec_1, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_Atile_V_vec_1, tvin_Atile_V_vec_1);
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_Atile_V_vec_1, tvin_Atile_V_vec_1);

		// release memory allocation
		delete [] Atile_V_vec_1_tvin_wrapc_buffer;

		// dump stream size
		sprintf(wrapc_stream_size_in_Atile_V_vec_1, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_Atile_V_vec_1, wrapc_stream_size_in_Atile_V_vec_1);
		sprintf(wrapc_stream_size_in_Atile_V_vec_1, "%d\n", aesl_tmp_1 - aesl_tmp_2);
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_Atile_V_vec_1, wrapc_stream_size_in_Atile_V_vec_1);
		sprintf(wrapc_stream_size_in_Atile_V_vec_1, "[[/transaction]] \n");
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_Atile_V_vec_1, wrapc_stream_size_in_Atile_V_vec_1);

		// [[transaction]]
		sprintf(tvin_xtile_V_vec_0, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_xtile_V_vec_0, tvin_xtile_V_vec_0);
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_0, tvin_xtile_V_vec_0);

		sc_bv<32>* xtile_V_vec_0_tvin_wrapc_buffer = new sc_bv<32>[aesl_tmp_4 - aesl_tmp_5];

		// RTL Name: xtile_V_vec_0
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: xtile.V.vec(31, 0)
				{
					// carray: (0) => (aesl_tmp_4 - aesl_tmp_5 - 1) @ (1)
					for (int i_0 = 0; i_0 <= aesl_tmp_4 - aesl_tmp_5 - 1; i_0 += 1)
					{
						// carray: (0) => (0) @ (2)
						for (int i_1 = 0; i_1 <= 0; i_1 += 2)
						{
							// sub                   : i_0 i_1
							// ori_name              : aesl_tmp_3[i_0].vec[i_1]
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : aesl_tmp_3[0].vec[0]
							// regulate_c_name       : xtile_V_vec
							// input_type_conversion : aesl_tmp_3[i_0].vec[i_1]
							if (&(aesl_tmp_3[0].vec[0]) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<32> xtile_V_vec_tmp_mem;
								xtile_V_vec_tmp_mem = aesl_tmp_3[i_0].vec[i_1];
								xtile_V_vec_0_tvin_wrapc_buffer[hls_map_index].range(31, 0) = xtile_V_vec_tmp_mem.range(31, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < aesl_tmp_4 - aesl_tmp_5; i++)
		{
			sprintf(tvin_xtile_V_vec_0, "%s\n", (xtile_V_vec_0_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_xtile_V_vec_0, tvin_xtile_V_vec_0);
		}

		// dump stream ingress status to file
     if (aesl_tmp_4 > aesl_tmp_5)
     {
		sc_int<32> stream_ingress_size_xtile_V_vec_0 = aesl_tmp_4;
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_0, stream_ingress_size_xtile_V_vec_0.to_string().c_str());
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_0, "\n");

		for (int i = 0; i < aesl_tmp_4 - aesl_tmp_5; i++)
		{
			stream_ingress_size_xtile_V_vec_0--;
			aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_0, stream_ingress_size_xtile_V_vec_0.to_string().c_str());
			aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_0, "\n");
		}
     }
     else {
		    sc_int<32> stream_ingress_size_xtile_V_vec_0 = 0;
		    aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_0, stream_ingress_size_xtile_V_vec_0.to_string().c_str());
		    aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_0, "\n");
     }

		tcl_file.set_num(aesl_tmp_4 - aesl_tmp_5, &tcl_file.xtile_V_vec_0_depth);
		sprintf(tvin_xtile_V_vec_0, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_xtile_V_vec_0, tvin_xtile_V_vec_0);
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_0, tvin_xtile_V_vec_0);

		// release memory allocation
		delete [] xtile_V_vec_0_tvin_wrapc_buffer;

		// dump stream size
		sprintf(wrapc_stream_size_in_xtile_V_vec_0, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_xtile_V_vec_0, wrapc_stream_size_in_xtile_V_vec_0);
		sprintf(wrapc_stream_size_in_xtile_V_vec_0, "%d\n", aesl_tmp_4 - aesl_tmp_5);
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_xtile_V_vec_0, wrapc_stream_size_in_xtile_V_vec_0);
		sprintf(wrapc_stream_size_in_xtile_V_vec_0, "[[/transaction]] \n");
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_xtile_V_vec_0, wrapc_stream_size_in_xtile_V_vec_0);

		// [[transaction]]
		sprintf(tvin_xtile_V_vec_1, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVIN_xtile_V_vec_1, tvin_xtile_V_vec_1);
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_1, tvin_xtile_V_vec_1);

		sc_bv<32>* xtile_V_vec_1_tvin_wrapc_buffer = new sc_bv<32>[aesl_tmp_4 - aesl_tmp_5];

		// RTL Name: xtile_V_vec_1
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: xtile.V.vec(31, 0)
				{
					// carray: (0) => (aesl_tmp_4 - aesl_tmp_5 - 1) @ (1)
					for (int i_0 = 0; i_0 <= aesl_tmp_4 - aesl_tmp_5 - 1; i_0 += 1)
					{
						// carray: (1) => (1) @ (2)
						for (int i_1 = 1; i_1 <= 1; i_1 += 2)
						{
							// sub                   : i_0 i_1
							// ori_name              : aesl_tmp_3[i_0].vec[i_1]
							// sub_1st_elem          : 0 0
							// ori_name_1st_elem     : aesl_tmp_3[0].vec[0]
							// regulate_c_name       : xtile_V_vec
							// input_type_conversion : aesl_tmp_3[i_0].vec[i_1]
							if (&(aesl_tmp_3[0].vec[0]) != NULL) // check the null address if the c port is array or others
							{
								sc_lv<32> xtile_V_vec_tmp_mem;
								xtile_V_vec_tmp_mem = aesl_tmp_3[i_0].vec[i_1];
								xtile_V_vec_1_tvin_wrapc_buffer[hls_map_index].range(31, 0) = xtile_V_vec_tmp_mem.range(31, 0);
                                 		       hls_map_index++;
							}
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < aesl_tmp_4 - aesl_tmp_5; i++)
		{
			sprintf(tvin_xtile_V_vec_1, "%s\n", (xtile_V_vec_1_tvin_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVIN_xtile_V_vec_1, tvin_xtile_V_vec_1);
		}

		// dump stream ingress status to file
     if (aesl_tmp_4 > aesl_tmp_5)
     {
		sc_int<32> stream_ingress_size_xtile_V_vec_1 = aesl_tmp_4;
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_1, stream_ingress_size_xtile_V_vec_1.to_string().c_str());
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_1, "\n");

		for (int i = 0; i < aesl_tmp_4 - aesl_tmp_5; i++)
		{
			stream_ingress_size_xtile_V_vec_1--;
			aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_1, stream_ingress_size_xtile_V_vec_1.to_string().c_str());
			aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_1, "\n");
		}
     }
     else {
		    sc_int<32> stream_ingress_size_xtile_V_vec_1 = 0;
		    aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_1, stream_ingress_size_xtile_V_vec_1.to_string().c_str());
		    aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_1, "\n");
     }

		tcl_file.set_num(aesl_tmp_4 - aesl_tmp_5, &tcl_file.xtile_V_vec_1_depth);
		sprintf(tvin_xtile_V_vec_1, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVIN_xtile_V_vec_1, tvin_xtile_V_vec_1);
		aesl_fh.write(WRAPC_STREAM_INGRESS_STATUS_xtile_V_vec_1, tvin_xtile_V_vec_1);

		// release memory allocation
		delete [] xtile_V_vec_1_tvin_wrapc_buffer;

		// dump stream size
		sprintf(wrapc_stream_size_in_xtile_V_vec_1, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_xtile_V_vec_1, wrapc_stream_size_in_xtile_V_vec_1);
		sprintf(wrapc_stream_size_in_xtile_V_vec_1, "%d\n", aesl_tmp_4 - aesl_tmp_5);
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_xtile_V_vec_1, wrapc_stream_size_in_xtile_V_vec_1);
		sprintf(wrapc_stream_size_in_xtile_V_vec_1, "[[/transaction]] \n");
		aesl_fh.write(WRAPC_STREAM_SIZE_IN_xtile_V_vec_1, wrapc_stream_size_in_xtile_V_vec_1);

		// [[transaction]]
		sprintf(tvout_ypartial, "[[transaction]] %d\n", AESL_transaction);
		aesl_fh.write(AUTOTB_TVOUT_ypartial, tvout_ypartial);

		sc_bv<32>* ypartial_tvout_wrapc_buffer = new sc_bv<32>[4];

		// RTL Name: ypartial
		{
			// bitslice(31, 0)
			{
				int hls_map_index = 0;
				// celement: ypartial(31, 0)
				{
					// carray: (0) => (3) @ (1)
					for (int i_0 = 0; i_0 <= 3; i_0 += 1)
					{
						// sub                   : i_0
						// ori_name              : ypartial[i_0]
						// sub_1st_elem          : 0
						// ori_name_1st_elem     : ypartial[0]
						// regulate_c_name       : ypartial
						// input_type_conversion : ypartial[i_0]
						if (&(ypartial[0]) != NULL) // check the null address if the c port is array or others
						{
							sc_lv<32> ypartial_tmp_mem;
							ypartial_tmp_mem = ypartial[i_0];
							ypartial_tvout_wrapc_buffer[hls_map_index].range(31, 0) = ypartial_tmp_mem.range(31, 0);
                                 	       hls_map_index++;
						}
					}
				}
			}
		}

		// dump tv to file
		for (int i = 0; i < 4; i++)
		{
			sprintf(tvout_ypartial, "%s\n", (ypartial_tvout_wrapc_buffer[i]).to_string(SC_HEX).c_str());
			aesl_fh.write(AUTOTB_TVOUT_ypartial, tvout_ypartial);
		}

		tcl_file.set_num(4, &tcl_file.ypartial_depth);
		sprintf(tvout_ypartial, "[[/transaction]] \n");
		aesl_fh.write(AUTOTB_TVOUT_ypartial, tvout_ypartial);

		// release memory allocation
		delete [] ypartial_tvout_wrapc_buffer;

		CodeState = DELETE_CHAR_BUFFERS;
		// release memory allocation: "Atile_V_vec_0"
		delete [] tvin_Atile_V_vec_0;
		delete [] wrapc_stream_size_in_Atile_V_vec_0;
		// release memory allocation: "Atile_V_vec_1"
		delete [] tvin_Atile_V_vec_1;
		delete [] wrapc_stream_size_in_Atile_V_vec_1;
		// release memory allocation: "xtile_V_vec_0"
		delete [] tvin_xtile_V_vec_0;
		delete [] wrapc_stream_size_in_xtile_V_vec_0;
		// release memory allocation: "xtile_V_vec_1"
		delete [] tvin_xtile_V_vec_1;
		delete [] wrapc_stream_size_in_xtile_V_vec_1;
		// release memory allocation: "ypartial"
		delete [] tvin_ypartial;
		delete [] tvout_ypartial;
		// release memory allocation: "i2"
		delete [] tvin_i2;

		AESL_transaction++;

		tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
	}
}

