 #include <pthread.h>
 #include <stdio.h>

void *thread_func(void *arg){
    printf("Hello World! this is a thread\n");
    pthread_exit(NULL);
}

int main (int argc, char *argv[]){
 
 	printf("Hello World! this is main\n");
    pthread_t thread_handler;
    pthread_create(&thread_handler, NULL, thread_func, NULL);
    pthread_exit(NULL);
}