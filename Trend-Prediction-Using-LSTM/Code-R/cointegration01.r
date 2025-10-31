

rm(list = ls())

setwd("/Users/iris/Desktop/CQF")
print(getwd())

list.files(path = "/Users/iris/Desktop/CQF", full.names = TRUE)

merge <- read.csv("/Users/iris/Desktop/CQF/merged02.csv", header = TRUE)
head(merge)

install.packages("urca")
library(urca)
install.packages("quantmod")
library(quantmod)
install.packages("tseries")
library(tseries)
install.packages('zoo')
library(zoo)

merge$Date <- as.Date(merge$Date, format = '%Y-%m-%d')

data_zoo <- zoo(merge[,-1])
print(data_zoo)

head(data_zoo)

adf_test01 = ur.df(data_zoo$Close, type = "drift")
print(summary(adf_test01))

adf_test001 = ur.df(data_zoo$Close, lags = 6, selectlags = "AIC", type = "drift")
print(summary(adf_test001))

adf_test02 = ur.df(data_zoo$Close_vix, type = "drift")
print(summary(adf_test02))

adf_test03 = ur.df(data_zoo$DGS10, type = "drift")
print(summary(adf_test03))

adf_test04 = ur.df(data_zoo$T5YIFR, type = "drift")
print(summary(adf_test04))

linear_reg01 = lm(data_zoo$Close ~ data_zoo$DGS10)
print(summary(linear_reg01))

adfresidual_test = ur.df(residuals(linear_reg01), type = "none")
print(summary(adfresidual_test))

sp500 <- read.csv("/Users/iris/Desktop/CQF/sp500_R.csv", header = TRUE)
head(sp500)

QQQ <- read.csv("/Users/iris/Desktop/CQF/QQQ_R.csv", header = TRUE)
head(QQQ)

DIA <- read.csv("/Users/iris/Desktop/CQF/DIA_R.csv", header = TRUE)
head(DIA)

VXX <- read.csv("/Users/iris/Desktop/CQF/VXX_R.csv", header = TRUE)
head(VXX)

sp500$Date <- as.Date(sp500$Date, format = '%Y-%m-%d')

sp500_zoo <- zoo(sp500[,-1])

head(sp500_zoo)

QQQ$Date <- as.Date(QQQ$Date, format = '%Y-%m-%d')

QQQ_zoo <- zoo(QQQ[,-1])

head(QQQ_zoo)

DIA$Date <- as.Date(DIA$Date, format = '%Y-%m-%d')

DIA_zoo <- zoo(DIA[,-1])

head(DIA_zoo)

VXX$Date <- as.Date(VXX$Date, format = '%Y-%m-%d')

VXX_zoo <- zoo(VXX[,-1])

head(VXX_zoo)

adf_testSPY = ur.df(sp500_zoo$Close_SPY, type = "drift")
print(summary(adf_testSPY))

adf_testQQQ = ur.df(QQQ_zoo$Close_QQQ, type = "drift")
print(summary(adf_testQQQ))

adf_testDIA = ur.df(DIA_zoo$Close_DIA, type = "drift")
print(summary(adf_testDIA))

adf_testVXX = ur.df(VXX_zoo$Close_VXX, type = "drift")
print(summary(adf_testVXX))

linear_regQQQ = lm(sp500_zoo$Close_SPY ~ QQQ_zoo$Close_QQQ)
print(summary(linear_regQQQ))

adfresidual_testQQQ = ur.df(residuals(linear_regQQQ), type = "none")
print(summary(adfresidual_testQQQ))

linear_regDIA = lm(sp500_zoo$Close_SPY ~ DIA_zoo$Close_DIA)
print(summary(linear_regDIA))

adfresidual_testDIA = ur.df(residuals(linear_regDIA), type = "none")
print(summary(adfresidual_testDIA))

linear_regVXX = lm(sp500_zoo$Close_SPY ~ VXX_zoo$Close_VXX)
print(summary(linear_regVXX))

adfresidual_testVXX = ur.df(residuals(linear_regVXX), type = "none")
print(summary(adfresidual_testVXX))

SPY_diff = diff(sp500_zoo$Close_SPY)
QQQ_diff = diff(QQQ_zoo$Close_QQQ)
DIA_diff = diff(DIA_zoo$Close_DIA)

residualQQQ_lag = lag(residuals(linear_regQQQ), k = -1)
ecQQQ = lm(SPY_diff ~ QQQ_diff + residualQQQ_lag + 0)
print(summary(ecQQQ))

residualDIA_lag = lag(residuals(linear_regDIA), k = -1)
ecDIA = lm(SPY_diff ~ DIA_diff + residualDIA_lag + 0)
print(summary(ecDIA))

ec_augQQQ = lm(SPY_diff ~ lag(SPY_diff, k = -1) + QQQ_diff + residualQQQ_lag + 0)
print(summary(ec_augQQQ))

ec_augDIA = lm(SPY_diff ~ lag(SPY_diff, k = -1) + DIA_diff + residualDIA_lag + 0)
print(summary(ec_augDIA))

SPY_diff_lag <- lag(SPY_diff, k = -1)

SPY_diff_aligned <- SPY_diff[-c(1,2)]
QQQ_diff_aligned <- QQQ_diff[-c(1,2)]
residualQQQ_lag_aligned <- residualQQQ_lag[-c(1,2)]
SPY_diff_lag_aligned <- SPY_diff_lag[-1]

DIA_diff_aligned <- DIA_diff[-c(1,2)]
residualDIA_lag_aligned <- residualDIA_lag[-c(1,2)]

ec_augQQQ <- lm(SPY_diff_aligned ~ SPY_diff_lag_aligned + QQQ_diff_aligned + residualQQQ_lag_aligned + 0)
print(summary(ec_augQQQ))

ec_augDIA = lm(SPY_diff_aligned ~ SPY_diff_lag_aligned + DIA_diff_aligned + residualDIA_lag_aligned + 0)
print(summary(ec_augDIA))

length(SPY_diff_aligned)
length(SPY_diff_lag_aligned)
length(QQQ_diff_aligned)
length(residualQQQ_lag_aligned)

residualsQQQ_df <- data.frame(Date = QQQ$Date, Residuals = residuals(linear_regQQQ))

write.csv(residualsQQQ_df, "/Users/iris/Desktop/CQF/residuals_QQQ.csv", row.names = FALSE)

residualsDIA_df <- data.frame(Date = DIA$Date, Residuals = residuals(linear_regDIA))

write.csv(residualsDIA_df, "/Users/iris/Desktop/CQF/residuals_DIA.csv", row.names = FALSE)
