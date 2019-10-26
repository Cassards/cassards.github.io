#include <stdio.h>
#include<stdlib.h>
#include <omp.h>

int main (int argc, char *argv[]){
	
	if(argc != 2){
		printf("usage: %s [num threads] \n",argv[0]);
		return 0;
	}
	
	int i,a = 0;
	int num_threads = atoi(argv[1]);
	printf("num threads: %d\n",num_threads);
	
	omp_set_num_threads(num_threads);
	
	#pragma omp parallel for
	for(i = 0; i < 1000; ++i){
		a++;
	}
	printf("a is %d\n",a);
}