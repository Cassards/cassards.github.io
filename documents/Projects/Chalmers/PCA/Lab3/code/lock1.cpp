#include <iostream>
#include <stdlib.h>
#include <iostream>
#include <unistd.h>
#include <thread>
#include <stdint.h>
#include <mutex> 


using namespace std;


// ============================================================================
// our lock implementation
class eda283_lock{
	
public:
	
	mutex my_mutex;
	
	void lock(){
		my_mutex.lock();
	}
	
	void unlock(){
		
		my_mutex.unlock();
	}

};

// shared variable that all threads modify
uint64_t shared_var = 0;

// lock for shared variable
eda283_lock mylock;


// this is the barrier we will use to synchronize our threads
pthread_barrier_t  barrier;

// ============================================================================
// This is the function that each thread will execute
void thread_func(int thread_num, uint64_t reps){
	
	
	// wait at the barrier for all threads to start at the "same" time
	pthread_barrier_wait(&barrier);

	// work loop
	for(uint64_t i = 0; i < reps; ++i){
		mylock.lock();
		shared_var++;
		mylock.unlock();
	}
}

// ============================================================================
int main(int argc, char** argv){
	
	if(argc != 3){
		cout<<argc<<endl;
		cout<<"Usage: "<<argv[0]<<" NUM_THREADS \"final value\""<<endl;
		return -1;
	}
	
	unsigned int num_threads = atoi(argv[1]);
	unsigned int final_value = atoi(argv[2]);
	unsigned int work_per_thread = final_value/num_threads;
	
	
	
	cout<<"Running: "<<argv[0]<<" NUM_THREADS: "<<num_threads<<", final value: "<<final_value<<endl;
	
	
	// initialize the barrier to wait for num_threads threads
	pthread_barrier_init (&barrier, NULL, num_threads);
	
	// an array of the thread objects we are going to create
	thread threads[num_threads];
	
	
	// the loop in which we create the threads
	for(uint64_t i = 0; i < num_threads; ++i){
		
		// creating a thread that runs thread_func with argument "i", "reps"
		threads[i] = thread(thread_func, i, work_per_thread);
	}
	
	// here we wait for all the threads to finish
	for(uint64_t i = 0; i < num_threads; ++i){
		// wait for thread #i to finish
		threads[i].join();
	}
	
	cout<<"Run finished, Shared_var: "<<shared_var<<endl;
	
	if(shared_var == final_value){
		cout<<"Result is CORRECT"<<endl;
	}
	else{
		cout<<"Result is WRONG"<<endl;
	}
	
	
}