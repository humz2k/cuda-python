import ctypes
import numpy as np
import os

my_directory = os.path.dirname(os.path.abspath(__file__))

def within_radius(particles : np.ndarray, center : np.ndarray, radius : float):
    particle_toolsDLL = my_directory + "/particle_tools.dll"
    particle_tools = ctypes.CDLL(particle_toolsDLL)
    out = np.zeros(particles.shape[0],dtype=np.int32)
    particle_tools.within_radius_binding(particles.astype(np.float32).flatten().ctypes.data_as(ctypes.POINTER(ctypes.c_float)),out.ctypes.data_as(ctypes.POINTER(ctypes.c_int32)),ctypes.c_int32(particles.shape[0]),ctypes.c_float(center[0]),ctypes.c_float(center[1]),ctypes.c_float(center[2]),ctypes.c_float(radius))
    return particles[out == 1]