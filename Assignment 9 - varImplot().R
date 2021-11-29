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
# 1. After splitting the data frame into train and test sets, build a random model on top of 
# the train set for the city_temperature data frame. 
# a. For this model, take AvgTemperature, Day, Month, and Year as the 
# independent variable and Region as the dependent variable. 

split_temp <- sample.split(city_temp$Region,SplitRatio = 0.70)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)

model1 <- randomForest(Region ~ AvgTemperature+Day+Month+Year , train_temp)


# b. With the help of the importance(), calculate the MeanDecreaseGini of the 
# model. 

importance(model1)


# c. Now plot the MeanDecreaseGini with the help of varImpPlot(). 

varImpPlot(model1)

# -------------------------------------------------------------------------------
# 2. After splitting the data frame into train and test sets, build a random model on top of 
# the train set for the Customer_Churn data frame. 
# a. For this model, take tenure, Streaming TV, Monthly Charges, and Total Charges 
# as the independent variable and Churn as dependent variable. 

split_churn <- sample.split(cust_churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)

model2 <- randomForest(Churn ~ tenure+StreamingTV+MonthlyCharges+TotalCharges,train_churn,na.action = na.omit)


# b. With the help of the importance(), calculate the MeanDecreaseGini of the 
# model. 

importance(model2)


# c. Now plot the MeanDecreaseGini with the help of varImpPlot(). 

varImpPlot(model2)


# -------------------------------------------------------------------------------
# 3. After splitting the data frame into train and test sets, build a random model on top of 
# the train set for the Pharmacovigilance_audit_Data data frame. 
# a. For this model, take Gender, Age, and Patient_Id as independent variable and 
# DrugId as dependent variable. 


split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_churn == T)

test_pharma <- subset(pharma_data,split_churn == F)

model3 <- randomForest(DrugID ~ Age+PatientID+Gender, train_pharma)


# b. With the help of the importance(), calculate the MeanDecreaseGini of the 
# model. 

importance(model3)


# c. Now plot the MeanDecreaseGini with the help of varImpPlot().

varImpPlot(model3)


