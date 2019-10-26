perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./noPadding_1thread 2>  paddingVSnoPadding
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./noPadding_2thread 2>> paddingVSnoPadding
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./noPadding_4thread 2>> paddingVSnoPadding

perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./padding_1thread 2>> paddingVSnoPadding
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./padding_2thread 2>> paddingVSnoPadding
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./padding_4thread 2>> paddingVSnoPadding

perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./padding32_1thread 2>> paddingVSnoPadding
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./padding32_2thread 2>> paddingVSnoPadding
perf stat -e instructions,L1-dcache-loads,L1-dcache-load-misses ./padding32_4thread 2>> paddingVSnoPadding
