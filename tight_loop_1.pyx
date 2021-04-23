import numpy as np

cpdef tight_loop(array_len, input_2d_array, input_1d_array):

    score = np.ones((array_len),dtype=np.float32)

    cdef int MAX_ITERATIONS = 100
    cdef double d=0.9
    cdef double threshold = 0.0001 #convergence threshold
    cdef int i, j, iter
    cdef double summation

    for iter in range(0,MAX_ITERATIONS):
        prev_score = np.copy(score)
    
        for i in range(0,array_len):
        
            summation = 0
            for j in range(0,array_len):
                if input_2d_array[i][j] != 0:
                    summation += (input_2d_array[i][j]/input_1d_array[j])*score[j]
                    
            score[i] = (1-d) + d*(summation)
    
        if np.sum(np.fabs(prev_score-score)) <= threshold: #convergence condition
            break        

    return score

    