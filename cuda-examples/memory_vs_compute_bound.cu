#include <stdlib.h>
#include <stdio.h>
#include "cputimer.hpp"

__global__ void memory_bound(const float4* __restrict my_data, float4* __restrict my_output, int n){
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    float4 me = my_data[i];
    my_output[i] = me;
}

__global__ void compute_bound(const float4* __restrict my_data, float4* __restrict my_output, int n){
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    float4 me = my_data[i];
    for (int i = 0; i < 10000; i++){
        me.x = sqrtf(me.x);
        me.y = sqrtf(me.y);
        me.z = sqrtf(me.z);
        me.w = sqrtf(me.w);
    }
    my_output[i] = me;
}

int main(){
    return 0;
}