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
#-------------------------------------------------------------------------------
# 1. Load the city_temperature dataset . 
# a. Find out the independent and dependent features from the data frame for model 
# training. 

# InDepedentfeatures <- city_temp$Year,city_temp$AvgTemperature,city_temp$Day,city_temp$Month
# Depedentfeatures <- city_temp$Region,city_temp$State,city_temp$Country,city_temp$City


#-------------------------------------------------------------------------------
# 2. Load the Customer_Churn dataset. 
# a. Find out the independent and dependent features from the data frame for model 
# training. 

# Indepedentfeatures <- cust_churn$MonthlyCharges,cust_churn$TotalCharges,cust_churn$tenure

# Depedentfeatures <- cust_churn$Churn,cust_churn$PaymentMethod,cust_churn$InternetService,
#                   cust_churn$gender


#-------------------------------------------------------------------------------
# 3. Load the Pharmacovigilance_audit_Data dataset. 
# a. Find out the independent and dependent features from the data frame for the 
# model training.


# Indepedentfeatures <- pharma_data$Age,pharma_data$Gender

# Depedentfeatures <-pharma_data$Issues,pharma_data$DrugID



