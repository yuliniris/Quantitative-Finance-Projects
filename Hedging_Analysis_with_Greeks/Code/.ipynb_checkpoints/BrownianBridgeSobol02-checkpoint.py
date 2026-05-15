import numpy as np
import pandas as pd
from scipy import stats
from scipy.stats import qmc
import matplotlib.pyplot as plt

class SobolBrownianBridge:
    
    def __init__(self, S0: float, mu: float, sigma: float, T: float, n_steps: int, N_paths: int, seed: int | None = None):

        self.S0 = S0
        self.mu = mu
        self.sigma = sigma
        self.T = T
        self.n_steps = n_steps
        self.N_paths = N_paths
        self.dt = T/n_steps
        self.seed = seed

    def SobolNumber(self, dim: int, n_numbers: int, scramble: bool = True):

        sampler = qmc.Sobol(d=dim, scramble = scramble, seed = self.seed)

        
        m = int(np.ceil(np.log2(n_numbers)))

        sobol_numbers = sampler.random_base2(m=m) #shape (2**m, dim)
        sobol_numbers = sobol_numbers[ :n_numbers]

        sobol_z = stats.norm.ppf(sobol_numbers)

        return sobol_z

    def BrownianBridge(self, sobolseq_z: np.ndarray):

            N_paths, n_steps = sobolseq_z.shape
            
            paths=np.zeros((N_paths, n_steps + 1))

            paths[:,-1] = np.sqrt(self.T) * sobolseq_z[:,0]

            level = int(np.ceil(np.log2(self.n_steps)))
            dim = 1

            for L in range(1, level+1):
                step_size = 2**(level-L+1)

                seg_counter = 2**(L-1)

                for seg_No in range(0, seg_counter):

                    left_idx = seg_No * step_size
                    right_idx = (seg_No+1) * step_size
                    mid_idx = left_idx + (step_size//2)

                    if right_idx <= self.n_steps:

                        time_left = left_idx * self.dt
                        time_right = right_idx * self.dt
                        time_mid = mid_idx * self.dt

                        mean = (paths[:,left_idx] * (time_right - time_mid) + 
                                paths[:,right_idx] * (time_mid - time_left)) / (time_right - time_left)

                        var = (time_mid - time_left) * (time_right - time_mid) / (time_right - time_left)
                        std_dev = np.sqrt(var)

                        paths[:, mid_idx] = mean + std_dev * sobolseq_z[:, dim]
                        dim += 1

            return paths

    def pathsimulation(self):

        time_points = np.linspace(0, self.T, self.n_steps + 1)

        sobolseq_z = self.SobolNumber(dim = self.n_steps, n_numbers = self.N_paths)
        print(f"sobolseq_z shape: {sobolseq_z.shape}")
        
        BrownianBridgePaths = self.BrownianBridge(sobolseq_z)
        print(f"BrownianBridgePaths shape: {BrownianBridgePaths.shape}")
        
        drift = (self.mu - 0.5 * self.sigma**2) * time_points
        drift = drift.reshape(1,-1)
        print(f"drift shape: {drift.shape}")
        
        diffusion = self.sigma * BrownianBridgePaths
        print(f"diffusion shape: {diffusion.shape}")
        
        GBMpaths = self.S0 * np.exp(drift + diffusion)
        print(f"GBMpaths shape: {GBMpaths.shape}")

        return time_points, GBMpaths

#keep paths in rows


    def visulizationpaths(self, time_points, GBMpaths_f, n_display = 10):
        plt.figure(figsize=(20,12))
        for i in range(min(n_display, self.N_paths)):
            plt.plot(time_points, GBMpaths_f[i,:])
            
        plt.title("GBM Path Simulation using Brownian Bridge with Sobol")
        plt.xlabel('Time Steps')
        plt.ylabel('Index Level')
        plt.show()
        
