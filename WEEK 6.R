#WEEK 6
#MOD-5
#-------------------------------------------#
library(AICcmodavg)
library(flexmix)
library(forecast)
#-------------------------------------------#
#AIC Model
#predictor model
m1=lm(mpg~disp+hp+wt+qsec,data=mtcars)
m2=lm(mpg~disp+qsec,mtcars)
m3=lm(mpg~disp+wt,mtcars)

#define list of models
models=list(m1,m2,m3);models
#specify model names
mod.names=c('disp.hp.wt.qsec','desp.qsec','disp.wt')
#calculate AIC of each model
aictab(cand.set=models,modnames=mod.names)

## since AIC value is less for first model, model1 is best fit.

#View firs 6 rows of mtcars dataset
head(mtcars)

m1=lm(mpg~disp+hp,data=mtcars)
m2=lm(mpg~disp+qsec,mtcars)
m3=lm(mpg~disp+wt,mtcars)

#calculate BIC
BIC(m1)
BIC(m2)
BIC(m3)

#Since model 3 has the lowest value BIC value, we will choose it as the model that best fit for the dataset


#Get the data points in form of R vector
rain=c(987,1025,978,774,1563,569,1456,789,1479,566,1563,1698)
#convert into time series 
rain_ts=ts(rain,start = c(2020,1),frequency = 12);rain_ts
plot(rain_ts,main="Time Series data")
summary(rain_ts)

model1=arima(rain_ts,order = c(1,0,0));model1
model2=arima(rain_ts,order = c(2,0,0));model2

BIC(model1)
BIC(model2)

#Since model 1 has the lowest value BIC value, we will choose it as the model that best fit for the dataset

d1=AirPassengers
class(d1)

#display the data to check to see the pattern such as trend,level,seasonality
d1
## check the date value to see the range of the data set
start(d1);end(d1)

#Find out any missing value
sum(is.na(d1))

#check the summary of the data set
summary(d1)

#Plot the dataset to check any visually detectable
plot(d1)

#ARIMA model 
mymodel=auto.arima(d1);mymodel

#ARIMA(211)(010)12
##plot the residuals(to check any obvious pattern)
plot.ts(mymodel$residuals)

#Forecast the value for 3 years
myfor=forecast(mymodel,level = c(95),h=3*12);myfor
plot(myfor)

#Validate the model by selecting Lag value via Ljung-Box test or any-other
Box.test(mymodel$resid,lag = 5,type = "Ljung-Box")
Box.test(mymodel$resid,lag = 10,type = "Ljung-Box")
Box.test(mymodel$resid,lag = 15,type = "Ljung-Box")
