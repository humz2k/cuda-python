#include <stdio.h>
#include <stdlib.h>

__global__ void within_radius_kernel(const float3* __restrict d_particles, int* __restrict out, float3 center, float radius, int n_particles){
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i >= n_particles){
        return;
    }
    float3 my_particle = d_particles[i];
    my_particle.x -= center.x;
    my_particle.y -= center.y;
    my_particle.z -= center.z;

    float r2 = my_particle.x*my_particle.x + my_particle.y*my_particle.y + my_particle.z*my_particle.z;
    float r = sqrtf(r2);
    out[i] = r < radius;

}

extern "C"{
    void within_radius_binding(float3* h_particles, int* h_out, int n_particles, float x, float y, float z, float radius){
        float3* d_particles; cudaMalloc(&d_particles,sizeof(float3)*n_particles);
        cudaMemcpy(d_particles,h_particles,sizeof(float3)*n_particles,cudaMemcpyHostToDevice);
        int* d_out; cudaMalloc(&d_out,sizeof(int)*n_particles);
        
        int blockSize = 64;
        int numBlocks = (n_particles + (blockSize - 1)) / blockSize;

        within_radius_kernel<<<numBlocks,blockSize>>>(d_particles,d_out,make_float3(x,y,z),radius,n_particles);

        cudaDeviceSynchronize();

        cudaMemcpy(h_out,d_out,sizeof(int)*n_particles,cudaMemcpyDeviceToHost);

        cudaFree(d_particles);
        cudaFree(d_out);
    }
}