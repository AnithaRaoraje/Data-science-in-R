#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)
placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)

#-------------------------------------------------------------------------------
# 1. After splitting the data frame into train and test sets, build a simple linear model on 
# top of the train set for the city_temperature data frame. 

split_temp <- sample.split(city_temp,SplitRatio = 0.70)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)

# a. For this model, take AvgTemperature as the independent variable and Month 
# as the dependent variable. 

model_temp <- lm(Month ~ AvgTemperature,data=train_temp)

summary(model_temp)

# 2. After splitting the data frame into train and test sets, build a simple linear model on 
# top of the train set for the Placement_Data_Full_Class data frame. 

split_placement <- sample.split(placement_data,SplitRatio = 0.80)

train_placement <- subset(placement_data,split_placement == T)

test_placement <- subset(placement_data,split_placement == F)

# a. For this model, take mba_p as the independent variable and etest_p as 
# dependent variable.

model_placement <- lm(etest_p ~ mba_p,data=train_placement)

summary(model_placement)


# 3. After splitting the data frame into train and test sets, build a simple linear model on 
# top of the train set for the Pharmacovigilance_audit_Data data frame. 

split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_pharma == T)

test_pharma  <- subset(pharma_data,split_pharma == F)

# a. For this model, take DrugId as independent variable and Age as dependent 
# variable

model_pharma <- lm(Age ~ DrugID,data=train_pharma)

summary(model_pharma)



