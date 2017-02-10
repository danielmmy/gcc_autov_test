#!/bin/sh
size=256
if [ "$#" -eq 1 ];then
        size="$1"
fi
############################################_O0_###########################################
result_file="./results/result_gcc5_auto_O0.txt"
executable_file="./bin/example1_gcc5_auto_O0"
source_file="example1_auto.c"
assembly_file="./bin/example1_gcc5_auto_O0.s"
compilation_flags="-w -O0"
message="Auto vectorization with gcc 5.4 with O0"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file $size >> $result_file

result_file="./results/result_gcc5_intr_O0.txt"
executable_file="./bin/example1_gcc5_intr_O0"
source_file="example1_intr.c"
assembly_file="./bin/example1_gcc5_intr_O0.s"
compilation_flags="-w -O0"
message="Intrinsic vectorization with gcc 5.4 with O0"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file $size >> $result_file


result_file="./results/result_gcc5_intr_fixed_reg_O0.txt"
executable_file="./bin/example1_gcc5_intr_fixed_reg_O0"
source_file="example1_intr_fixed_reg.c"
assembly_file="./bin/example1_gcc5_intr_fixed_reg_O0.s"
compilation_flags="-w -O0"
message="Instrinsic vectorization with fixed registers with gcc5.4 with O0"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file

result_file="./results/result_gcc5_intr_loop_unroll_O0.txt"
executable_file="./bin/example1_gcc5_intr_loop_unroll_O0"
source_file="example1_intr_loop_unroll.c"
assembly_file="./bin/example1_gcc5_intr_loop_unroll_O0.s"
compilation_flags="-w -O0"
message="Intrinsic vectorization with loop unroll with gcc 5.4 with O0"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file
############################################_O1_###########################################
ult_file="./results/result_gcc5_auto_O1.txt"
executable_file="./bin/example1_gcc5_auto_O1"
source_file="example1_auto.c"
assembly_file="./bin/example1_gcc5_auto_O1.s"
compilation_flags="-w -O1"
message="Auto vectorization with gcc 5.4 with O1"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file

result_file="./results/result_gcc5_intr_O1.txt"
executable_file="./bin/example1_gcc5_intr_O1"
source_file="example1_intr.c"
assembly_file="./bin/example1_gcc5_intr_O1.s"
compilation_flags="-w -O1"
message="Intrinsic vectorization with gcc 5.4 with O1"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file


result_file="./results/result_gcc5_intr_fixed_reg_O1.txt"
executable_file="./bin/example1_gcc5_intr_fixed_reg_O1"
source_file="example1_intr_fixed_reg.c"
assembly_file="./bin/example1_gcc5_intr_fixed_reg_O1.s"
compilation_flags="-w -O1"
message="Intrinsic vectorization with fixed registers gcc 5.4 with O1"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file

result_file="./results/result_gcc5_intr_loop_unroll_O1.txt"
executable_file="./bin/example1_gcc5_intr_loop_unroll_O1"
source_file="example1_intr_loop_unroll.c"
assembly_file="./bin/example1_gcc5_intr_loop_unroll_O1.s"
compilation_flags="-w -O1"
message="Intrinsic vectorization with loop unroll with gcc 5.4 with O1"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file
############################################_O2_###########################################
result_file="./results/result_gcc5_auto_O2.txt"
executable_file="./bin/example1_gcc5_auto_O2"
source_file="example1_auto.c"
assembly_file="./bin/example1_gcc5_auto_O2.s"
compilation_flags="-w -O2"
message="Auto vectorization with gcc 5.4 with O2"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file

result_file="./results/result_gcc5_intr_O2.txt"
executable_file="./bin/example1_gcc5_intr_O2"
source_file="example1_intr.c"
assembly_file="./bin/example1_gcc5_intr_O2.s"
compilation_flags="-w -O2"
message="Intrinsic vectorization with gcc 5.4 with O2"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file


result_file="./results/result_gcc5_intr_fixed_reg_O2.txt"
executable_file="./bin/example1_gcc5_intr_fixed_reg_O2"
source_file="example1_intr_fixed_reg.c"
assembly_file="./bin/example1_gcc5_intr_fixed_reg_O2.s"
compilation_flags="-w -O2"
message="Instrinsic vectorization with fixed registers with gcc5.4 with O2"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file

result_file="./results/result_gcc5_intr_loop_unroll_O2.txt"
executable_file="./bin/example1_gcc5_intr_loop_unroll_O2"
source_file="example1_intr_loop_unroll.c"
assembly_file="./bin/example1_gcc5_intr_loop_unroll_O2.s"
compilation_flags="-w -O2"
message="Intrinsic vectorization with loop unroll with gcc 5.4 with O2"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file
############################################_O3_###########################################
result_file="./results/result_gcc5_auto_O3.txt"
executable_file="./bin/example1_gcc5_auto_O3"
source_file="example1_auto.c"
assembly_file="./bin/example1_gcc5_auto_O3.s"
compilation_flags="-w -O3"
message="Auto vectorization with gcc 5.4 with O3"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file

result_file="./results/result_gcc5_intr_O3.txt"
executable_file="./bin/example1_gcc5_intr_O3"
source_file="example1_intr.c"
assembly_file="./bin/example1_gcc5_intr_O3.s"
compilation_flags="-w -O3"
message="Intrinsic vectorization with gcc 5.4 with O3"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file


result_file="./results/result_gcc5_intr_fixed_reg_O3.txt"
executable_file="./bin/example1_gcc5_intr_fixed_reg_O3"
source_file="example1_intr_fixed_reg.c"
assembly_file="./bin/example1_gcc5_intr_fixed_reg_O3.s"
compilation_flags="-w -O3"
message="Instrinsic vectorization with fixed registers with gcc5.4 with O3"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file

result_file="./results/result_gcc5_intr_loop_unroll_O3.txt"
executable_file="./bin/example1_gcc5_intr_loop_unroll_O3"
source_file="example1_intr_loop_unroll.c"
assembly_file="./bin/example1_gcc5_intr_loop_unroll_O3.s"
compilation_flags="-w -O3"
message="Intrinsic vectorization with loop unroll with gcc 5.4 with O3"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file
############################################_-funroll-all-loops_###########################################
result_file="./results/result_gcc5_auto_funroll-all-loops.txt"
executable_file="./bin/example1_gcc5_auto_funroll-all-loops"
source_file="example1_auto.c"
assembly_file="./bin/example1_gcc5_auto_funroll-all-loops.s"
compilation_flags="-w -funroll-all-loops"
message="Auto vectorization with gcc 5.4 with funroll-all-loops"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file

result_file="./results/result_gcc5_intr_funroll-all-loops.txt"
executable_file="./bin/example1_gcc5_intr_funroll-all-loops"
source_file="example1_intr.c"
assembly_file="./bin/example1_gcc5_intr_funroll-all-loops.s"
compilation_flags="-w -funroll-all-loops"
message="Intrinsic vectorization with gcc 5.4 with funroll-all-loops"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file


result_file="./results/result_gcc5_intr_fixed_reg_funroll-all-loops.txt"
executable_file="./bin/example1_gcc5_intr_fixed_reg_funroll-all-loops"
source_file="example1_intr_fixed_reg.c"
assembly_file="./bin/example1_gcc5_intr_fixed_reg_funroll-all-loops.s"
compilation_flags="-w -funroll-all-loops"
message="Instrinsic vectorization with fixed registers with gcc5.4 with funroll-all-loops"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file

result_file="./results/result_gcc5_intr_loop_unroll_funroll-all-loops.txt"
executable_file="./bin/example1_gcc5_intr_loop_unroll_funroll-all-loops"
source_file="example1_intr_loop_unroll.c"
assembly_file="./bin/example1_gcc5_intr_loop_unroll_funroll-all-loops.s"
compilation_flags="-w -funroll-all-loops"
message="Intrinsic vectorization with loop unroll with gcc 5.4 with funroll-all-loops"
date > $result_file
echo $message >> $result_file
gcc $source_file $compilation_flags -o $executable_file
gcc $source_file $compilation_flags -S -o $assembly_file
$executable_file >> $result_file

