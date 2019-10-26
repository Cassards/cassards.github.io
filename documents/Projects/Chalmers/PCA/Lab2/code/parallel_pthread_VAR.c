
#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include <pthread.h>


void init_array(uint64_t * array, uint64_t array_size){
	uint64_t i;
	for(i = 0; i < array_size; ++i){
		array[i] = i+1;
	}
}

uint64_t sum_array(uint64_t * array, uint64_t start_index, uint64_t end_index, uint64_t times){
	
	uint64_t i,t;
	uint64_t sum = 0;
	
	for(i = start_index; i < end_index; ++i){
        for(t = 0; t < times; ++t){
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

struct thread_arg{
	uint64_t thread_id;
	uint64_t* array;
	uint64_t start_index;
	uint64_t end_index;
	uint64_t times;
};

void* thread_func(void* arg){
	
	struct thread_arg* myargs = (struct thread_arg*) arg;
	uint64_t sum = sum_array(myargs->array, myargs->start_index, myargs->end_index, myargs->times);
	
	pthread_exit((void*) sum);
}

int main (int argc, char *argv[]){
	
	int i;
	uint64_t array_size = 0;
	uint64_t times = 0;
	uint64_t num_threads = 0;
	uint64_t* array;
	
	if(argc != 4){
		printf("usage: %s [array size] [times] [num threads]\n",argv[0]);
		return 0;
	}
	
	array_size = atoi(argv[1]);
	times = atoi(argv[2]);
	num_threads = atoi(argv[3]);
	
	printf("Array size: %lu\n",array_size);
	printf("Sum times: %lu\n",times);
	printf("Num Threads: %lu\n",num_threads);
	
	array = malloc(array_size* sizeof(uint64_t ));
	if(array == NULL){
		printf("Could not allocate Array... bye bye!\n");
		return 0;
	}
	
	init_array(array, array_size);
	
	struct thread_arg* data = malloc(num_threads*sizeof(struct thread_arg));
	
	for(i = 0; i < num_threads; ++i){
		data[i].thread_id = i;
		data[i].array = array;
		data[i].start_index = i*(array_size/num_threads);
		data[i].end_index =  (i+1)*(array_size/num_threads);
		data[i].times = times;
	}
	
	pthread_t* thread_handlers = malloc(num_threads*sizeof(pthread_t));
	
	for(i = 0; i < num_threads; ++i){
		pthread_create(&thread_handlers[i], NULL, thread_func, (void*)&data[i]);
	}
	
	uint64_t total_sum = 0;
	void *status;
	
	for(i = 0; i < num_threads; ++i){
		pthread_join(thread_handlers[i], &status);
		printf("Main: completed join with thread %d having a status of %ld\n",i,(uint64_t)status);
		total_sum = total_sum + (uint64_t) status;
	}
	
	check_sum( array_size, times, total_sum);
}
