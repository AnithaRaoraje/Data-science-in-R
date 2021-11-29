#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)
placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)

#-------------------------------------------------------------------------------
# 1. After building a multi linear model on top of the train set for the city_temperature 
# data frame, now find the prediction values of the model1 on top of the test dataset. 

split_temp <- sample.split(city_temp,SplitRatio = 0.70)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)


model_temp <- lm(Month ~ Country + Region + City + AvgTemperature,data = train_temp )

summary(model_temp)

#Predict test data

predicted_temp <- predict(model_temp,data=test_temp)

# a. Now combine the actual values and predicted values of the model and store 
# that combined data in a new data frame named 'MultiResult1'.

#Bind Predictions with actual values

MultiResult1 <- cbind(Actual=test_temp$Month,predicted = predicted_temp)

MultiResult1 <- as.data.frame(MultiResult1)

head(MultiResult1)

# b. Find out the errors in the predicted values. 

MultiResult1$error <- MultiResult1$Actual - MultiResult1$predicted

View(MultiResult1)


#-------------------------------------------------------------------------------
# 2. After building a multi linear model on top of the train set for the 
# Placement_Data_Full_Class data frame, now find the prediction values of the model2 
# on top of the test dataset. 
split_placement <- sample.split(placement_data,SplitRatio = 0.80)

train_placement <- subset(placement_data,split_placement == T)

test_placement <- subset(placement_data,split_placement == F)


model_placement <- lm(etest_p ~ degree_p + mba_p + status,data=train_placement)

summary(model_placement)

#Predict test data

predict_placement <- predict(model_placement,data=test_placement)

# a. Now combine the actual values and predicted values of the model and store 
# that combined data in a new data frame named 'MultiResult2'

#Bind Predictions with actual values

MultiResult2 <- cbind(actual = test_placement$etest_p,predicted = predict_placement)

MultiResult2 <- as.data.frame(MultiResult2)

head(MultiResult2)

# b. Find out the errors in the predicted values. 

MultiResult2$errors <- MultiResult2$actual - MultiResult12$predicted

View(MultiResult12)


#-------------------------------------------------------------------------------
# 3. After building a multi linear model on top of the train set for the 
# Pharmacovigilance_audit_Data data frame, now find the prediction values of the 
# model3 on top of the test dataset. 

split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_pharma == T)

test_pharma  <- subset(pharma_data,split_pharma == F)

model_pharma <- lm(Age ~ Issues + DrugID + Gender,data=train_pharma)

summary(model_pharma)

# Predict model on test data

predict_pharma <- predict(model_pharma,data=test_pharma)

# a. Now combine the actual values and predicted values of the model and store 
# that combined data in a new data frame named 'MultiResult3'.

# Bind actual and predicted values 

MultiResult3 <- cbind(actual = test_pharma$Age,predicted = predict_pharma)

MultiResult3 <- as.data.frame(MultiResult3)

head(MultiResult3)

# b. Find out the errors in the predicted values.

MultiResult3$errors <- MultiResult3$actual - MultiResult3$predicted

View(MultiResult3)





