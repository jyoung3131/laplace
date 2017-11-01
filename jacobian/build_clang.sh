#!/bin/bash
LD_LIBRARY_PATH=/opt/clang_omp/clang-coral/omprtl/lib/:$LD_LIBRARY_PATH COMPILER_PATH=/usr/lib/gcc/x86_64-linux-gnu/5 /opt/clang_omp/clang-coral/bin/clang laplace2d.c -I../common -L /usr/lib/gcc/x86_64-linux-gnu/5 -L/opt/clang_omp/clang-coral/omprtl/lib/ -lomp -std=c99 -lm -Wall -DTRACE -D_BSD_SOURCE -g -O0 -fopenmp -omptargets=nvptx64sm_35-nvidia-linux -o laplace_clang
