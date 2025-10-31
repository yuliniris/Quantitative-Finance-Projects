# Quantitative-Finance-Projects
# Project 1: the Use of the Monte Carlo Scheme to Price Exotic Options

## Problem and Methodology
- Using the Euler-Maruyama scheme for initially simulating the underlying price paths. 
- Calculating option prices based on initial conditions.
- Option types: Asian Call option(fixed/floating), Lookback Call(maximum/minimum, fixed/floating), Lookback Put(maximum/minimum, fixed/floating)
- Discussing Greeks

## Results
- Asian options show smoothing effects.
- Lookback options show more sensitive to changes of underlying parameters than standard European options.


```

## References
1. Hull, John. Options, Futures, and Other Derivatives. Ninth edition. Boston: Pearson, 2015.
2. Haug, Espen Gaarder. The Complete Guide to Option Pricing Formulas. 2. ed. New York, NY: McGraw-Hill, 2007.
3. Paul Glasserman. Monte Carlo Methods in Financial Engineering. Springer-Verlag New York, 2004
4. Paul Wilmott. Paul Wilmott introduces Quantitative Finance. Wiley, 2007
5. Peter G. Zhang. Exotic Options A Guide to Second Generation Options. World Scientific, 1998

## Future Work
- Calculate and discuss Greeks under different volatility regimes.
- Consider other methods, such as deriving and using modified BS model adapted to exotic options.
```

 

# Project 2: Predicting Positive Moves Using Support Vector Machine

## Problem and Methodology
- Produce a model to predict positive moves using the support vector machine.
- Propose detailed feature engineering and model architecture.
- Data load: use 5-year period S&P 500 ETF Trust data, and check columns and missing data.
- Create various features, using pair plots and correlation calculations to decide left ones.
- Try Gaussian kernel.
- Utilize forward-chaining cross-validation method and grid search.


## Results
- Results show via ROC curve and confusion matrix.
- Accuracy is 0.56.
- ROC curve is 0.51.


## Known Issues
- Support vector machine may not be suitable to analysis time-series data, since it may not grasp temporal dimension characters.
- Further consideration of feature engineering.


# Project 3: Predicting Market Movement Using Gradient Boost

## Problem and Methodology
- Predict market movement based on classification algorithm.
- Using XGboost.
- Utilize forward-chaining cross-validation method and randomized search.
- Use Shap values to show the feature importance.

## Results
- 7 days of standard deviation of log returns, log returns and 14 days of average of log returns show the top importance.
- ROC curve is 0.45, which is not good.

## Known Issues
- Gradient boost may not be suitable to analysis time-series data, since it may not grasp temporal dimension characters.
- Further consideration of feature engineering.