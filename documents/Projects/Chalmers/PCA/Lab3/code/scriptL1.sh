perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./lock1 1 40000000 2>  A.1_results
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./lock1 2 40000000 2>> A.1_results 
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./lock1 4 40000000 2>> A.1_results

perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./lock2 1 40000000 2>  A.2_results
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./lock2 2 40000000 2>> A.2_results 
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./lock2 4 40000000 2>> A.2_results

perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./lock3 1 40000000 2>  A.3_results
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./lock3 2 40000000 2>> A.3_results 
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./lock3 4 40000000 2>> A.3_results

perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./lock4 1 40000000 2>  A.4_results
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./lock4 2 40000000 2>> A.4_results 
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./lock4 4 40000000 2>> A.4_results
