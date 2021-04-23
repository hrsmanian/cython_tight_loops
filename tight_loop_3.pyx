import numpy as np
import cython
from libc.math cimport fabs

@cython.boundscheck(False)
@cython.wraparound(False)
# input_2d_array and input_1d_array are now memory views of the 
# numpy arrays passed to the function
cpdef tight_loop(int array_len, double[:,:] input_2d_array, double[:] input_1d_array):

    cdef int MAX_ITERATIONS = 100
    cdef double d=0.9
    cdef double threshold = 0.0001 #convergence threshold
    cdef int i, j, iter, l, k
    cdef double summation, diff_sum

    # declare score and pscore as numpy arrays
    # set memory views for the numpy arrays
    #
    score = np.ones((array_len),dtype=np.double)
    pscore = np.ones((array_len),dtype=np.double)

    cdef double [:] score_memview = score
    cdef double [:] pscore_memview = pscore

    for iter in range(0,MAX_ITERATIONS):
        pscore_memview[:] = score_memview
    
        for i in range(0,array_len):
            summation = 0
            for j in range(0,array_len):
                if input_2d_array[i,j] != 0:
                    summation += (input_2d_array[i,j]/input_1d_array[j])*score_memview[j]
                    
            score_memview[i] = (1-d) + d*(summation)
    
        # diff_sum = np.fabs(prev_score - score1)
        diff_sum = 0.0
        for k in range(0,array_len):
           diff_sum += fabs(pscore_memview[k] - score_memview[k])

        if diff_sum <= threshold:
            break

    return score

    