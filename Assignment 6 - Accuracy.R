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
# 1. After building the decision tree model on top of the train set for the city_temperature 
# data frame and predicting values of the model1 on top of the test dataset, calculate 
# the confusion matrix. 


split_temp <- sample.split(city_temp$Region,SplitRatio = 0.60)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)


model_temp <- rpart(Region ~ AvgTemperature,train_temp)

summary(model_temp)

plot(model_temp,margin = .2)
text(model_temp)

pred_temp <- predict(model_temp,test_temp,type = 'class')

head(pred_temp,10)

table(actual = test_temp$Region,predicted = pred_temp) -> cm1

# a. Now based on the confusion matrix values, calculate the accuracy of the 
# model. 

temp_acc <- sum(diag(cm1)/sum(cm1))


#-------------------------------------------------------------------------------
# 2. After building the decision tree model on top of the train set for the Customer_Churn 
# data frame and predicting values of the model2 on top of the test dataset, calculate 
# the confusion matrix. 


split_churn <- sample.split(cust_churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)

model_churn <- rpart(Churn ~ tenure,train_churn)

plot(model_churn,margin = .2)
text(model_churn,use.n = T)


predict_churn <- predict(model_churn,test_churn,type = 'class')

head(predict_churn,10)

table(test_churn$Churn,predict_churn) -> cm2

# a. Now based on the confusion matrix values, calculate the accuracy of the 
# model. 

churn_acc <- sum(diag(cm2)/sum(cm2))


#-------------------------------------------------------------------------------
# 3. After building the decision tree model on top of the train set for the 
# Pharmacovigilance_audit_Data data frame and predicting values of the model3 on top 
# of the test dataset, calculate the confusion matrix. 


split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_churn == T)

test_pharma <- subset(pharma_data,split_churn == F)

model_pharma <- rpart(DrugID ~ Age+Gender+Issues , train_pharma)


plot(model_pharma,margin = 0.10)
text(model_pharma)


predict_pharma <- predict(model_pharma,test_pharma,type = 'class')

head(predict_pharma,10)

table(test_pharma$DrugID,predict_pharma) -> cm3


# a. Now based on the confusion matrix values, calculate the accuracy of the 
# model. 


pharma_acc <- sum(diag(cm3)/sum(cm3))

