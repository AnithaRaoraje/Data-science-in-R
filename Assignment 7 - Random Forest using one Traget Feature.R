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
# 1. After splitting the data frame into train and test sets, build a random forest model on 
# top of the train set for the city_temperature data frame. 
# a. For this model, take AvgTemperature as the independent variable and Region 
# as the dependent variable. 

split_temp <- sample.split(city_temp$Region,SplitRatio = 0.60)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)

model1_temp <- randomForest(Region ~ AvgTemperature,train_temp)

# -------------------------------------------------------------------------------
# 2. After splitting the data frame into train and test sets, build a random forest model on 
# top of the train set for the Customer_Churn data frame. 
# a. For this model, take Monthly Charges as the independent variable and Churn 
# as dependent variable. 


split_churn <- sample.split(cust_churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)

model2_churn <- randomForest(Churn ~ tenure,train_churn)


# -------------------------------------------------------------------------------
# 3. After splitting the data frame into train and test sets, build a random forest model on 
# top of the train set for the Pharmacovigilance_audit_Data data frame. 
# a. For this model, take Age as independent variable and DrugId as dependent 
# variable.

split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_churn == T)

test_pharma <- subset(pharma_data,split_churn == F)

model3_pharma <- randomForest(DrugID ~ Age, train_pharma)

