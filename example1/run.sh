#!/bin/bash
size=256
if [ "$#" -eq 1 ];then
        size="$1"
fi

mkdir ./bin
mkdir ./results

compilers=("gcc-5" "gcc-6")
flags=("-O0" "-O1" "-O2" "-O3" "-funroll-all-loops")
for i in "${compilers[@]}"
do
for j in "${flags[@]}"
do
	result_file="./results/result_"$i"_auto_"$j".txt"
	executable_file="./bin/example1_"$i"_auto_"$j
	source_file="example1_auto.c"
	assembly_file="./bin/example1_"$i"_auto_"$j".s"
	compilation_flags="-w "$j
	message="Auto vectorization with "$i" with "$j
	date > $result_file
	echo $message >> $result_file
	echo `$i --version` >> $result_file
	$i $source_file $compilation_flags -o $executable_file
	$i $source_file $compilation_flags -S -o $assembly_file
	$executable_file $size >> $result_file

	result_file="./results/result_"$i"_intr_"$j".txt"
	executable_file="./bin/example1_"$i"_intr_"$j
	source_file="example1_intr.c"
	assembly_file="./bin/example1_"$i"_intr_"$j".s"
	compilation_flags="-w "$j
	message="Intrinsic vectorization with "$i" with "$j
	date > $result_file
	echo $message >> $result_file
	echo `$i --version` >> $result_file
	$i $source_file $compilation_flags -o $executable_file
	$i $source_file $compilation_flags -S -o $assembly_file
	$executable_file $size >> $result_file


	result_file="./results/result_"$i"_intr_fixed_reg_"$j".txt"
	executable_file="./bin/example1_"$i"_intr_fixed_reg_"$j
	source_file="example1_intr_fixed_reg.c"
	assembly_file="./bin/example1_"$i"_intr_fixed_reg_"$j".s"
	compilation_flags="-w "$j
	message="Instrinsic vectorization with fixed registers with "$i" with "$j
	date > $result_file
	echo $message >> $result_file
	echo `$i --version` >> $result_file
	$i $source_file $compilation_flags -o $executable_file
	$i $source_file $compilation_flags -S -o $assembly_file
	$executable_file >> $result_file

	result_file="./results/result_"$i"_intr_loop_unroll_"$j".txt"
	executable_file="./bin/example1_"$i"_intr_loop_unroll_"$j
	source_file="example1_intr_loop_unroll.c"
	assembly_file="./bin/example1_"$i"_intr_loop_unroll_"$j".s"
	compilation_flags="-w "$j
	message="Intrinsic vectorization with loop unroll with "$i"  with "$j
	date > $result_file
	echo $message >> $result_file
	echo `$i --version` >> $result_file
	$i $source_file $compilation_flags -o $executable_file
	$i $source_file $compilation_flags -S -o $assembly_file	
	$executable_file >> $result_file
done
done
