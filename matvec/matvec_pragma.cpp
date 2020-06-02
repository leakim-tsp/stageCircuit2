#include "matvec.h"

void tiled_matvec(hls::stream<tilevec> &Atile, hls::stream<tilevec> &xtile, DTYPE ypartial[SIZE], int &i1, int &i2){
	#pragma HLS DATAFLOW
	// Atile is a fifo stream of row from tile (i1, i2) of A
	static DTYPE A[TILE_SIZE][TILE_SIZE] ;
	// load A tile
	for (int i(0); i < TILE_SIZE ; ++i ){
		tilevec tempArow = Atile.read() ;
		tiled_matvec_loadA:for (int j(0); j < TILE_SIZE ; ++j){
			#pragma HLS PIPELINE II=1
			A[i][j] = tempArow.vec[j] ;
		}
	}

	//load x tile if necessary
	static DTYPE x[TILE_SIZE] ;
	if (i2 == 0){
		tilevec tempx = xtile.read() ; ;
		tiled_matvec_loadx:for (int i(0); i < TILE_SIZE; ++i){
			#pragma HLS PIPELINE II=1
			x[i] = tempx.vec[i] ;
		}
	}

	// compute(i1, i2)
	DTYPE y[TILE_SIZE] = { 0 } ;
	tiled_matvec_computei:for (int i(0); i < TILE_SIZE; ++i){
		#pragma HLS PIPELINE II=1
		tiled_matvec_computej:for (int j(0); j < TILE_SIZE; ++j){
			y[i] += A[i][j] * x[j] ;
		}
	}

	// store + update result
	for (int i(0); i < TILE_SIZE; ++i){
		// index transformation
		ypartial[2*i2 + i] += y[i] ;
	}

}
