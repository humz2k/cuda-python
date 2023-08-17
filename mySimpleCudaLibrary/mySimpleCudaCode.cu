#include <stdio.h>
#include <stdlib.h>

__global__ void mySimpleKernel(int* d_my_array, int n){
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i >= n){
        return;
    }
    d_my_array[i] = d_my_array[i] + 1;
}

extern "C"{
    void mySimpleKernelPythonBindings(int* h_my_array, int n){
        int* d_my_array; cudaMalloc(&d_my_array,sizeof(int)*n);
        cudaMemcpy(d_my_array,h_my_array,sizeof(int)*n,cudaMemcpyHostToDevice);
        
        int blockSize = 64;
        int numBlocks = (n + (blockSize - 1)) / blockSize;

        mySimpleKernel<<<numBlocks,blockSize>>>(d_my_array,n);

        cudaDeviceSynchronize();

        cudaMemcpy(h_my_array,d_my_array,sizeof(int)*n,cudaMemcpyDeviceToHost);

        cudaFree(d_my_array);
    }
}