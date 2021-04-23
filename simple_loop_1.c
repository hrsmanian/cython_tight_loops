#include <stdio.h>
#include <time.h>

int loop_func() {
    int j = 0;
    for (int i = 0; i < 1000000; i++) {
        j = i+1;
    }

    return j;
}

void main() {
    
    int j = 0;
    clock_t start, end;
    double cpu_time_used;
    double sum1 = 0.0;
    
    for (int i=0; i < 50;i++) {
        start = clock();
        j = loop_func();
        end = clock();
        sum1 += ((double) (end - start)) / CLOCKS_PER_SEC;
    }
    
    
    printf("Avg Time: %f\n", sum1/50);
    printf("j = %i\n", j);


}