#week 5
#autoregressive integrated moving average for non stationary time series

#qn1 
#predict the next 10 sale values by using BJsales dataset present in R packages.[this dataset is already a time series object,so thee is no need to apply ts() function]
library(forecast)
#ploting withou forecasting
plot(BJsales,main="Graph without forecasting",col.main="darkgreen")
#fittiing the model using arima model
fit=auto.arima(BJsales)
#next 10 forecasted values
forecastedValues=forecast(fit,10)
#printing forecasted values
print(forecastedValues)
plot(forecastedValues,main="Graph with forecast",col.main="darkgreen")



#qn 2 
#predict next 50 values of DAX in EuStockMarkets dataset present in R base package
#[it can take longer time than usual as the dataset is large enough as compared to BJsales dataset.
#this dataset is already a time series object,so there is no need to apply ts() function]
library(forecast)
#plotting graph without forecasting 
plot(EuStockMarkets[,"DAX"],main="Graph without forecasting",col.main="darkgreen")
#fitting model using arima model
fit=auto.arima(EuStockMarkets[,"DAX"])
#next 50 forecasted values
forecastedValues=forecast(fit,50)
#printing forecasted values
print(forecastedValues)
plot(forecastedValues,main="Graph with forecast",col.main="darkgreen")

