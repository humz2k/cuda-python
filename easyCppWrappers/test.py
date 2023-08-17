import tools
import os
import ctypes
import numpy as np

test = tools.Wrapper(os.path.abspath("test.dll"))
test.add_function("test",[ctypes.c_int32])
test.add_function("other",[(np.ndarray,ctypes.c_int32,np.int32)])
test.test(120)

test.other(np.array([[1,2,3,4],[1,2,3,4]],dtype=np.int32))