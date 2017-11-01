#!/bin/bash
gcc laplace2d.c -I../common -std=c99 -lm -Wall -DTRACE -D_BSD_SOURCE -g -O0 -fopenmp -omptargets=nvptx64sm_35-nvidia-linux -o laplace
