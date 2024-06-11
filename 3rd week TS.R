#-------------------------------------------------------------#

#week 3
#Exponential Smoothing Technique (single, double and Triple)
#ETS error trend and seasonal

#-------------------------------------------------------------#

#plot the single exponential smoothing technique 

library(forecast)
y=c(71,70,69,68,64,65,72,78,75,75,75,70)
yt=ts(y,start = c(1,1),frequency = 1);yt
fit1=ets(yt,model = "ANN",alpha = 0.1)
A1=fit1$fitted;A1
fit2=ets(yt,model = "ANN",alpha = 0.3)
A2=fit2$fitted;A2
fit3=ets(yt,model = "ANN",alpha = 0.5)
A3=fit3$fitted;A3
fit4=ets(yt,model = "ANN",alpha = 0.7)
A4=fit4$fitted;A4
fit5=ets(yt,model = "ANN",alpha = 0.9)
A5=fit5$fitted;A5


plot(yt,col="red")

lines(A1,lty=1,color="green")
lines(A2,lty=2)
lines(A3,lty=3)
lines(A4,lty=4)
lines(A5,lty=5)

legend("topleft", c("Raw Data", "alpha=0.1", "alpha=0.3", "alpha=0.5", "alpha=0.7", "alpha=0.9"), 
       lty = c(1, 1, 2, 3, 4, 5), col = c("red", colors), title = "Legend")
#or


plot(yt,col="red")
# Create a list of lines, line types, and colors
lines_list <- list(A1, A2, A3, A4, A5)
line_types <- c(1, 2, 3, 4, 5)
colors <- c("blue", "red", "green", "purple", "orange")

# Use a for loop to plot the lines with different line types and colors
for (i in 1:5) {
  lines(lines_list[[i]], lty = line_types[i], col = colors[i])
}

# Add a legend with colors according to the previous code
legend("topleft", c("Raw Data", "alpha=0.1", "alpha=0.3", "alpha=0.5", "alpha=0.7", "alpha=0.9"), 
       lty = c(1, 1, 2, 3, 4, 5), col = c("red", colors), title = "Legend")

#Double Exponential smoothing 
s=c(7,6,5,4,8,9,10,11,10,7)
s1=ts(s,start = c(1,1),frequency = 1)
fit=ets(s1,model = "AAN")
pred=forecast(fit,4);pred
plot(fit)

#Triple Exponential smoothing 
Fit=ets(AirPassengers,model="AAA");Fit
Pred=forecast(fit,5);Pred
plot(Fit)

