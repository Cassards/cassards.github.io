#include <pthread.h>
#include <stdio.h>

void *thread_func(void *arg){
	long int id = (long int) arg;
	printf("Hello World! this is a thread #%lu\n",id);
	pthread_exit(NULL);
}

int main (int argc, char *argv[]){
	
	long int id = 1;
	printf("Hello World! this is main\n");
	pthread_t thread_handler;
	pthread_create(&thread_handler, NULL, thread_func, (void*)id);
	pthread_exit(NULL);
}