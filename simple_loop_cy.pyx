cpdef loop_func():
    cdef int i=0, j=0
    for i in range(1000000):
        j = i+1
    return j

