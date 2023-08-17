import numpy as np
import myCudaLibrary

array = np.zeros(10000,dtype=np.int32)
array = myCudaLibrary.mySimpleKernel(array)
print(array)