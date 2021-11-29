#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)

memory.limit(size=56000) 
library(dplyr)
library(caTools)
library(randomForest)
library(caret)
library(lattice)
# -------------------------------------------------------------------------------
# 1. After building the decision tree model on top of the train set for the city_temperature 
# data frame, now find the prediction values of the model1 on top of the test data set. 

split_temp <- sample.split(city_temp$Region,SplitRatio = 0.60)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)

model1 <- randomForest(Region ~ AvgTemperature,train_temp)

# a. Plot the model with the help of plot(). 

plot(model1)

varImpPlot(model1)

# b. Print the top 10 data from the predicted values. 

predict_model1 <- predict(model1,test_temp,type = 'class')

head(predict_model1)

# c. Now based on the actual and the predicted values, calculate the confusion 
# matrix for the model. 

table(test_temp$Region,predict_model1)

confusionMatrix(test_temp$Region,predict_model1)

# -------------------------------------------------------------------------------
# 2. After building the decision tree model on top of the train set for the Customer_Churn 
# data frame, now find the prediction values of the model1 on top of the test dataset. 

split_churn <- sample.split(cust_churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)

model2 <- randomForest(Churn ~ tenure,train_churn)

# a. Plot the model with the help of plot(). 

plot(model2)

varImpPlot(model2)

# b. Print the top 10 data from the predicted values. 

predict_model2 <- predict(model2,test_churn,type = 'class')

head(predict_model2,10)


# c. Now based on the actual and the predicted values, calculate the confusion 
# matrix for the model. 


table(test_churn$Churn,predict_model2) -> cm2

confusionMatrix(test_churn$Churn,predict_model2)


# -------------------------------------------------------------------------------
# 3. After building the decision tree model on top of the train set for the 
# Pharmacovigilance_audit_Data data frame, now find the prediction values of the 
# model1 on top of the test dataset. 

split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_churn == T)

test_pharma <- subset(pharma_data,split_churn == F)

model3 <- randomForest(DrugID ~ Age, train_pharma)

importance(model3)


# a. Plot the model with the help of plot(). 

plot(model3)

varImpPlot(model3)

# b. Print the top 10 data from the predicted values. 

predict_model3 <- predict(model3,test_pharma,type = 'class')

head(predict_model3,10)

# c. Now based on the actual and the predicted values, calculate the confusion 
# matrix for the model.

table(test_pharma$DrugID,predict_model3) -> cm3

confusionMatrix(test_pharma$DrugID,predict_model3)


