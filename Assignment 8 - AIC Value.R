#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)

#-------------------------------------------------------------------------------
# 1. After splitting the data frame into train and test sets, build a multiple
# logistic model on top of the train set for the city_temperature data frame. 

split_temp <- sample.split(city_temp$Region,SplitRatio = 0.70)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)

# a. For this model, take AvgTemperature, Day, Month, and Year as the 
# independent variable and Region as the dependent variable. 

model1 <- glm(Region ~ AvgTemperature+Day+Month+Year,
              data=train_temp,
              family = 'binomial')

summary(model1)

# b. Analyze the AIC value of the model. 

model1$aic


#-------------------------------------------------------------------------------
# 2. After splitting the data frame into train and test sets, build a multiple 
# logistic model on top of the train set for the Customer_Churn data frame. 


split_churn <- sample.split(cust_churn$Churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)


# a. For this model, take tenure, Streaming TV, Monthly Charges, and Total Charges 
# as the independent variable and Churn as dependent variable. 


log_mod_1 <- glm(Churn ~ tenure+StreamingTV+MonthlyCharges+TotalCharges,
                 data = train_churn,
                 family = 'binomial')

summary(log_mod_1)


# b. Analyze the AIC value of the model. 

log_mod_1$aic

#-------------------------------------------------------------------------------
# 3. After splitting the data frame into train and test sets, build a multiple 
# logistic model on top of the train set for the Pharmacovigilance_audit_Data 
# data frame. 

split_pharma <- sample.split(pharma_data$DrugID,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_pharma == T)

test_pharma <- subset(pharma_data,split_pharma == F)



# a. For this model, take Gender, Age, and Patient_Id as independent variable and 
# DrugId as dependent variable. 

log_mod_3 <- glm(DrugID ~ Gender+Age+PatientID,
                 data = train_pharma,
                 family = 'binomial')
summary(log_mod_3)


# b. Analyze the AIC value of the model. 

log_mod_3$aic

