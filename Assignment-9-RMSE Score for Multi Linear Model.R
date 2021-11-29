#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)
placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)

#-------------------------------------------------------------------------------
# 1. After building the multi linear model on top of the train set for the city_temperature 
# data frame, and finding the prediction values of the multimodel1 on top of the test 
# dataset. 

split_temp <- sample.split(city_temp,SplitRatio = 0.70)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)

model_temp <- lm(Month ~ Year + AvgTemperature+Day,data = train_temp )

summary(model_temp)

# a. Now combine the error that you have calculated while predicting the values to 
# the Result1 data frame. 


predicted_temp <- predict(model_temp,data=test_temp)

#Bind Predictions with actual values

Result1 <- cbind(Actual=test_temp$Month,predicted = predicted_temp)

Result1 <- as.data.frame(Result1)

head(Result1)

# b. Find out the errors in the predicted values. 

Result1$error <- Result1$Actual - Result1$predicted

View(Result1)

# b. With the help of the error, find the RMSE value of that model. 

rmse<-sqrt(mean((Result1$error)^2))

rmse/mean(test_temp$Month)

rmse

#-------------------------------------------------------------------------------
# 2. After building the multi linear model on top of the train set for the 
# Placement_Data_Full_Class data frame, and finding the prediction values of the 
# multimodel2 on top of the test dataset. 

sample.split(placement_data,SplitRatio = 0.80) -> split_placement

train_placement <- subset(placement_data,split_placement == T)

test_placement <- subset(placement_data,split_placement == F)

model_placement <- lm(ssc_p ~ degree_p + hsc_p + ssc_b + 
                        degree_t,data = train_placement)


summary(model_placement)

# a. Now combine the error that you have calculated while predicting the values to 
# the Result2 data frame. 

predict_placement <- predict(model_placement,data=test_placement)

#Bind Predictions with actual values

Result2 <- cbind(actual = test_placement$etest_p,predicted = predict_placement)

Result2 <- as.data.frame(Result2)

head(Result2)

# b. Find out the errors in the predicted values. 

Result2$errors <- Result2$actual - Result2$predicted

View(Result2)

# b. With the help of the error, find the RMSE value of that model. 

rmse <- sqrt(mean((Result2$errors)^2))

rmse/mean(test_placement$ssc_p)

rmse
#-------------------------------------------------------------------------------
# 3. After building the multi linear model on top of the train set for the 
# Pharmacovigilance_audit_Data data frame, now find the prediction values of the 
# multimodel3 on top of the test dataset. 

split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_pharma == T)

test_pharma  <- subset(pharma_data,split_pharma == F)

model_pharma <- lm(Age ~ Issues + DrugID + Gender,data=train_pharma)

summary(model_pharma)


# a. Now combine the error that you have calculated while predicting the values to 
# the Result3 data frame. 

predict_pharma <- predict(model_pharma,data=test_pharma)


Result3 <- cbind(actual = test_pharma$Age,predicted = predict_pharma)

Result3 <- as.data.frame(Result3)

head(Result3)


Result3$errors <- Result3$actual - Result3$predicted

View(Result3)


# b. With the help of the error, find the RMSE value of that model.

rmse <- sqrt(mean((Result3$errors)^2))

rmse/mean(test_pharma$Age)

rmse


