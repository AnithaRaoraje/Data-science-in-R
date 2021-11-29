#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)
library(randomForest)

#-------------------------------------------------------------------------------
# 1. After building the decision tree model on top of the train set for the city_temperature 
# data frame and predicting values of the model1 on top of the test dataset, calculate 
# the confusion matrix. 

split_temp <- sample.split(city_temp$Region,SplitRatio = 0.60)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)

model1 <- randomForest(Region ~ AvgTemperature,train_temp)  

# a. Now based on the confusion matrix values, calculate the accuracy of the 
# model. 





#-------------------------------------------------------------------------------
# 2. After building the decision tree model on top of the train set for the Customer_Churn 
# data frame and predicting values of the model2 on top of the test dataset, calculate 
# the confusion matrix. 

split_churn <- sample.split(cust_churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)

model2 <- randomForest(Churn ~ tenure,train_churn)

predict_model2 <- predict(model2,test_churn,type = 'class')

table(test_churn$Churn,predict_model2) -> cm2

confusionMatrix(test_churn$Churn,predict_model2)

# a. Now based on the confusion matrix values, calculate the accuracy of the 
# model. 

model2_acc  <- sum(diag(cm2)/sum(cm2))


#-------------------------------------------------------------------------------
# 3. After building the decision tree model on top of the train set for the 
# Pharmacovigilance_audit_Data data frame and predicting values of the model3 on top 
# of the test dataset, calculate the confusion matrix. 

split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_churn == T)

test_pharma <- subset(pharma_data,split_churn == F)

model3 <- randomForest(DrugID ~ Age, train_pharma)

importance(model3)

predict_model3 <- predict(model3,test_pharma,type = 'class')

table(test_pharma$DrugID,predict_model3) -> cm3

confusionMatrix(test_pharma$DrugID,predict_model3)

# a. Now based on the confusion matrix values, calculate the accuracy of the 
# model.

model3_acc <- sum(diag(cm3)/sum(cm3))


