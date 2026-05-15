# Hedging Analysis with Greeks
## Overview
- This project studies the profitability and risk of delta-hedged portfolios. It implements numerical simulation of geometric Brownian motion via Euler-Maruyama, Milstein schemes and Brownian Bridges with Sobol sequence. It also examines the role of Gamma, Gamma scalping and regime shift in realized volatility in shaping the profitability of a delta-hedged option position.

## Objective
- To simulate and compare the profitability and risk of delta-hedging a portfolio using the actual volatility and the implied volatility, analyzing the impact of Gamma and Gamma scalping.

## Research Questions 
- Simulate paths of Geometric Brownian motion based on Euler-Maruyama scheme and Milstein scheme.
- Simulate paths of Geometric Brownian motion with implementation of Brownian bridge with Sobol, the low discrepancy sequences.
- Comparison of hedging with actual volatility and implied volatility.
- Discuss the impact of time-dependent Gamma and Gamma scalping of profit and loss, regime shift involved.


## Methodology
- Geometric Brownian Motion(GBM) simulation
- Euler-Maruyama scheme
- Milstein scheme
- Error analysis using terminal-value RMSE and log-log convergence plots
- Sobol low-discrepancy sequences 
- Brownian bridge path construction
- Mathematical derivatives of mark-to-market P&L for delta-hedged portfolios
- Gamma scalping P&L approximation
- Convexity premium 
- Regime-shift analysis for time-varying realized volatility

## Main Results
- Euler-Maruyama and Milstein generate visually similar GBM paths and terminal distributions, with no remarkable distinctions, though Milstein achieves higher pathwise accuracy.
- Terminal-value error checking confirms the expected convergence behavior: Euler strong convergence slope is close to 0.5, and Milstein strong convergence slope is close to 1.
- Brownian bridge with Sobol sequence produces well-behaved paths and reduce variance through low-discrepancy sampling.
- When hedging with actual volatility, terminal profit converges to final profits consistent with the theoretical formula, but the mark-to-market path is random.
- When hedging with implied volatility, the local P&L increment follows the variance-difference structure, and the profitability depends heavily on Gamma exposure and variance spread.
- P&L of delta-hedged options depends heavily on Gamma exposure, namely whether the spot price stays near the strike, the high Gamma zone, or drift away as maturity approaches.
- P&L is also affected by the regime shift. long-gamma position benefit from convexity When realized variance exceeds implied variance, whereas when realized variance is below implied variance, theta dominates and the delta-hedged long-gamma position tends to lose money.


## Project Report
the full project report: [Project Report PDF]( https://github.com/yuliniris/Quantitative_Finance_Projects/blob/main/Hedging_Analysis_with_Greeks/Report/Hedging_Analysis_with_Greeks.pdf)

## Code Structure
- Geometric Brownian motion simulation
- Compare scheme error
- Brownian Bridge Sobol
- Simulation of PL with actual volatility
- Simulation of PL with implied volatility
- Gamma scalping

## Assumptions and Limitations
This project uses a simplified framework:
- The underlying asset follows geometric Brownian motion
- Black-Scholes assumptions are used in the hedging derivations
- Continuous-time formulas are compared with discrete-time simulations
- No transaction costs, jumps, or stochastic volatility are included in the baseline setting



## References
- Peter Jackel. "Monte Carlo Methods in Finance." Wiley & Sons, Incorporated, John, November, 2002
- John Hull and Alan White. "Optimal Delta Hedging for Options." Journal of Banking and Finance, Vol. 82, Sept 2017: 180-190, May,2017
- Project workshop of CQF
- Understanding volatility of CQF

## Future Work
Possible extensions include:
- Apply a volatility surface (local volatility or stochastic volatility): allow various implied volatility for different strikes.
- Use a regime-switching model, such as Markov switching to simulate the actual volatility path
- Build an interactive gamma-scalping dashboard
- Compare delta-hedged option P&L with variance swap exposure






 

