#!/bin/bash
size=8192
if [ "$#" -eq 1 ];then
        size="$1"
fi

mkdir ./bin
mkdir ./results

executions=30
compilers=("gcc-5" "gcc-6" "gcc-4.8" "clang")
flags=("-O0" "-O1" "-O2" "-O3" "-funroll-all-loops")
for i in "${compilers[@]}"
do
for j in "${flags[@]}"
do
	#Variables set up
	result_file="./results/result_"$i"_auto_"$j".txt"
	executable_file="./bin/example1_"$i"_auto_"$j
	source_file="example1_auto.c"
	assembly_file="./bin/example1_"$i"_auto_"$j".s"
	compilation_flags="-w "$j
	message="Auto vectorization with "$i" with "$j
	date > $result_file
	echo $message >> $result_file
	echo `$i --version` >> $result_file
	#compilations
	$i $source_file $compilation_flags -o $executable_file
	$i $source_file $compilation_flags -S -o $assembly_file
	#execution
	for (( k=0; k<$executions ;k++ ))
	do
		$executable_file $size >> $result_file
	done
	#result processing
	echo "###################Run Average###################" >>  $result_file
	echo "Avarage wall clock time = "`cat $result_file | grep Wall | cut -d= -f 2 | cut -d" " -f 2  | awk '{total = total + $1}END{print total}' | awk -v execs="$executions" '{total= $1 / execs}END{printf("%f",total)}'`" us" >> $result_file
	echo "CPU clock = "`cat $result_file | grep "CPU clock" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'`" ns" >> $result_file
	echo "Task clock = "`cat $result_file | grep "Task clock" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'`" ns" >> $result_file
	echo "Instructions = "`cat $result_file | grep "Instructions" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file
	echo "Cycles = "`cat $result_file | grep "Cycles" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file
	echo "Cache references = "`cat $result_file | grep "Cache references" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file
	echo "Cache misses = "`cat $result_file | grep "Cache misses" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file

        #Variables set up
	result_file="./results/result_"$i"_intr_"$j".txt"
	executable_file="./bin/example1_"$i"_intr_"$j
	source_file="example1_intr.c"
	assembly_file="./bin/example1_"$i"_intr_"$j".s"
	compilation_flags="-w "$j
	message="Intrinsic vectorization with "$i" with "$j
	date > $result_file
	echo $message >> $result_file
	echo `$i --version` >> $result_file
	#compilation
	$i $source_file $compilation_flags -o $executable_file
	$i $source_file $compilation_flags -S -o $assembly_file
	#execution
	for k in {1..30}
	do
		$executable_file $size >> $result_file
	done
	#result processing
        echo "###################Run Average###################" >>  $result_file
        echo "Avarage wall clock time = "`cat $result_file | grep Wall | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v execs="$executions" '{total= $1 / execs}END{printf("%f",total)}'`" us" >> $result_file
        echo "CPU clock = "`cat $result_file | grep "CPU clock" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'`" ns" >> $result_file
        echo "Task clock = "`cat $result_file | grep "Task clock" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'`" ns" >> $result_file
        echo "Instructions = "`cat $result_file | grep "Instructions" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file
        echo "Cycles = "`cat $result_file | grep "Cycles" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file
        echo "Cache references = "`cat $result_file | grep "Cache references" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file
        echo "Cache misses = "`cat $result_file | grep "Cache misses" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file

	#Variables set up
	result_file="./results/result_"$i"_intr_fixed_reg_"$j".txt"
	executable_file="./bin/example1_"$i"_intr_fixed_reg_"$j
	source_file="example1_intr_fixed_reg.c"
	assembly_file="./bin/example1_"$i"_intr_fixed_reg_"$j".s"
	compilation_flags="-w "$j
	message="Instrinsic vectorization with fixed registers with "$i" with "$j
	date > $result_file
	echo $message >> $result_file
	echo `$i --version` >> $result_file
	#compilation
	$i $source_file $compilation_flags -o $executable_file
	$i $source_file $compilation_flags -S -o $assembly_file
	#execution
	for k in {1..30}
	do
		$executable_file >> $result_file
	done
	#result processing
        echo "###################Run Average###################" >>  $result_file
        echo "Avarage wall clock time = "`cat $result_file | grep Wall | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v execs="$executions" '{total= $1 / execs}END{printf("%f",total)}'`" us" >> $result_file
        echo "CPU clock = "`cat $result_file | grep "CPU clock" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'`" ns" >> $result_file
        echo "Task clock = "`cat $result_file | grep "Task clock" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'`" ns" >> $result_file
        echo "Instructions = "`cat $result_file | grep "Instructions" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file
        echo "Cycles = "`cat $result_file | grep "Cycles" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file
        echo "Cache references = "`cat $result_file | grep "Cache references" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file
        echo "Cache misses = "`cat $result_file | grep "Cache misses" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file

	#Variables set up
	result_file="./results/result_"$i"_intr_loop_unroll_"$j".txt"
	executable_file="./bin/example1_"$i"_intr_loop_unroll_"$j
	source_file="example1_intr_loop_unroll.c"
	assembly_file="./bin/example1_"$i"_intr_loop_unroll_"$j".s"
	compilation_flags="-w "$j
	message="Intrinsic vectorization with loop unroll with "$i"  with "$j
	date > $result_file
	echo $message >> $result_file
	echo `$i --version` >> $result_file
	#compilation
	$i $source_file $compilation_flags -o $executable_file
	$i $source_file $compilation_flags -S -o $assembly_file
	#execution
	for k in {1..30}
	do
		$executable_file >> $result_file
	done
	#result processing
        echo "###################Run Average###################" >>  $result_file
        echo "Avarage wall clock time = "`cat $result_file | grep Wall | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v execs="$executions" '{total= $1 / execs}END{printf("%f",total)}'`" us" >> $result_file
        echo "CPU clock = "`cat $result_file | grep "CPU clock" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'`" ns" >> $result_file
        echo "Task clock = "`cat $result_file | grep "Task clock" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'`" ns" >> $result_file
        echo "Instructions = "`cat $result_file | grep "Instructions" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file
        echo "Cycles = "`cat $result_file | grep "Cycles" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file
        echo "Cache references = "`cat $result_file | grep "Cache references" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file
        echo "Cache misses = "`cat $result_file | grep "Cache misses" | cut -d= -f 2 | cut -d" " -f 2 | awk '{total = total + $1}END{print total}' | awk -v executions="$executions" '{total= $1 / executions}END{printf("%f",total)}'` >> $result_file

done
done
