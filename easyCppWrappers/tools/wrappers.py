import numpy as np
import ctypes

class Wrapper:
    def __init__(self,dll):
        self.dll = dll
        self.lib = ctypes.CDLL(self.dll)
    
    def add_function(self,name_,inputs_):
        inputs = inputs_[:]
        name = name_[:]
        def my_func(*args):
            if len(args) != len(inputs):
                raise Exception("Invalid Inputs to " + name)
            #for i,j in zip(args,inputs):
            #    if (type(i) != inputs):
            #        raise Exception("Invalid type in " + name)
            out = []
            for i,j in zip(args,inputs):
                if type(j) == tuple:
                    if (i.dtype != j[2]) or (j[0] != np.ndarray):
                        raise Exception("Invalid Type")
                    out.append(i.ctypes.data_as(ctypes.POINTER(j[1])))
                    dims = np.array(list(i.shape),dtype=np.int32)
                    out.append(dims.ctypes.data_as(ctypes.POINTER(ctypes.c_int32)))
                    out.append(ctypes.c_int32(len(dims)))
                else:
                    out.append(j(i))
            bar = getattr(self.lib, name)
            bar(*out)
        setattr(self, name, my_func)
                    