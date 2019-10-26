perf stat -e LLC-loads,LLC-load-misses ./build/serial 500000000 5 2> serial_LLC_results 

perf stat -e LLC-loads,LLC-load-misses ./build/parallel_omp 500000000 5 1 2>  omp_LLC_results 
perf stat -e LLC-loads,LLC-load-misses ./build/parallel_omp 500000000 5 2 2>> omp_LLC_results 
perf stat -e LLC-loads,LLC-load-misses ./build/parallel_omp 500000000 5 4 2>> omp_LLC_results 
perf stat -e LLC-loads,LLC-load-misses ./build/parallel_omp 500000000 5 8 2>> omp_LLC_results 

perf stat -e LLC-loads,LLC-load-misses ./build/parallel_pthread 500000000 5 1 2>  pthread_LLC_results 
perf stat -e LLC-loads,LLC-load-misses ./build/parallel_pthread 500000000 5 2 2>> pthread_LLC_results 
perf stat -e LLC-loads,LLC-load-misses ./build/parallel_pthread 500000000 5 4 2>> pthread_LLC_results 
perf stat -e LLC-loads,LLC-load-misses ./build/parallel_pthread 500000000 5 8 2>> pthread_LLC_results 
