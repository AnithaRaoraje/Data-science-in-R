#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)
placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)

#-------------------------------------------------------------------------------
# 1. After splitting the data frame into train and test sets, build a simple linear model 
# on top of the train set for the city_temperature data frame. 
# a. For this model, take Country, Region, City, and AvgTemperature as the 
# independent variable and Month as the dependent variable. 

split_temp <- sample.split(city_temp,SplitRatio = 0.70)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)


model_temp <- lm(Month ~ Country + Region + City + AvgTemperature,data = train_temp )

# b. Check the Adjusted R squared value and F statistics. 

summary(model_temp)$adj.r.squared 

summary(model_temp)$fstatistic

#-------------------------------------------------------------------------------
# 2. After splitting the data frame into train and test sets, build a simple linear model 
# on top of the train set for the Placement_Data_Full_Class data frame. 
# a. For this model, take degree_p, mba_p, and status as the independent 
# variable and etest_p as dependent variable. 


split_placement <- sample.split(placement_data,SplitRatio = 0.80)

train_placement <- subset(placement_data,split_placement == T)

test_placement <- subset(placement_data,split_placement == F)


model_placement <- lm(etest_p ~ degree_p + mba_p + status,data=train_placement)

# b. Check the Adjusted R squared value and F statistics. 

summary(model_placement)$adj.r.squared

summary(model_placement)$fstatistic

#-------------------------------------------------------------------------------
# 3. After splitting the data frame into train and test sets, build a simple linear model 
# on top of the train set for the Pharmacovigilance_audit_Data data frame. 
# a. For this model, take Issues, DrugId, and Gender as independent variable 
# and Age as dependent variable. 
split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_pharma == T)

test_pharma  <- subset(pharma_data,split_pharma == F)

model_pharma <- lm(Age ~ Issues + DrugID + Gender,data=train_pharma)


# b. Check the Adjusted R squared value and F statistics

summary(model_pharma)$adj.r.squared

summary(model_pharma)$fstatistic




