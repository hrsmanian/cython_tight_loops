
import time
import simple_loop_cy

sum1 = 0
for i in range(50):
    start_time = time.perf_counter()
    j = simple_loop_cy.loop_func()
    sum1 += time.perf_counter() - start_time

print("avg time = ", sum1/50)
print(j)
