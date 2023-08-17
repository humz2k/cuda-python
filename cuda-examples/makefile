
.PHONY: all
all: $(patsubst %.cu,%.o,$(wildcard *.cu))

.PHONY: clean
clean:
	rm *.o

CUDA_FLAGS ?= -lineinfo -Xptxas -v -Xcompiler="-fPIC" -gencode=arch=compute_70,code=sm_70 -I../include

%.o: %.cu
	nvcc -o $@ $< $(CUDA_FLAGS)