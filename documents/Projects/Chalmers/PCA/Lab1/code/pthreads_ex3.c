#include <pthread.h>
#include <stdio.h>
#define NUM_THREADS 4

struct thread_data{
	int  id;
	int value;
};

void *thread_func(void *arg){
	struct thread_data *my_data;
	my_data = (struct thread_data*) arg;
	printf("Hello World! this is a thread #%d and value is: %d\n",my_data->id, my_data->value);
	pthread_exit(NULL);
}

int main (int argc, char *argv[]){
	
	int i = 0;
	struct thread_data data[NUM_THREADS];
	
	printf("Hello World! this is main\n");
	
	for(i = 0; i < NUM_THREADS; ++i){
		data[i].id = i;
		data[i].value = i*10;
	}
	
	pthread_t thread_handler[NUM_THREADS];
	
	for(i = 0; i < NUM_THREADS; ++i){
		pthread_create(&thread_handler[i], NULL, thread_func, (void*)&data[i]);
	}
	pthread_exit(NULL);
}