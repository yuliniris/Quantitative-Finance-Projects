# Quantitative-Finance-Projects

# Project: Predicting Market Movement Using Gradient Boost

## Problem and Methodology
- Predict market movement based on classification algorithm.
- Using XGboost.
- Utilize forward-chaining cross-validation method and randomized search.
- Use Shap values to show the feature importance.

## Results
- 7 days of standard deviation of log returns, log returns and 14 days of average of log returns show the top importance.
- ROC curve is 0.45, which is not good.

## Known Issues
- Gradient boost may not be quite suitable to analysis time-series data, since it may not grasp temporal dimension characters.
- Further consideration of feature engineering.