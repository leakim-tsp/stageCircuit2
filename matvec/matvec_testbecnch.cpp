#include "matvec.h"
#include <stdlib.h>
using namespace std;

void matvec(DTYPE A[SIZE][SIZE], DTYPE x[SIZE], DTYPE y[SIZE]){
	DTYPE y_i = 0 ;
	for (int i(0); i < SIZE ; ++i){
		for (int j(0); j < SIZE ; ++j){
			y_i += A[i][j] * x[j] ;
		}
		y[i] = y_i ;
	}
}

void load(int &i1, int &i2, tilevec &xtile_vec, tilevec &Atile_vec, DTYPE x[], DTYPE A[][SIZE], hls::stream<tilevec> &Atile, hls::stream<tilevec> &xtile){
	if (i2 == 0){
		for (int i(0); i < TILE_SIZE ; ++i){
			xtile_vec.vec[i] = x[i + 2*i1] ;
		}
		xtile.write(xtile_vec) ;
	}
	for (int i(0); i < TILE_SIZE ; ++i){
		for (int j(0); j < TILE_SIZE ; ++j){
			Atile_vec.vec[j] = A[i + 2*i1][j + 2*i2] ;
		}
		Atile.write(Atile_vec) ;
	}
}

int main(){
	int fail(0) ;
	hls::stream<tilevec> Atile("Atile") ;
	hls::stream<tilevec> xtile("xtile") ;
	tilevec xtile_vec, Atile_vec ;
	DTYPE x[SIZE] ;
	DTYPE A[SIZE][SIZE] ;
	DTYPE y[SIZE] ;
	DTYPE ytile[SIZE] ;

	// random example generation & initialization
	for (int i(0); i < SIZE; ++i){
		x[i] = rand() % 512 ;
		y[i] = 0 ;
		ytile[i] = 0 ;
		for (int j(0); j < SIZE; ++j){
			A[i][j] = rand() % 512 ;
		}
	}

	matvec(A, x, y) ;

	for (int i1(0); i1 < TILE_ITER; ++i1){
		for (int i2(0); i2 < TILE_ITER; ++i2){
			load(i1, i2, xtile_vec, Atile_vec, x, A, Atile, xtile) ;
			tiled_matvec(Atile, xtile, ytile, i1, i2) ;
		}
	}

	for (int i(0) ; i < SIZE; ++i){
		if (y[i] != ytile[i]) fail = 1 ;
	}

	if (fail == 1) cout << "failed" << endl;
	else cout << "passed" << endl;

	return 0 ;

}
