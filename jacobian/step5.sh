/usr/local/cuda-8.0/bin/nvlink -report-arch -o laplace2d-nvidia.out -v -arch sm_35 -L/opt/ibm/clang-ykt/lib -L/usr/local/cuda-8.0/lib64 -L. -L/opt/ibm/clang-ykt/lib -lomptarget-nvptx laplace2d-514b33-f4b37d.cubin
