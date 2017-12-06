# laplace
Compilation steps were separated out to help debugging. All compilation files are in the /jacobian folder. /common contains the timer. Each compilation step is contained in step1.sh, step2.sh, step3.sh, step4.sh, and step5.sh. 

# step1.sh
step1.sh produces the laplace2d-d44720.bc file

# step2.sh
step2.sh proudces the laplace2d.s assembly file. The -target-cpu flag had to be changed from sm_30 to sm_35. +ptx60 had to e changed to +ptx50

# step3.sh
step3.sh produces thelaplace2d-ae2eed.o object file. The --gpu-name flag had to be changed from sm_30 to sm_35. This step was also previously using cuda-9.0 ptxas which was changed to cuda-8.0 ptxas.

# step4.sh
This step copys the object file from step3 into laplace2d-514b33-f4b37d.cubin. No changes made here

# step5.sh
This step produces laplace2d-nvidia output file. This step was also previously uding cuda-9.0. Changed to cuda-8.0. The -arch flag had to be changed from sm_30 to sm_35

# missing step
There's a step missing that links the assembly file to the output file of nvlink from step 5.

