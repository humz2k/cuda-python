main:
	nvcc within_radius.cu -O3 -o within_radius.dll -lineinfo -Xptxas -v -Xcompiler="-fPIC" -gencode=arch=compute_70,code=sm_70 --shared

clean:
	rm *.dll