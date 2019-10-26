#include <iostream>
#include <stdlib.h>
#include <iostream>
#include <unistd.h>
#include <thread>
#include <stdint.h>
#include <mutex> 
#include <sched.h>

using namespace std;

// ============================================================================
// our barrier implementation
class eda283_barrier{
	
public:
	
	// this is the barrier we will use to synchronize our threads
	pthread_barrier_t  barrier;
	
	// initialize the barrier to wait for num_threads threads
	void init(uint32_t num_threads){
	
		pthread_barrier_init (&this->barrier, NULL, num_threads);
	}
	
	// returns only when all threads have reached the barrier
	void wait(){
		
		pthread_barrier_wait(&this->barrier);
	}
	
};

// declare a barrier class
eda283_barrier barrier;

// ============================================================================
// This is the function that each thread will execute
void thread_func(int thread_num, uint64_t reps){
	
	// work loop
	for(uint64_t i = 0; i < reps; ++i){
		// wait at the barrier
		barrier.wait();
	}
}

// ============================================================================
int main(int argc, char** argv){
	
	if(argc != 3){
		cout<<argc<<endl;
		cout<<"Usage: "<<argv[0]<<" NUM_THREADS WORK"<<endl;
		return -1;
	}
	
	unsigned int num_threads = atoi(argv[1]);
	unsigned int barrier_times = atoi(argv[2]);
	
	
	cout<<"Running: "<<argv[0]<<" NUM_THREADS: "<<num_threads<<", Barrier will be reached : "<<barrier_times<<" times "<<endl;
	
	// initialize the barrier
	barrier.init(num_threads);
	
	// an array of the thread objects we are going to create
	thread threads[num_threads];
	
	
	// the loop in which we create the threads
	for(uint64_t i = 0; i < num_threads; ++i){
		
		// creating a thread that runs thread_func with argument "i", "reps"
		threads[i] = thread(thread_func, i, barrier_times);
	}
	
	// here we wait for all the threads to finish
	for(uint64_t i = 0; i < num_threads; ++i){
		// wait for thread #i to finish
		threads[i].join();
	}
	
	cout<<"Run finished, Barrier reached: "<<barrier_times<<" times"<<endl;

	
	
}