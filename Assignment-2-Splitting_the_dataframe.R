#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)
placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)

#-------------------------------------------------------------------------------
# 1. From the city_temperature data set, split the data frame into train and test 
# sets.
# a. Split the data set into 70:30 ratio by the dependent feature. 


split_city_temp <- sample.split(city_temp,SplitRatio = 0.70)

train_city_temp <- subset(city_temp,split_city_temp == T)

test_city_temp <- subset(city_temp,split_city_temp == F)

#-------------------------------------------------------------------------------
# 2. From the Placement_Data_Full_Class, split the data frame into train and 
# test sets. 
# a. Split the data set into 80:20 ratio by the dependent feature. 

split_placement <- sample.split(placement_data,SplitRatio = 0.80)

train_placement <- subset(placement_data,split_placement == T)

test_placement <- subset(placement_data,split_placement == F)

#-------------------------------------------------------------------------------
# 3. From the Pharmacovigilance_audit_Data, split the data frame into train and 
# test sets. 
# a. Split the data set into 75:25 ratio by the dependent feature.


split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_pharma == T)

test_pharma <- subset(pharma_data,split_pharma == F)


