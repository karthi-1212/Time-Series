#Week2
#-----------------------------------------------------------------------------#
library(forecast)
#library(zoo)

#------------------------------------------------------------------------------#


opar=par(no.readonly = T)

#for plotting into 2*2 format
par(mfrow=c(2,2))
#for plotting 
ylim=c(min(Nile),max(Nile))
#ma computes a simple moving average smoother of a given time series.
plot(Nile,main="Raw time series")
plot(ma(Nile,3),main="Simple Improving Average (k=3)",ylim=ylim)
plot(ma(Nile,7),main="Simple Improving Average (k=7)",ylim=ylim)
plot(ma(Nile,15),main="Simple Improving Average (k=15)",ylim=ylim)
par(opar)

#or

#file.path()
#data1=Nile

#data1
#data=zoo::na.locf(data1)
#data



