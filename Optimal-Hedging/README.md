# Quantitative-Finance-Projects
# Optimal Hedging with Advanced Delta Modelling

## Problems
- Simulate paths of Geometric Brownian motion based on Euler-Maruyama scheme and Milstein scheme.
- Simulate paths of Geometric Brownian motion with implementation of Brownian bridge with Sobol, the low discrepancy sequences.
- Simulation of hedging with actual volatility and implied volatility.
- Discuss the impact of time-dependent Gamma on profit and loss.
- Use Minimum Variance Delta approach to correct Black-Scholes Delta, and show how the correct term vary across delta buckets.

## Methodology
- Euler-Maruyama scheme
- Milstein scheme
- the low discrepancy sequences
- Brownian bridge
- Minimum Variance Delta approach

## Results
- The path simulations and terminal distributions of Euler and Milstein schemes do not show remarkable distinctions. It means that the time discretization is fine enough that the higher-order term in Milstein does not contribute much in this case.
- The simulated paths via Sobol with the Brownian bridge show less erratic and explosive in early steps, namely they are more guided toward the known endpoint. Because the Brownian bridge spreads variance more evenly across the path, which leads to better convergence in Monte Carlo simulations, especially when combined with Sobol sequences.
- When hedging with actual volatility, we can see that the paths of the profit show random fluctuation, but trends are upward and the final profits converge. 
-When hedging with implied volatility, the distribution of profits at maturity shows more erratic with higher deviation.
- P&L for every time step determined by gamma exposure when hedging with actual volatility.
- P&L for every time step determined by gamma exposure when hedging with implied volatility.
- Mean correction term across delta buckets shows reasonable around [0.35, 0.75] range, close to an inverted parabola-like function shape. However, the [0.75, 0.95] range may have problems.
- Magnitudes of correction term and the coefficients a, b, c are incorrect.


## Known Issues
- Magnitudes of correction term and the coefficients a, b, c are incorrect.
- The sign of c is unstable.
- Entire results show numerical unstable.
- Potential reason is the synthetic generated option dataset. vega range of the dataset is [3.07, 224.51], which is far beyond [1, 60]

## Project Report
the full project report: [Project Report PDF]( https://github.com/yuliniris/Quantitative-Finance-Projects/blob/main/Optimal-Hedging/Report/Optimal-hedging.pdf)

## Code Structure
- Geometric Brownian motion simulation
- Brownian Bridge Sobol
- Gamma analysis
- Simulation of PL with actual volatility
- Simulation of PL with implied volatility
- Synthetic data generation
- Result of correction term with problem


```
## References
- John Hull and Alan White. "Optimal Delta Hedging for Options." Journal of Banking and Finance, Vol. 82, Sept 2017: 180-190, May,2017
- Project workshop of CQF
- Understanding volatility of CQF

## Future Work
- If real option datasets are accessible, redo the minimum variance delta hedging part.
- Consider other methods to generate volatility surface. This is also one of my future research fields I am considering, namely using deep learning to forecast volatility surface or do calibrations.
- Another direct approach is to generate option data from uniform distribution, and then do adjustment with term structure factor and skew or smile factors.

```


 

