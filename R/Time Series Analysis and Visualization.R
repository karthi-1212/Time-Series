# Visualization of Stationary and Non-Stationary Time Series

#----------------------------------------------------------#

library(timeSeries)
library(TSstudio)
library(forecast)

#----------------------------------------------------------#

# Example 1: Simple Rainfall Time Series (Non-Stationary)
rainfall <- c(799, 1174.8, 865.1, 1334.6, 635.4, 918.5, 685.5, 998.6, 784.2, 985, 882.8, 1071)
rainfall.timeseries <- ts(rainfall, start = c(2012, 1), frequency = 12) 
ts_plot(rainfall.timeseries, title = "Monthly Rainfall (Non-Stationary)")

# Example 2: Multiple Rainfall Time Series (Non-Stationary)
rainfall_2 <- c(655, 1306.9, 1323.4, 1172.2, 562.2, 824, 822.4, 1265.5, 799.6, 1105.6, 1106.7, 1337.8)
combined_rainfall <- matrix(c(rainfall, rainfall_2), nrow = 12)
combined_rainfall_timeseries <- ts(combined_rainfall, start = c(2012, 1), frequency = 12)
ts_plot(combined_rainfall_timeseries, title = "Combined Monthly Rainfall (Non-Stationary)")

# Example 3: Air Passengers (Non-Stationary with Trend and Seasonality)
data("AirPassengers")
ts_plot(AirPassengers, title = "Monthly Airline Passengers (Non-Stationary)")

# Decomposition of AirPassengers (Identify Trend, Seasonality, Randomness)
ts_data <- ts(AirPassengers, frequency = 12)
d_data <- decompose(ts_data, "multiplicative")
plot(d_data)
ts_plot(d_data$trend, title = "Trend Component")
ts_plot(d_data$seasonal, title = "Seasonal Component")
ts_plot(d_data$random, title = "Random Component")

# Visualizing Trend and Seasonality in AirPassengers
plot(AirPassengers)
abline(reg = lm(AirPassengers ~ time(AirPassengers)))  # Trend line
boxplot(AirPassengers ~ cycle(AirPassengers), xlab = "Month", ylab = "Passengers (1000s)", main = "Monthly Air Passengers by Cycle")
ggseasonplot(AirPassengers, title = "Seasonal Plot: Air Passengers") 

# Example 4: Nile River Flow (Stationary)
plot(Nile, xlab = "Year", ylab = "River Volume (1e9 m^3)", main = "Annual Nile River Flow (Stationary)")

# Example 5: Stationary Random Time Series
esp <- rnorm(100, 0, 1) 
mu <- 2
X_t <- mu + esp
ts.plot(X_t, main = "Stationary Random Time Series", ylab = expression(X[t]))
acf(X_t, main = "Autocovariance Function of X_t") 

# Example 6: Random Walk (Non-Stationary)
z <- rnorm(100, 0.5, 1.5)
X <- cumsum(z)  # Cumulative sum for random walk
ts.plot(X, main = "Random Walk (Non-Stationary)")

