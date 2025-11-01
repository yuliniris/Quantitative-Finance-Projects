# Quantitative-Finance-Projects
# Trend Prediction for S&P 500 ETF Trust Using LSTM Model

## Problems
Sequence modeling approaches, such as a recurrent neural network, show effectively model sequential data. This project is to predict the movement of S&P 500 ETF Trust using LSTM model.

## Methodology
- Features: technical indicators, time-based factors, rolling statistics, fundamental factors, factors based on cointegration analysis.
- Based on correlation analysis, Augmented Dickey-Fuller unit root test, cointegration analysis, and finally, the model uses 18 features.
- Architecture: 5 layers and last one is output layer, using Relu and elu as the activation function, and for output layer, using sigmoid function as the activation function. 
- Comparing fine-tuning methods, random search, hyperband, and Bayesian, it applies Bayesian Optimization.
- Comparing two optimization methods, Adam and RMSprop, Adam is slightly better.

## Data source
- Federal bank, Yahoo finance. 

## Results
- The results show sensitivity to the threshold of label.
- When the threshold for the label is 0.1%, the model only identifies 31% of actual class 1 cases, whereas it can identify 100% of actual class 1 cases, when the threshold for label becomes 0.09%.

## Project Report
the full project report: [Project Report PDF](https://github.com/yuliniris/Quantitative-Finance-Projects/blob/main/Trend-Prediction-Using-LSTM/Report/Trend-Prediction-using-LSTM.pdf)

## Code Structure
- data collection: fundamental factor
- data for cointegration
- feature creation
- base model
- fundamental factor model
- final model
- cointegration analysis - R 


```
## Future Work
- Consider using wavelet transform to separate short-term fluctuations and long-term trends.
- For cointegration, consider other features, such as ratios of index prices.
 
```
 

