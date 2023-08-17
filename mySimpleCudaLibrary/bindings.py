import ctypes
import numpy as np
import os

my_directory = os.path.dirname(os.path.abspath(__file__))

mySimpleCudaCodeDLL = my_directory + "/mySimpleCudaCode.dll"
mySimpleCudaCode = ctypes.CDLL(mySimpleCudaCodeDLL)

array = np.zeros(10,dtype=np.int32)

def mySimpleKernel(array : np.ndarray):
    mySimpleCudaCode.mySimpleKernelPythonBindings(array.ctypes.data_as(ctypes.POINTER(ctypes.c_int32)),ctypes.c_int32(array.shape[0]))
    return array