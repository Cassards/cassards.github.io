perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./build/false_sharing 2>  false-sharing_L1_results
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./build/false_sharing_padding-on 2>> false-sharing_L1_results 
