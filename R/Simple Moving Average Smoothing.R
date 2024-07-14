#Simple Moving Average Smoothing

library(forecast)  # For time series analysis and forecasting

# Reset graphical parameters to default
opar <- par(no.readonly = TRUE)  

# Set up 2x2 plotting grid
par(mfrow = c(2, 2))

# Determine y-axis limits for consistent comparison across plots
ylim <- c(min(Nile), max(Nile)) 

# Plot the original Nile time series
plot(Nile, main = "Raw Time Series")

# Plot Simple Moving Averages with different window sizes (k)
plot(ma(Nile, 3), main = "Simple Moving Average (k = 3)", ylim = ylim)  # k = 3 years
plot(ma(Nile, 7), main = "Simple Moving Average (k = 7)", ylim = ylim)  # k = 7 years
plot(ma(Nile, 15), main = "Simple Moving Average (k = 15)", ylim = ylim)  # k = 15 years

# Restore original graphical parameters
par(opar)




