from mpi4py import MPI

world_rank = MPI.COMM_WORLD.Get_rank()
print("Hello from rank " + str(world_rank) + "!")

