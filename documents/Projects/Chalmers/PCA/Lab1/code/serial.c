
#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>

void init_array(uint64_t * array, uint64_t array_size){
	uint64_t i;
	for(i = 0; i < array_size; ++i){
		array[i] = i+1;
	}
}

uint64_t sum_array(uint64_t * array, uint64_t start_index, uint64_t end_index, uint64_t times){
	
	uint64_t i,t;
	uint64_t sum = 0;
	
	for(t = 0; t < times; ++t){
		for(i = start_index; i < end_index; ++i){
			sum += array[i];
		}
	}
	return sum;
}

void check_sum(uint64_t array_size, uint64_t times, uint64_t sum){
	

	uint64_t real_sum = times*((array_size*(array_size +1))/2);
	
	if(real_sum == sum){
		printf("Array sum is correct (%ld)\n",sum);
	}
	else{
		printf("Array sum is NOT correct (%ld), should have been: %ld\n",sum, real_sum);
	}
}

int main (int argc, char *argv[]){
	
	uint64_t array_size = 0;
	uint64_t times = 0;
	uint64_t * array;
	
	if(argc != 3){
		printf("usage: %s [array size] [times]\n",argv[0]);
		return 0;
	}
	
	array_size = atoi(argv[1]);
	times = atoi(argv[2]);
	
	printf("Array size: %lu\n",array_size);
	printf("Sum times: %lu\n",times);
	
	array = malloc(array_size* sizeof(uint64_t ));
	if(array == NULL){
		printf("Could not allocate Array... bye bye!\n");
		return 0;
	}
	
	init_array(array, array_size);
	
	uint64_t sum = sum_array(array, 0, array_size, times);
	
	printf("sum is %ld\n",sum);
	
	check_sum(array_size, times, sum);
}