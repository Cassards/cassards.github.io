perf stat -e LLC-loads,LLC-load-misses ./build/serial_VAR  500000000 5 2> serial_LLC_results_VAR  

perf stat -e LLC-loads,LLC-load-misses ./build/parallel_omp_VAR  500000000 5 1 2>  omp_LLC_results_VAR  
perf stat -e LLC-loads,LLC-load-misses ./build/parallel_omp_VAR  500000000 5 2 2>> omp_LLC_results_VAR  
perf stat -e LLC-loads,LLC-load-misses ./build/parallel_omp_VAR  500000000 5 4 2>> omp_LLC_results_VAR  
perf stat -e LLC-loads,LLC-load-misses ./build/parallel_omp_VAR  500000000 5 8 2>> omp_LLC_results_VAR  

perf stat -e LLC-loads,LLC-load-misses ./build/parallel_pthread_VAR  500000000 5 1 2>  pthread_LLC_results_VAR  
perf stat -e LLC-loads,LLC-load-misses ./build/parallel_pthread_VAR  500000000 5 2 2>> pthread_LLC_results_VAR  
perf stat -e LLC-loads,LLC-load-misses ./build/parallel_pthread_VAR  500000000 5 4 2>> pthread_LLC_results_VAR  
perf stat -e LLC-loads,LLC-load-misses ./build/parallel_pthread_VAR  500000000 5 8 2>> pthread_LLC_results_VAR  
