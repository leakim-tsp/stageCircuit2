void multiply(int N, int mat1[][N], int mat2[][N], int res[][N]) 
{ 
    for (int i = 0; i < N; i++) 
    { 
        for (int j = 0; j < N; j++) 
        { 
	  // res[i][j] = 0; 
            for (int k = 0; k < N; k++) 
	    compute :res[i][j] += mat1[i][k]*mat2[k][j]; 
        } 
    } 
} 
