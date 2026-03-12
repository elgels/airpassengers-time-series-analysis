# Load libraries
library(tidyverse)
library(dplyr)
library(lubridate)
library(zoo) 
library(fUnitRoots)
library(astsa)
library(forecast)

# Time series data
?AirPassengers
AirPassengers

# Plot the time series
plot(AirPassengers,
     main = "Monthly International Airline Passengers\n1949 - 1960",
     xlab = "Year-Month",
     ylab = "Air Passengers (thousands)",
     col = "steelblue",
     lwd = 2,                    # line width
     cex.main = 1,             # title size
     xlim = c(1949, 1960))

plot(AirPassengers, xlim = c(1979, 1985))

# ACF 
acf(AirPassengers)

# Log transform
par(mfrow = c(1,1))
X <- log(AirPassengers)
plot(X, main = "Log-transformed AirPassengers")

# Dickey-Fuller Test
(length(X)-1)^(1/3)
adfTest(X, 'c', lag = 5)

# Applying lag-12 difference 
AirPassdiff <- diff(log(AirPassengers), lag=12)
plot(AirPassdiff, main = "Lag-12 differenced and\n log-transformed AirPassengers")
plot(AirPassdiff, xlim = c(1954, 1968))

# Mean of differenced data
mean(AirPassdiff)

# Dickey-Fuller Test 
(length(AirPassdiff)-1)^(1/3)
adfTest(AirPassdiff, 'nc', lag = 5)
# With mean zero, p-value: 0.2941 --> at 0.05 level, we accept the null hypothesis of a unit root/difference again

# Lag-12 difference
AirPassdiff2 <- diff(diff(log(AirPassengers)), lag=12)
plot(AirPassdiff2, main = "Twice Lag-12 differenced and\n log-transformed AirPassengers")

# Plot ACF and PACF 
par(mfrow = c(1,2))
acf(AirPassdiff2, lag.max = 48)
pacf(AirPassdiff2, lag.max = 48)

# Mean of twice differenced time series
mean(AirPassdiff2)

# Auto.arima 
auto.arima(AirPassdiff2, trace = TRUE, approximation = FALSE, allowdrift = FALSE)

# Diagnostics
AirPass.model1<-sarima(AirPassdiff2, 0,0,1,0,0,1, 12)

# Ljung–Box  
LH.resid <- AirPass.model1$fit$residuals # store the residuals
LH.st.resid <- LH.resid/sqrt(AirPass.model1$fit$sigma2) # standardize

LBtest = NULL
for(H in 3:35){
  LBtest[H] = Box.test(LH.st.resid, lag = H, type = 'Ljung-Box',
                       fitdf = 2)$p.value}
LBtest

# Ljung–Box Q statistic
Box.test(LH.st.resid, lag = 35, type = "Ljung-Box")

# Let's compare model diagnostics (and AIC/AICc values) against our first model.  
# We might remove some of the parameters to check if that improves the model

sarima(AirPassdiff2, 0,0,1,0,0,2,12) 
sarima(AirPassdiff2, 0,0,1,0,0,2,12, fixed = c(NA, NA, 0, NA)) # drop sma2

sarima(AirPassdiff2, 1,0,1,0,0,1,12)
sarima(AirPassdiff2, 1,0,1,0,0,1,12, fixed = c(0, NA, NA, NA)) # drop ar1
  
# We accept the  SARIMA(0,0,1)(0,0,1)[12] model 
# Let's store it for use in forecasts
AirPass.fit <- arima(AirPassdiff2, order = c(0,0,1), 
                   seasonal = list(order = c(0,0,1), period = 12))

# Another set of diagnostics
checkresiduals(AirPass.fit)

# Forecast 
AirPass.forecast <- forecast(AirPass.fit, h = 12)
AirPass.forecast

# Plot forecast
par(mfrow = c(1,1))
plot(AirPass.forecast, main = "Forecasts from ARIMA(0,0,1)(0,0,1)[12]\n with non-zero mean")

# Looking closer
plot(AirPass.forecast, xlim = c(1958, 1962), 
     main = "")

# Numerical values of the point forecasts and confidence intervals
AirPass.forecast
