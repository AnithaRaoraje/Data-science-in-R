#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)
library(caret)
library(lattice)
#-------------------------------------------------------------------------------
# 1. After building a simple logistic model on top of the train set for the
# city_temperature data frame, now find the prediction values of the model1 
# on top of the test data set. 

split_temp <- sample.split(city_temp$Region,SplitRatio = 0.65)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)

model1 <- glm(Region ~ AvgTemperature,data=train_temp,family = 'binomial')

summary(model1)

prediction1 <- predict(model1,newdata = test_temp,type = 'response')

head(prediction1,10)

range(prediction1)

View(as.data.frame(prediction1))

# a. Now combine the actual values and predicted values of the model and store 
# that combined data in a new data frame named 'Result1'.

result1 <- as.data.frame(cbind(actual = test_temp$Region,predcited = prediction1))

# b. Find out the errors in the predicted values. 

result1$errors <- result1$actual - result1$predcited


# c. Now calculate the confusion matrix from the actual and the predicted values. 

table(test_temp$Region,prediction1>0.74) -> cm1


# d. From the confusion matrix, calculate the accuracy of the model.

sum(diag(cm1)/sum(cm1))


#-------------------------------------------------------------------------------
# 2. After building a simple logistic model on top of the train set for the Customer_Churn 
# data frame, now find the prediction values of the model2 on top of the test dataset. 

split_churn <- sample.split(cust_churn$Churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)

log_mod_1 <- glm(Churn ~ TechSupport,data = train_churn,family = 'binomial')

summary(log_mod_1)

predict_model <- predict(log_mod_1,test_churn,type = 'response')

View(as.data.frame(predict_model))

range(predict_model)

# a. Now combine the actual values and predicted values of the model and store 
# that combined data in a new data frame named 'Result2'.

result2 <- as.data.frame(cbind(actual =test_churn$Churn,predicted = predict_model))


# b. Find out the errors in the predicted values. 

result2$error <- result2$actual - result2$predicted

# c. Now calculate the confusion matrix from the actual and the predicted values. 

table(test_churn$Churn,result2$predicted > 0.30) -> cm2

# d. From the confusion matrix, calculate the accuracy of the model. 

# Accuracy

sum(diag(cm2)/sum(cm2))

(640+296)/(640+296+395+78) # 66.4%

#-------------------------------------------------------------------------------
# 3. After building a simple logistic model on top of the train set for the 
# Pharmacovigilance_audit_Data data frame, now find the prediction values of the 
# model3 on top of the test dataset. 


split_pharma <- sample.split(pharma_data$DrugID,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_pharma == T)

test_pharma <- subset(pharma_data,split_pharma == F)

log_mod_3 <- glm(DrugID ~ Gender,
                   data = train_pharma,
                   family = 'binomial')
summary(log_mod_3)

predict_mod_3 <- predict(log_mod_3,test_pharma,type = 'response')

View(as.data.frame(predict_mod_3))

range(predict_mod_3)

# a. Now combine the actual values and predicted values of the model and store 
# that combined data in a new data frame named 'Result3'.

result3 <- as.data.frame(cbind(actual = test_pharma$DrugID,predicted = predict_mod_3))


# b. Find out the errors in the predicted values. 

result3$errors <- result3$actual - result3$predicted


# c. Now calculate the confusion matrix from the actual and the predicted values. 

table(test_pharma$DrugID,predict_mod_3>0.42) -> cm3

confusionMatrix(test_pharma$DrugID,predict_mod_3 > 0.0)

# d. From the confusion matrix, calculate the accuracy of the model. 

sum(diag(cm3)/sum(cm3))

