import numpy as np
import mySimpleCudaLibrary

array = np.zeros(10000,dtype=np.int32)
array = mySimpleCudaLibrary.mySimpleKernel(array)
print(array)