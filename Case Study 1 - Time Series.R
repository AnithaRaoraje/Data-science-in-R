
# -------------------------------------------------------------------------------
# 1. Implement the arima model on top of the 'AirPassengers' dataset & store the result 
# in 'mod_time' 

data("AirPassengers")
plot(AirPassengers)
abline(lm(AirPassengers~time(AirPassengers))) # variance is not equal
plot(decompose(AirPassengers))

#Airpassengers data is non stationary to make it stationary we use log function

plot(log(AirPassengers))
abline(lm(log(AirPassengers)~time(log(AirPassengers)))) # Variance is equal

# making mean constant
plot(diff(log(AirPassengers)))
abline(lm(diff(log(AirPassengers))~time(diff(log(AirPassengers)))))

# ARIMA

acf(AirPassengers)
acf(diff(log(AirPassengers))) # q = 1

pacf(diff(log(AirPassengers))) # p = 0 and d= 1

mod_time <- arima(log(AirPassengers),c(0,1,1),seasonal = list(order = c(0,1,0),period=12))

# -------------------------------------------------------------------------------
# 2. Predict the values for the next 20 years & store the result in 'pred_time' 

pred_time <- predict(mod_time,20*12)
pred_time
pred_time <- 2.718^pred_time$pred
pred_time
# -------------------------------------------------------------------------------
# 3. Plot the actual values & the predicted values

ts.plot(AirPassengers,pred_time,log = 'y',lty = c(1:3))


