#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)
placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)

#-------------------------------------------------------------------------------
# 1. After building the simple linear model on top of the train set for the city_temperature 
# data frame, and finding the prediction values of the model1 on top of the test dataset. 

split_temp <- sample.split(city_temp,SplitRatio = 0.70)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)


model_temp <- lm(Month ~ AvgTemperature,data = train_temp )

summary(model_temp)

# a. Now combine the error that you have calculated while predicting the values to 
# the Result1 data frame. 

#Predict test data

predicted_temp <- predict(model_temp,data=test_temp)

#Bind Predictions with actual values

result1 <- cbind(Actual=test_temp$Month,predicted = predicted_temp)

result1 <- as.data.frame(result1)

head(result1)

# b. Find out the errors in the predicted values. 

result1$error <- result1$Actual - result1$predicted

View(result1)


# b. With the help of the error, find the RMSE value of that model. 

rmse <- sqrt(mean((result1$error)^2))

rmse/mean(test_temp$Month)

rmse

#-------------------------------------------------------------------------------
# 2. After building the simple linear model on top of the train set for the 
# Placement_Data_Full_Class data frame, and finding the prediction values of the 
# model2 on top of the test dataset. 

split_placement <- sample.split(placement_data,SplitRatio = 0.80)

train_placement <- subset(placement_data,split_placement == T)

test_placement <- subset(placement_data,split_placement == F)


model_placement <- lm(etest_p ~ degree_p ,data=train_placement)

summary(model_placement)

# a. Now combine the error that you have calculated while predicting the values to 
# the Result2 data frame. 

#Predict test data

predict_placement <- predict(model_placement,data=test_placement)

#Bind Predictions with actual values

result2 <- cbind(actual = test_placement$etest_p,predicted = predict_placement)

result2 <- as.data.frame(result2)

head(result2)

# b. Find out the errors in the predicted values. 

result2$errors <- result2$actual - result2$predicted

View(result2)


# b. With the help of the error, find the RMSE value of that model. 

rmse <- sqrt(mean((result2$error)^2))

rmse/mean(test_placement$etest_p)

rmse

#-------------------------------------------------------------------------------
# 3. After building the simple linear model on top of the train set for the 
# Pharmacovigilance_audit_Data data frame, now find the prediction values of the 
# model3 on top of the test data set. 


split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_pharma == T)

test_pharma  <- subset(pharma_data,split_pharma == F)


model_pharma <- lm(Age ~ Issues,data=train_pharma)

summary(model_pharma)




# a. Now combine the error that you have calculated while predicting the values to 
# the Result3 data frame. 

# Predict model on test data

predict_pharma <- predict(model_pharma,data=test_pharma)

# Bind actual and predicted values 

result3 <- cbind(actual = test_pharma$Age,predicted = predict_pharma)

result3 <- as.data.frame(result3)

head(result3)

# b. Find out the errors in the predicted values.

result3$errors <- result3$actual - result3$predicted

View(result3)

# b. With the help of the error, find the RMSE value of that model.

rmse <- sqrt(mean((result3$error)^2))

rmse/mean(test_pharma$Age)

rmse
