#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_class.csv',stringsAsFactors = T)

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

library(dplyr)

#-------------------------------------------------------------------------------
# Using customer churn dataset: 
# 1. Calculate the standard deviation of 'tenure' column and store it in sd_tenure. 

sd_tenure <- sd(cust_churn$tenure)

# 2. Calculate the standard deviation of 'Monthly Charges' column and store it in 
# sd_MonthlyCharges. 

sd_monthlycharges <- sd(cust_churn$MonthlyCharges)


# 3. Calculate the standard deviation of 'Total Charges' column and store it in 
# sd_TotalCharges. 

sd_totalcharges <- sd(cust_churn$TotalCharges,na.rm = T)

#-------------------------------------------------------------------------------
# Using student's placement dataset: 
# 1. Calculate the standard deviation of etest and store it in sd_etest. 

sd_etest <- sd(placement_data$etest_p)


# 2. Calculate the standard deviation of salary and store it in sd_salary. 

sd_salary <- sd(placement_data$salary,na.rm = T)

# 3. Calculate the standard deviation of percentage score by students in MBA (mba_p) 
# and store it in sd_mba.

sd_mba <- sd(placement_data$mba_p)

