#!/bin/bash

PATH=/opt/ibm/clang-ykt/bin:/usr/local/cuda-8.0/bin:$PATH LIBRARY_PATH=/opt/ibm/clang-ykt/lib:/usr/local/cuda-8.0/lib64:$LIBRARY_PATH /opt/ibm/clang-ykt/bin/clang -v -O3 -fopenmp -fopenmp-targets=nvptx64-nvidia-cuda,x86_64 laplace2d.c  -I../common -Wl,-Bstatic -lomptarget-nvptx -Wl,-Bdynamic -L /usr/lib/gcc/x86_64-linux-gnu/5 -L/opt/ibm/clang-ykt/omprtl/lib/ -lomptarget -lm -o laplace_ibm2
#/usr/local/cuda-8.0/bin/nvlink -o laplace2d-9bf570.out -v -arch sm_35 -L/opt/ibm/clang-ykt/lib -L/usr/local/cuda-8.0/lib64 -L. -L/opt/ibm/clang-ykt/lib -lomptarget-nvptx laplace2d-514b33-f4b37d.cubin
