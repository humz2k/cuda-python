#include <stdlib.h>
#include <stdio.h>

extern "C"{
    void test(int a){
        printf("Hello World! I got value %d.\n",a);
    }
}


extern "C"{
    void other(float* test, int* dims, int ndims){
        printf("I am reading a numpy array with %d dimensions: (",ndims);
        for (int i = 0; i < ndims; i++){
            printf("%d",dims[i]);
            if (i != (ndims-1)){
                printf(", ");
            }
        }
        printf(")\n");
    }
}