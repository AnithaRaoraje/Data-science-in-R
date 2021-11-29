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
# 1. After splitting the data frame into train and test sets, build a decision 
# tree model on top of the train set for the city_temperature data frame. 
# a. For this model, take AvgTemperature as the independent variable and Region 
# as the dependent variable. 
split_temp <- sample.split(city_temp,SplitRatio = 0.70)
train_temp <- subset(city_temp,split_temp == T)
test_temp <- subset(city_temp,split_temp == F)

mod_temp <- rpart(Region ~ AvgTemperature,train_temp)

summary(mod_temp)

rpart.plot(mod_temp)
#-------------------------------------------------------------------------------
# 2. After splitting the data frame into train and test sets, build a decision 
# tree model on top of the train set for the Customer_Churn data frame. 

split_churn <- sample.split(cust_churn$Churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)


# a. For this model, take Monthly Charges as the independent variable and Churn 
# as dependent variable. 

mod_churn <- rpart(Churn ~ MonthlyCharges,train_churn)

summary(mod_churn)

rpart.plot(mod_churn,type = 5,tweak = 0.8, box.palette= "#F7FCF5"  )


#-------------------------------------------------------------------------------
# 3. After splitting the data frame into train and test sets, build a decision
# tree model on top of the train set for the Pharmacovigilance_audit_Data data frame. 

split_pharma <- sample.split(pharma_data$Age,SplitRatio = 0.70)

train_pharma <- subset(pharma_data,split_pharma == T)

test_pharma <- subset(pharma_data,split_pharma == F)


# a. For this model, take Age as independent variable and DrugId as dependent 
# variable. 

mod_pharma <- rpart(DrugID ~ Age,train_pharma)

summary(mod_pharma)

rpart.plot(mod_pharma,type = 5,tweak = 0.8, box.palette= "#F7FCF5"  )
