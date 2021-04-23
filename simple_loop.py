import time

def loop_func():
    j = 0
    for i in range(1000000):
        j = i+1
    return j

sum1 = 0
for i in range(50):
    start_time = time.perf_counter()
    j = loop_func()
    sum1 += time.perf_counter() - start_time

print("avg time = ", sum1/50)
print(j)
