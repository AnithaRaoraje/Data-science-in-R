#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)
library(randomForest)
library(caret)
library(lattice)

# -------------------------------------------------------------------------------
# Tasks to be performed for Random Forest (Using only one Independent 
# Variable): 
# -------------------------------------------------------------------------------
# 1. After building a random forest model on top of the train set for the city_temperature 
# data frame, now find the prediction values of the model1 on top of the test dataset. 

split_temp <- sample.split(city_temp$Region,SplitRatio = 0.70)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)

model1_temp <- randomForest(Region ~ AvgTemperature,train_temp)


# a. Print the top 10 predictions of the model. 

predict_model1_temp <- predict(model1_temp,test_temp,type = 'class')

head(predict_model1_temp)


# -------------------------------------------------------------------------------
# 2. After building a random forest model on top of the train set for the Customer_Churn 
# data frame, now find the prediction values of the model2 on top of the test dataset. 


split_churn <- sample.split(cust_churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)

model2_churn <- randomForest(Churn ~ tenure,train_churn)



# a. Print the top 10 predictions of the model. 

predict_model2_churn <- predict(model2_churn,test_churn,type = 'class')

head(predict_model2_churn,10)

# -------------------------------------------------------------------------------
# 3. After building a random forest model on top of the train set for the 
# Pharmacovigilance_audit_Data data frame, now find the prediction values of the 
# model3 on top of the test dataset. 

split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_churn == T)

test_pharma <- subset(pharma_data,split_churn == F)

model3_pharma <- randomForest(DrugID ~ Age, train_pharma)


# a. Now print the top 10 predictions of the model. 

predict_model3_pharma <- predict(model3_pharma,test_pharma,type = 'class')

head(predict_model3,10)


# -------------------------------------------------------------------------------
# Tasks to be performed for Random Forest (Using Multiple Independent Variables):
# -------------------------------------------------------------------------------
# 1. After building a random forest model on top of the train set for the city_temperature 
# data frame, now find the prediction values of the model1 on top of the test dataset. 


split_temp <- sample.split(city_temp$Region,SplitRatio = 0.60)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)

model1 <- randomForest(Region ~ AvgTemperature+Day+Month+Year , train_temp)


# a. Now print the top 10 predictions of the model. 

predict_model1 <- predict(model1,test_temp,type = 'class')

head(predict_model1,10)

# -------------------------------------------------------------------------------
# 2. After building a random forest model on top of the train set for the Customer_Churn 
# data frame, now find the prediction values of the model2 on top of the test dataset. 

split_churn <- sample.split(cust_churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)

model2 <- randomForest(Churn ~ tenure+StreamingTV+MonthlyCharges+TotalCharges,train_churn,na.action = na.omit)

# a. Now print the top 10 predictions of the model. 


predict_model2 <- predict(model2,test_churn,type = 'class')

head(predict_model2,10)

# -------------------------------------------------------------------------------
# 3. After building a random forest model on top of the train set for the 
# Pharmacovigilance_audit_Data data frame, now find the prediction values of the 
# model3 on top of the test dataset. 

split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_churn == T)

test_pharma <- subset(pharma_data,split_churn == F)

model3 <- randomForest(DrugID ~ Age+PatientID+Gender, train_pharma)

# -------------------------------------------------------------------------------
# a. Now print the top 10 predictions of the model.

predict_model3 <- predict(model3,test_pharma,type = 'class')

head(predict_model3,10)



