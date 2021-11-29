#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)
library(rpart)
library(rpart.plot)
library(rattle)
library(tree)
#-------------------------------------------------------------------------------
# 1. After building the decision tree model on top of the train set for the 
# city_temperature data frame, now find the prediction values of the model1 
# on top of the test dataset. 

split_temp <- sample.split(city_temp$Region,SplitRatio = 0.60)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)


mod_temp <- rpart(Region ~ AvgTemperature,train_temp)

summary(mod_temp)

# a. Plot the model with the help of plot(). 

plot(mod_temp,margin = .2)
text(mod_temp)

# b. Print the top 10 data from the predicted values. 

pred_temp <- predict(mod_temp,test_temp,type = 'class')

head(pred_temp,10)

# c. Now based on the actual and the predicted values, calculate the confusion 
# matrix for the model. 

table(actual = test_temp$Region,predicted = pred_temp)

#-------------------------------------------------------------------------------
# 2. After building the decision tree model on top of the train set for the 
# Customer_Churn data frame, now find the prediction values of the model1 on 
# top of the test dataset. 

split_churn <- sample.split(cust_churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)

model_churn <- rpart(Churn ~ tenure,train_churn)

# a. Plot the model with the help of plot(). 

plot(model_churn,margin = .2)
text(model_churn,use.n = T)

# b. Print the top 10 data from the predicted values. 

predict_churn <- predict(model_churn,test_churn,type = 'class')

head(predict_churn,10)

# c. Now based on the actual and the predicted values, calculate the 
# confusion matrix for the model. 

table(test_churn$Churn,predict_churn)


#-------------------------------------------------------------------------------
# 3. After building the decision tree model on top of the train set for the 
# Pharmacovigilance_audit_Data data frame, now find the prediction values of 
# the model1 on top of the test dataset. 

split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_churn == T)

test_pharma <- subset(pharma_data,split_churn == F)

model_pharma <- rpart(DrugID ~ Age+Gender+Issues , train_pharma)

# a. Plot the model with the help of plot(). 

plot(model_pharma,margin = 0.10)
text(model_pharma)


# b. Print the top 10 data from the predicted values. 

predict_pharma <- predict(model_pharma,test_pharma,type = 'class')

head(predict_pharma,10)

# c. Now based on the actual and the predicted values, calculate the 
# confusion matrix for the model.

table(test_pharma$DrugID,predict_pharma)


