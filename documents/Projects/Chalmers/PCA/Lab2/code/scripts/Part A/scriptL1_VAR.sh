perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./build/parallel_pthread_VAR 500000000 5 1 2>  pthread_L1_results_VAR 
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./build/parallel_pthread_VAR 500000000 5 2 2>> pthread_L1_results_VAR  
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./build/parallel_pthread_VAR 500000000 5 4 2>> pthread_L1_results_VAR 
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./build/parallel_pthread_VAR 500000000 5 8 2>> pthread_L1_results_VAR 


perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./build/parallel_omp_VAR 500000000 5 1 2>  omp_L1_results_VAR 
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./build/parallel_omp_VAR 500000000 5 2 2>> omp_L1_results_VAR  
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./build/parallel_omp_VAR 500000000 5 4 2>> omp_L1_results_VAR 
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./build/parallel_omp_VAR 500000000 5 8 2>> omp_L1_results_VAR 


perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./build/serial_VAR 500000000 5 2> serial_L1_results_VAR 