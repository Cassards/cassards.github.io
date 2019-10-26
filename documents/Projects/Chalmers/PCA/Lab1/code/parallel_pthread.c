#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>


struct thread_data{
    uint64_t* array;
    uint64_t start_index;
    uint64_t end_index;
    uint64_t id;
    uint64_t thread_sum;
    uint64_t times;
};


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

void *thread_func(void *arg){
	struct thread_data *my_data;
	my_data = (struct thread_data*) arg;
    
    my_data->thread_sum = sum_array(my_data->array, my_data->start_index, my_data->end_index, my_data->times);
    
    printf("---> thread %ld - %ldx[%ld -> %ld] - total : %ld\n", my_data->id
                                                                , my_data->times
                                                                , my_data->start_index
                                                                , my_data->end_index -1
                                                                , my_data->thread_sum); //TODO

    pthread_exit((void*) my_data->thread_sum);
}

int main (int argc, char *argv[]){
	
	uint64_t array_size = 0;
	uint64_t times = 0;
	uint64_t nbOfThreads = 0;
	uint64_t * array;
	
	if(argc != 4){
		printf("usage: %s [array size] [times] [nbOfThreads]\n",argv[0]);
		return 0;
	}
	
	array_size = atoi(argv[1]);
	times = atoi(argv[2]);
	nbOfThreads = atoi(argv[3]);
	
	printf("Array size: %lu\n",array_size);
	printf("Sum times: %lu\n",times);
	
    //Start of parallel stuff
    struct thread_data data[nbOfThreads];
	
	array = malloc(array_size* sizeof(uint64_t ));
	if(array == NULL){
		printf("Could not allocate Array... bye bye!\n");
		return 0;
	}
	
	init_array(array, array_size);
    uint64_t slice_size_per_thread = array_size/nbOfThreads;

    for(int i = 0; i < nbOfThreads; ++i){
        data[i].array = array;
        data[i].start_index = i*slice_size_per_thread;
        data[i].end_index = (i == nbOfThreads-1)? array_size : (i+1)*slice_size_per_thread;
        data[i].id = i; 
        data[i].thread_sum = 0; 
        data[i].times = times; 
    }
    printf("\n"); //TODO
    
	pthread_t thread_handler[nbOfThreads];
	
	for(int i = 0; i < nbOfThreads; ++i){
		pthread_create(&thread_handler[i], NULL, thread_func, (void*)&data[i]);
	}
	
	void *thread_sum;
    uint64_t sum = 0;

	for(int i = 0; i < nbOfThreads; ++i){
		pthread_join(thread_handler[i], &thread_sum);
        sum += thread_sum;
    }

	check_sum(array_size, times, sum);
}
