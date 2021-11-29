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
# -------------------------------------------------------------------------------
# 1. From the city_temperature dataset, split the data frame into train and test sets. 
# a. Split the dataset into 70:30 ratio by the dependent feature. 

split_temp <- sample.split(city_temp$Region,SplitRatio = 0.70)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)


# -------------------------------------------------------------------------------
# 2. From the Customer_Churn, split the data frame into train and test sets. 
# a. Split the dataset into 80:20 ratio by the dependent feature. 

split_churn <- sample.split(cust_churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)

# -------------------------------------------------------------------------------
# 3. From the Pharmacovigilance_audit_Data, split the data frame into train and test sets. 
# a. Split the dataset into 75:25 ratio by the dependent feature. 


split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_churn == T)

test_pharma <- subset(pharma_data,split_churn == F)

