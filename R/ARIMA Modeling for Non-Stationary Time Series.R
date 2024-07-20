# Autoregressive Integrated Moving Average (ARIMA) for Non-Stationary Time Series

# Question 1: Predicting 10 Sale Values with BJsales Dataset
library(forecast)

# Plotting without Forecasting
plot(BJsales, main = "Graph without Forecasting", col.main = "darkgreen")

# Fitting ARIMA Model
fit <- auto.arima(BJsales) 

# Forecasting Next 10 Values
forecasted_values <- forecast(fit, 10)

# Printing Forecasted Values
print(forecasted_values)

# Plotting with Forecasts
plot(forecasted_values, main = "Graph with Forecast", col.main = "darkgreen")


# Question 2: Predicting 50 Values of DAX in EuStockMarkets Dataset
# (May take longer due to larger dataset)
library(forecast)

# Plotting without Forecasting
plot(EuStockMarkets[, "DAX"], main = "Graph without Forecasting", col.main = "darkgreen")

# Fitting ARIMA Model
fit <- auto.arima(EuStockMarkets[, "DAX"]) 

# Forecasting Next 50 Values
forecasted_values <- forecast(fit, 50) 

# Printing Forecasted Values
print(forecasted_values)

# Plotting with Forecasts
plot(forecasted_values, main = "Graph with Forecast", col.main = "darkgreen")
