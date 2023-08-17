import numpy as np
import particleTools

particles = np.array([[0,0,0],[1,1,1],[2,2,2]],dtype=np.float32)
center = np.zeros(3)
radius = 0.2

print(particleTools.within_radius(particles,center,radius))