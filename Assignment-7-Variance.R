#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_class.csv',stringsAsFactors = T)

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

library(dplyr)

#-------------------------------------------------------------------------------
# Using customer churn dataset: 
# 1. Calculate the variance of 'tenure' column and store it in var_tenure. 

var_tenure <- var(cust_churn$tenure)

# 2. Calculate the variance of 'Monthly Charges' column and store it in 
# var_MonthlyCharges. 

var_monthlycharges <- var(cust_churn$MonthlyCharges)

# 3. Calculate the variance of 'Total Charges' column and store it in var_TotalCharges. 

var_totalcharges <- var(cust_churn$TotalCharges,na.rm = T)

#-------------------------------------------------------------------------------
# Using student's placement dataset: 
# 1. Calculate the variance of percentage scored in senior secondary exams (ssc_p) and 
# store it in var_ssc. 

var_ssc <- var(placement_data$ssc_p)


# 2. Calculate the variance of scores in higher secondary exams 'hsc_p' and store it in 
# var_hsc. 


var_hsc <- var(placement_data$hsc_p)


# 3. Calculate the variance of percentage score by students in their respective degree 
# (degree_p) and store it in var_degree.

var_degree <- var(placement_data$degree_p)


