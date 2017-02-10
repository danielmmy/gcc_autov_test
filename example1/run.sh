#!/bin/sh
############################################_O0_###########################################
date > ./results/result_gcc5_auto_O0.txt
echo "Auto vectorization with gcc 5.4 with O0" >> ./results/result_gcc5_auto_O0.txt
gcc example1_auto.c -w -O0 -o ./results/example1_gcc5_auto_O0
gcc example1_auto.c -w -O0 -S -o ./results/example1_gcc5_auto_O0.s
./results/example1_gcc5_auto_O0 >> ./results/result_gcc5_auto_O0.txt

date > ./results/result_gcc5_intr_O0.txt
echo "Intrinsics vectorization with gcc 5.4 with O0" >> ./results/result_gcc5_intr_O0.txt
gcc example1_intr.c -w -O0 -o ./results/example1_gcc5_intr_O0
gcc example1_intr.c -w -O0 -S -o ./results/example1_gcc5_intr_O0.s
./results/example1_gcc5_intr_O0 >> ./results/result_gcc5_intr_O0.txt

date > ./results/result_gcc5_intr_fixed_reg_O0.txt
echo "Auto vectorization with gcc 5.4 with O0" >> ./results/result_gcc5_intr_fixed_reg_O0.txt
gcc example1_intr_fixed_reg.c -w -O0 -o ./results/example1_intr_fixed_reg_O0
gcc example1_intr_fixed_reg.c -w -O0 -S -o ./results/example1_intr_fixed_reg_O0.s
./results/example1_intr_fixed_reg_O0 >> ./results/result_gcc5_intr_fixed_reg_O0.txt

date > ./results/result_gcc5_intr_loop_unroll_O0.txt
echo "Intrinsics vectorization with gcc 5.4 with O0" >> ./results/result_gcc5_intr_loop_unroll_O0.txt
gcc example1_intr_loop_unroll.c -w -O0 -o ./results/example1_intr_loop_unroll_O0
gcc example1_intr_loop_unroll.c -w -O0 -S -o ./results/example1_intr_loop_unroll_O0.s
./results/example1_intr_loop_unroll_O0 >> ./results/result_gcc5_intr_loop_unroll_O0.txt
############################################_O1_###########################################
date > ./results/result_gcc5_auto_O1.txt
echo "Auto vectorization with gcc 5.4 with O1" >> ./results/result_gcc5_auto_O1.txt
gcc example1_auto.c -w -O1 -o ./results/example1_gcc5_auto_O1
gcc example1_auto.c -w -O1 -S -o ./results/example1_gcc5_auto_O1.s
./results/example1_gcc5_auto_O1 >> ./results/result_gcc5_auto_O1.txt

date > ./results/result_gcc5_intr_O1.txt
echo "Intrinsics vectorization with gcc 5.4 with O1" >> ./results/result_gcc5_intr_O1.txt
gcc example1_intr.c -w -O1 -o ./results/example1_gcc5_intr_O1
gcc example1_intr.c -w -O1 -S -o ./results/example1_gcc5_intr_O1.s
./results/example1_gcc5_intr_O1 >> ./results/result_gcc5_intr_O1.txt

date > ./results/result_gcc5_intr_fixed_reg_O1.txt
echo "Auto vectorization with gcc 5.4 with O1" >> ./results/result_gcc5_intr_fixed_reg_O1.txt
gcc example1_intr_fixed_reg.c -w -O1 -o ./results/example1_intr_fixed_reg_O1
gcc example1_intr_fixed_reg.c -w -O1 -S -o ./results/example1_intr_fixed_reg_O1.s
./results/example1_intr_fixed_reg_O1 >> ./results/result_gcc5_intr_fixed_reg_O1.txt

date > ./results/result_gcc5_intr_loop_unroll_O1.txt
echo "Intrinsics vectorization with gcc 5.4 with O1" >> ./results/result_gcc5_intr_loop_unroll_O1.txt
gcc example1_intr_loop_unroll.c -w -O1 -o ./results/example1_intr_loop_unroll_O1
gcc example1_intr_loop_unroll.c -w -O1 -S -o ./results/example1_intr_loop_unroll_O1.s
./results/example1_intr_loop_unroll_O1 >> ./results/result_gcc5_intr_loop_unroll_O1.txt
############################################_O2_###########################################
date > ./results/result_gcc5_auto_O2.txt
echo "Auto vectorization with gcc 5.4 with O2" >> ./results/result_gcc5_auto_O2.txt
gcc example1_auto.c -w -O2 -o ./results/example1_gcc5_auto_O2
gcc example1_auto.c -w -O2 -S -o ./results/example1_gcc5_auto_O2.s
./results/example1_gcc5_auto_O2 >> ./results/result_gcc5_auto_O2.txt

date > ./results/result_gcc5_intr_O2.txt
echo "Intrinsics vectorization with gcc 5.4 with O2" >> ./results/result_gcc5_intr_O2.txt
gcc example1_intr.c -w -O2 -o ./results/example1_gcc5_intr_O2
gcc example1_intr.c -w -O2 -S -o ./results/example1_gcc5_intr_O2.s
./results/example1_gcc5_intr_O2 >> ./results/result_gcc5_intr_O2.txt

date > ./results/result_gcc5_intr_fixed_reg_O2.txt
echo "Auto vectorization with gcc 5.4 with O2" >> ./results/result_gcc5_intr_fixed_reg_O2.txt
gcc example1_intr_fixed_reg.c -w -O2 -o ./results/example1_intr_fixed_reg_O2
gcc example1_intr_fixed_reg.c -w -O2 -S -o ./results/example1_intr_fixed_reg_O2.s
./results/example1_intr_fixed_reg_O2 >> ./results/result_gcc5_intr_fixed_reg_O2.txt

date > ./results/result_gcc5_intr_loop_unroll_O2.txt
echo "Intrinsics vectorization with gcc 5.4 with O2" >> ./results/result_gcc5_intr_loop_unroll_O2.txt
gcc example1_intr_loop_unroll.c -w -O2 -o ./results/example1_intr_loop_unroll_O2
gcc example1_intr_loop_unroll.c -w -O2 -S -o ./results/example1_intr_loop_unroll_O2.s
./results/example1_intr_loop_unroll_O2 >> ./results/result_gcc5_intr_loop_unroll_O2.txt
############################################_O3_###########################################
date > ./results/result_gcc5_auto_O3.txt
echo "Auto vectorization with gcc 5.4 with O3" >> ./results/result_gcc5_auto_O3.txt
gcc example1_auto.c -w -O3 -o ./results/example1_gcc5_auto_O3
gcc example1_auto.c -w -O3 -S -o ./results/example1_gcc5_auto_O3.s
./results/example1_gcc5_auto_O3 >> ./results/result_gcc5_auto_O3.txt

date > ./results/result_gcc5_intr_O3.txt
echo "Intrinsics vectorization with gcc 5.4 with O3" >> ./results/result_gcc5_intr_O3.txt
gcc example1_intr.c -w -O3 -o ./results/example1_gcc5_intr_O3
gcc example1_intr.c -w -O3 -S -o ./results/example1_gcc5_intr_O3.s
./results/example1_gcc5_intr_O3 >> ./results/result_gcc5_intr_O3.txt

date > ./results/result_gcc5_intr_fixed_reg_O3.txt
echo "Auto vectorization with gcc 5.4 with O3" >> ./results/result_gcc5_intr_fixed_reg_O3.txt
gcc example1_intr_fixed_reg.c -w -O3 -o ./results/example1_intr_fixed_reg_O3
gcc example1_intr_fixed_reg.c -w -O3 -S -o ./results/example1_intr_fixed_reg_O3.s
./results/example1_intr_fixed_reg_O3 >> ./results/result_gcc5_intr_fixed_reg_O3.txt

date > ./results/result_gcc5_intr_loop_unroll_O3.txt
echo "Intrinsics vectorization with gcc 5.4 with O3" >> ./results/result_gcc5_intr_loop_unroll_O3.txt
gcc example1_intr_loop_unroll.c -w -O3 -o ./results/example1_intr_loop_unroll_O3
gcc example1_intr_loop_unroll.c -w -O3 -S -o ./results/example1_intr_loop_unroll_O3.s
./results/example1_intr_loop_unroll_O3 >> ./results/result_gcc5_intr_loop_unroll_O3.txt
############################################_-funroll-all-loops_###########################################
date > ./results/result_gcc5_auto_funroll-all-loops.txt
echo "Auto vectorization with gcc 5.4 with funroll-all-loops" >> ./results/result_gcc5_auto_funroll-all-loops.txt
gcc example1_auto.c -w -funroll-all-loops -o ./results/example1_gcc5_auto_funroll-all-loops
gcc example1_auto.c -w -funroll-all-loops -S -o ./results/example1_gcc5_auto_funroll-all-loops.s
./results/example1_gcc5_auto_funroll-all-loops >> ./results/result_gcc5_auto_funroll-all-loops.txt

date > ./results/result_gcc5_intr_funroll-all-loops.txt
echo "Intrinsics vectorization with gcc 5.4 with funroll-all-loops" >> ./results/result_gcc5_intr_funroll-all-loops.txt
gcc example1_intr.c -w -funroll-all-loops -o ./results/example1_gcc5_intr_funroll-all-loops
gcc example1_intr.c -w -funroll-all-loops -S -o ./results/example1_gcc5_intr_funroll-all-loops.s
./results/example1_gcc5_intr_funroll-all-loops >> ./results/result_gcc5_intr_funroll-all-loops.txt

date > ./results/result_gcc5_intr_fixed_reg_funroll-all-loops.txt
echo "Auto vectorization with gcc 5.4 with funroll-all-loops" >> ./results/result_gcc5_intr_fixed_reg_funroll-all-loops.txt
gcc example1_intr_fixed_reg.c -w -funroll-all-loops -o ./results/example1_intr_fixed_reg_funroll-all-loops
gcc example1_intr_fixed_reg.c -w -funroll-all-loops -S -o ./results/example1_intr_fixed_reg_funroll-all-loops.s
./results/example1_intr_fixed_reg_funroll-all-loops >> ./results/result_gcc5_intr_fixed_reg_funroll-all-loops.txt

date > ./results/result_gcc5_intr_loop_unroll_funroll-all-loops.txt
echo "Intrinsics vectorization with gcc 5.4 with funroll-all-loops" >> ./results/result_gcc5_intr_loop_unroll_funroll-all-loops.txt
gcc example1_intr_loop_unroll.c -w -funroll-all-loops -o ./results/example1_intr_loop_unroll_funroll-all-loops
gcc example1_intr_loop_unroll.c -w -funroll-all-loops -S -o ./results/example1_intr_loop_unroll_funroll-all-loops.s
./results/example1_intr_loop_unroll_funroll-all-loops >> ./results/result_gcc5_intr_loop_unroll_funroll-all-loops.txt

