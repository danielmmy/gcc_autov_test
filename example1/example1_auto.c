/*
Examples extracted from the auto vectorization projects at https://gcc.gnu.org/projects/tree-ssa/vectorization.html#vectorizab.

Examples have been modified to avoid optimizations levels skiping computation
*/


#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <asm/unistd.h>
#include <linux/perf_event.h>

/*Open perf event.
pid->if 0 measures current process, if -1 measures all process;
cpu->-1 to measure on all cpus;
group_fd->allows for more than one event to measured by a single syscall, -1 to open a single event
*/
long perf_event_open(struct perf_event_attr *hw_event, pid_t pid, int cpu, int group_fd, unsigned long flags){
        return syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);
}


/*
Scales the result obtained by the ratio enabled(time actually measuring)/running(time of the execution)
*/
static inline unsigned long long perf_count(unsigned long long *values) {
        printf("count:%llu\nenabled:%llu\nrunning:%llu\n",values[0],values[1],values[2]);
        return (unsigned long long)((float)values[0]*(float)values[1]/(float)values[2]);
}


int main(int argc, char **argv){
	int size;
	char *cpt;
	if(argc!=2){
		size=256;
	}else{
		size=strtol(argv[1],&cpt,10);
	}
	if(size%4){
                printf("error: problem size must be divisible by 4\nsize:%d",size);
                exit(0);
        }
	

	int a[size], b[size], c[size];
	int i;

	srand(time(NULL));

	for(i=0;i<size;++i){
		b[i]=rand()%5;
		c[i]=rand()%5;
	}


	//Gets the results from counter
        unsigned long long counts[3];
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

        //file descriptor to measure instructions count
        int fd=perf_event_open(&attr, 0, -1, -1, 0);
        if (fd == -1){
                printf("cannot open perf_counter for instructions");
                exit(0);
        }

	//Resets counter
        ioctl(fd, PERF_EVENT_IOC_RESET,0);
        ioctl(fd, PERF_EVENT_IOC_ENABLE,0);
        //Compute
	for (i=0; i<size; i++)
		a[i] = b[i] + c[i];
        //Reads counter
        ioctl(fd, PERF_EVENT_IOC_DISABLE, 0);
        read(fd, counts, sizeof(counts));

	for(i=0;i<size;++i){
		printf("%i|",a[i]);
	}
	printf("\n");

	printf("Instructions = %llu\n",perf_count(counts));
 
}
