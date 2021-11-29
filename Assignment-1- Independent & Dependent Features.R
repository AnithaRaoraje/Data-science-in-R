#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)
placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)

#-------------------------------------------------------------------------------
# 1. Load the city_temperature dataset using read.csv. 
# a. Find out the independent and dependent features from the data frame for 
# model training. 

# Depedentfeatures <- city_temp$Year,city_temp$AvgTemperature
# inDepedentfeatures <- city_temp$Region,city_temp$State,city_temp$Country,city_temp$City

#-------------------------------------------------------------------------------
# 2. Load the Placement_Data_Full_Class using the read.csv. 
# a. Find out the independent and dependent features from the data frame for 
# model training. 

# Depedentfeatures <- placement_data$ssc_p,placement_data$hsc_p,placement_data$salary
#                     placement_data$degree_p,placement_data$etest_p,placement_data$mba_p


# Independentfeatures <- placement_data$gender,placement_data$ssc_b,placement_data$hsc_b
#                         placement_data$hsc_s,placement_data$degree_t,placement_data$specialisation
#                         placement_data$status,placement_data$workex


#-------------------------------------------------------------------------------
# 3. Load the Pharmacovigilance_audit_Data using the read.csv. 
# a. Find out the independent and dependent features from the data frame for 
# the model training.

# Depedentfeatures <- pharma_data$Age

# InDepedentfeatures <-pharma_data$Issues,pharma_data$DrugID,pharma_data$Gender

