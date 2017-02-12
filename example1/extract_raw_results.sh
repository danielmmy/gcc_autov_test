#!/bin/bash
size=8192
if [ "$#" -eq 1 ];then
        size="$1"
fi

dir="results"
executions=30
compilers=("gcc-5" "gcc-6" "gcc-4.8" "clang")
flags=("-O0" "-O1" "-O2" "-O3" "-funroll-all-loops")
for i in "${compilers[@]}"
do
for j in "${flags[@]}"
do
	#Variables set up
	result_file="./"$dir"/result_"$i"_auto_"$j".txt"
	#result processing
	echo "Avarage wall clock time" >> $result_file
	cat $result_file | grep Wall | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
	echo "CPU clock" >> $result_file
	cat $result_file | grep "CPU clock" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
	echo "Task clock" >> $result_file
	cat $result_file | grep "Task clock" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
	echo "Instructions" >> $result_file 
	cat $result_file | grep "Instructions" | cut -d= -f 2 >> $result_file
	echo "Cycles" >> $result_file 
	cat $result_file | grep "Cycles" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
	echo "Cache references" >> $result_file 
	cat $result_file | grep "Cache references" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
	echo "Cache misses" >> $result_file
	cat $result_file | grep "Cache misses" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file

        #Variables set up
	result_file="./"$dir"/result_"$i"_intr_"$j".txt"
	executable_file="./bin/example1_"$i"_intr_"$j
	source_file="example1_intr.c"
	assembly_file="./bin/example1_"$i"_intr_"$j".s"
	compilation_flags="-w "$j
	message="Intrinsic vectorization with "$i" with "$j
	#result processing
        echo "Avarage wall clock time" >> $result_file
        cat $result_file | grep Wall | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "CPU clock" >> $result_file
        cat $result_file | grep "CPU clock" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "Task clock" >> $result_file
        cat $result_file | grep "Task clock" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "Instructions" >> $result_file 
        cat $result_file | grep "Instructions" | cut -d= -f 2 >> $result_file
        echo "Cycles" >> $result_file
        cat $result_file | grep "Cycles" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "Cache references" >> $result_file 
        cat $result_file | grep "Cache references" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "Cache misses" >> $result_file
        cat $result_file | grep "Cache misses" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
 
	#Variables set up
	result_file="./"$dir"/result_"$i"_intr_fixed_reg_"$j".txt"
	executable_file="./bin/example1_"$i"_intr_fixed_reg_"$j
	source_file="example1_intr_fixed_reg.c"
	assembly_file="./bin/example1_"$i"_intr_fixed_reg_"$j".s"
	compilation_flags="-w "$j
	message="Instrinsic vectorization with fixed registers with "$i" with "$j
	#result processing
	echo "Avarage wall clock time" >> $result_file
        cat $result_file | grep Wall | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "CPU clock" >> $result_file
        cat $result_file | grep "CPU clock" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "Task clock" >> $result_file
        cat $result_file | grep "Task clock" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "Instructions" >> $result_file 
        cat $result_file | grep "Instructions" | cut -d= -f 2 >> $result_file
        echo "Cycles" >> $result_file
        cat $result_file | grep "Cycles" | cut -d= -f 2 | cut -d" " -f 2  >> $result_file
        echo "Cache references" >> $result_file 
        cat $result_file | grep "Cache references" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "Cache misses" >> $result_file
        cat $result_file | grep "Cache misses" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file

	#Variables set up
	result_file="./"$dir"/result_"$i"_intr_loop_unroll_"$j".txt"
	executable_file="./bin/example1_"$i"_intr_loop_unroll_"$j
	source_file="example1_intr_loop_unroll.c"
	assembly_file="./bin/example1_"$i"_intr_loop_unroll_"$j".s"
	compilation_flags="-w "$j
	message="Intrinsic vectorization with loop unroll with "$i"  with "$j
        echo "Avarage wall clock time" >> $result_file
        cat $result_file | grep Wall | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "CPU clock" >> $result_file
        cat $result_file | grep "CPU clock" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "Task clock" >> $result_file
        cat $result_file | grep "Task clock" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "Instructions" >> $result_file
        cat $result_file | grep "Instructions" | cut -d= -f 2 >> $result_file
        echo "Cycles" >> $result_file
        cat $result_file | grep "Cycles" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "Cache references" >> $result_file
        cat $result_file | grep "Cache references" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file
        echo "Cache misses" >> $result_file
        cat $result_file | grep "Cache misses" | cut -d= -f 2 | cut -d" " -f 2 >> $result_file

done
done
