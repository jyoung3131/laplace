#!/bin/bash
PATH=/opt/ibm/clang-ykt/bin:/usr/local/cuda-9.0/bin:$PATH LIBRARY_PATH=/opt/ibm/clang-ykt/lib:/usr/local/cuda-9.0/lib64:$LIBRARY_PATH /opt/ibm/clang-ykt/bin/clang -v -O3 -fopenmp -fopenmp-targets=nvptx64-nvidia-cuda laplace2d.c  -I../common -Wl,-Bstatic -lomptarget-nvptx -Wl,-Bdynamic -L /usr/lib/gcc/x86_64-linux-gnu/5 -L/opt/ibm/clang-ykt/omprtl/lib/ -lomptarget -lm -o laplace_ibm2
#/usr/local/cuda-9.0/bin/nvlink -o /tmp/laplace2d-aa2694.out -v -arch sm_35 -L/opt/ibm/clang-ykt/lib -L/usr/local/cuda-9.0/lib64 -L. -L/opt/ibm/clang-ykt/lib -lomptarget-nvptx /tmp/laplace2d-18676a-dd2338.cubin
