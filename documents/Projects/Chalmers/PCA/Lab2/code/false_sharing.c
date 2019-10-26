///////////////////////////////////////////////////////////////////////////////
//
///////////////////////////////////////////////////////////////////////////////


#include <iostream>
#include <thread>
#include <mutex> 
#include <stdint.h>

#define NUM_THREADS 4
#define REPS 500000000

// uncomment this line to enable padding
// #define PADDING_ENABLED

using namespace std;

struct data{
	uint64_t value;
#ifdef PADDING_ENABLED
	uint8_t padding[64-sizeof(uint64_t)];
#endif
};

struct data thread_data[NUM_THREADS];

// ============================================================================
// This is the function that each thread will execute
void thread_func(int thread_num){
	
	for(uint64_t i = 0; i < REPS; ++i){
		thread_data[thread_num].value++;
		
	}	
}

// ============================================================================
// Main function
int main(){
	
	// an array of the thread objects we are going to create
	thread threads[NUM_THREADS];
	
#ifdef PADDING
	cout<<"Padding enabled"<<endl;
#else
	cout<<"Padding disabled"<<endl;
#endif
	cout<<"Size of data struct: "<<sizeof(struct data)<<endl<<endl;
	
	// initialize data
	for(uint64_t i = 0; i < NUM_THREADS; ++i){
		thread_data[1].value = 0;
	}
	
	// the loop in which we create the threads
	for(uint64_t i = 0; i < NUM_THREADS; ++i){
		// creating a thread that runs thread_func with argument "i"
		threads[i] = thread(thread_func, i);
	}
	
	// here we wait for all the threads to finish
	for(uint64_t i = 0; i < NUM_THREADS; ++i){
		// wait for thread #i to finish
		threads[i].join();
	}
	
	uint64_t thread_sums = 0;
	for(uint64_t i = 0; i < NUM_THREADS; ++i){
		cout<<"Thread #"<<i<<" data value="<<thread_data[i].value<<endl;
	}

}
