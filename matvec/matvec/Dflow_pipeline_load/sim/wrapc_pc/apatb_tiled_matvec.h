// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================

extern void AESL_WRAP_tiled_matvec (
hls::stream<tilevec > (&Atile),
hls::stream<tilevec > (&xtile),
int ypartial[8],
int (&i1),
int (&i2));
