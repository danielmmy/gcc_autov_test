/*
Examples extracted from the auto vectorization projects at https://gcc.gnu.org/projects/tree-ssa/vectorization.html#vectorizab.

Examples have been modified to avoid optimizations levels skiping computation
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/time.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <asm/unistd.h>
#include <linux/perf_event.h>

enum events{
        INSTRUCTIONS,
        CYCLES,
        CACHE_REFERENCES,
        CACHE_MISSES,
        SW_CPU_CLOCK,
        SW_TASK_CLOCK,
        EVENTS_COUNT
}EVENTS;


typedef int v4si __attribute__ ((vector_size (16))); // vector of four int


/*Open perf event.
pid->if 0 measures current process, if -1 measures all process;
cpu->-1 to measure on all cpus;
group_fd->allows for more than one event to measured by a single syscall, -1 to open a single event
*/
long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, long unsigned flags){
        return syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
}


/*
Scales the result obtained by the ratio enabled(time actually measuring)/running(time of the execution)
*/
static inline long long unsigned perf_count(long long unsigned *values) {
//        printf("count:%llu\nenabled:%llu\nrunning:%llu\n",values[0],values[1],values[2]);
        return (long long unsigned)((float)values[0]*(float)values[1]/(float)values[2]);
}


typedef union vector{
        v4si v;
        int i[4];
}VECTOR;



int main(int argc, char **argv){
	long long unsigned size;
        char *cpt;
        if(argc!=2){
                size=256;
        }else{
                size=strtol(argv[1],&cpt,10);
        }
	if(size%4){	
		printf("error: problem size must be divisible by 4\nsize:%llu",size);
		exit(0);
	}
	long long unsigned vector_size=size/4;

	VECTOR a[vector_size], b[vector_size], c[vector_size];
	long long unsigned i,j;

	srand(time(NULL));

	for(i=0;i<4;++i){
		for(j=0;j<vector_size;++j){
			b[i].i[j]=rand()%5;
			c[i].i[j]=rand()%5;
		}
	}

        //measure clock wall time
        struct timeval start_time, stop_time;

	//Gets the results from counter
        long long unsigned counts[3];
        //Definig perf event attributes
        struct perf_event_attr attr;
        memset(&attr, 0, sizeof(attr));
        attr.type = PERF_TYPE_HARDWARE;
        attr.size = sizeof(struct perf_event_attr);
        attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED | PERF_FORMAT_TOTAL_TIME_RUNNING;
        attr.config = PERF_COUNT_HW_INSTRUCTIONS;
        attr.disabled = 1;
        attr.exclude_kernel = 1;//Only read user space
        attr.exclude_hv = 1;//ONly read user space

        //File descriptor for events
        int fd[EVENTS_COUNT];
        fd[INSTRUCTIONS]=perf_event_open(&attr, 0, -1, -1, 0);
        if (fd[INSTRUCTIONS] == -1){
                printf("cannot open perf_counter for instructions\n");
                exit(0);
        }
        attr.type = PERF_TYPE_HARDWARE;
        attr.config = PERF_COUNT_HW_CPU_CYCLES;
        fd[CYCLES]=perf_event_open(&attr, 0, -1, -1, 0);
        if (fd[CYCLES] == -1){
                printf("cannot open perf_counter for cycles\n");
                exit(0);
        }
#if 0
        attr.type = PERF_TYPE_RAW;
        attr.config=0x10;
        fd[BRANCHES_MISSPREDICTED]=perf_event_open(&attr, 0, -1, -1, 0);
        if (fd[BRANCHES_MISSPREDICTED] == -1){
                printf("cannot open perf_counter for BRANCHES_MISSPREDICTED\n");
                exit(0);
        }
#endif
        attr.type = PERF_TYPE_HARDWARE;
        attr.config = PERF_COUNT_HW_CACHE_REFERENCES;
        fd[CACHE_REFERENCES]=perf_event_open(&attr, 0, -1, -1, 0);
        if (fd[CACHE_REFERENCES] == -1){
                printf("cannot open perf_counter for cache references\n");
                exit(0);
        }
        attr.type = PERF_TYPE_HARDWARE;
        attr.config = PERF_COUNT_HW_CACHE_MISSES;
        fd[CACHE_MISSES]=perf_event_open(&attr, 0, -1, -1, 0);
        if (fd[CACHE_MISSES] == -1){
                printf("cannot open perf_counter for cache references\n");
                exit(0);
        }
        attr.type = PERF_TYPE_SOFTWARE;
        attr.config = PERF_COUNT_SW_CPU_CLOCK;
        fd[SW_CPU_CLOCK]=perf_event_open(&attr, 0, -1, -1, 0);
        if (fd[SW_CPU_CLOCK] == -1){
                printf("cannot open perf_counter for software CPU clock\n");
                exit(0);
        }
        attr.type = PERF_TYPE_SOFTWARE;
        attr.config = PERF_COUNT_SW_TASK_CLOCK;
        fd[SW_TASK_CLOCK]=perf_event_open(&attr, 0, -1, -1, 0);
        if (fd[SW_TASK_CLOCK] == -1){
                printf("cannot open perf_counter for software task clock\n");
                exit(0);
        }

        //Resets counter
        for(i=0;i<EVENTS_COUNT;++i)
                ioctl(fd[i], PERF_EVENT_IOC_RESET,0);
        //Enable counter
        for(i=0;i<EVENTS_COUNT;++i)
                ioctl(fd[i], PERF_EVENT_IOC_ENABLE,0);
        //wall clock start
        gettimeofday(&start_time,0);
        //Compute
       	for (i=0; i<vector_size; i++)
		a[i].v = b[i].v + c[i].v;
        //Stops counter
        for(i=0;i<EVENTS_COUNT;++i)
                ioctl(fd[i], PERF_EVENT_IOC_DISABLE, 0);
        //Wall clock stop
        gettimeofday(&stop_time,0);

	long long unsigned result=0;
        for(i=0;i<4;++i){
                for(j=0;j<vector_size;++j){
                        result+=a[i].i[j];
                }
        }
        printf("Result: %llu\n",result);


        //prints time
        unsigned long long us=0;
        us=(stop_time.tv_sec-start_time.tv_sec)*1000000;
        us+=stop_time.tv_usec-start_time.tv_usec;
        printf("Wall clock time[gettimeofday(2)]: %lluus\n",us);
        //prints counters
        printf("PMU statistics:\n");
        read(fd[SW_CPU_CLOCK], counts, sizeof(counts));
        printf("CPU clock = %lluns %s.\n",perf_count(counts),counts[1]==counts[2]?"real":"scaled");
        read(fd[SW_TASK_CLOCK], counts, sizeof(counts));
        printf("Task clock = %lluns %s.\n",perf_count(counts),counts[1]==counts[2]?"real":"scaled");
        read(fd[INSTRUCTIONS], counts, sizeof(counts));
        printf("Instructions = %llu %s.\n",perf_count(counts),counts[1]==counts[2]?"real":"scaled");
        read(fd[CYCLES], counts, sizeof(counts));
        printf("Cycles = %llu %s.\n",perf_count(counts),counts[1]==counts[2]?"real":"scaled");
        read(fd[CACHE_REFERENCES], counts, sizeof(counts));
        printf("Cache references = %llu %s.\n",perf_count(counts),counts[1]==counts[2]?"real":"scaled");
        read(fd[CACHE_MISSES], counts, sizeof(counts));
        printf("Cache misses = %llu %s.\n",perf_count(counts),counts[1]==counts[2]?"real":"scaled");

}
