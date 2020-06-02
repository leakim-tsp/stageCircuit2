#ifndef _TILE_H_
#define _TILE_H_
#include "hls_stream.h"
#include <iostream>
#include <iomanip>
#include <vector>
using namespace std;

typedef int DTYPE ;
const int SIZE = 8;
const int TILES_NUMBER = 16 ;
const int TILE_SIZE = 2  ;
const int TILE_ITER = 4 ;

typedef struct {
	DTYPE vec[TILE_SIZE];}  tilevec ;
// a structure which will be used to stream tiles


void tiled_matvec(hls::stream<tilevec> &Atile, hls::stream<tilevec> &xtile, DTYPE ypartial[SIZE], int &i1, int &i2) ;

#endif
