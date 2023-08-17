main:
	nvcc mySimpleCudaCode.cu -O3 -o mySimpleCudaCode.dll -lineinfo -Xptxas -v -Xcompiler="-fPIC" -gencode=arch=compute_70,code=sm_70 --shared

clean:
	rm *.dll