#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_class.csv',stringsAsFactors = T)

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

library(dplyr)

#-------------------------------------------------------------------------------
# Using customer churn dataset: 
# 1. Calculate the median of 'tenure' column and store it in med_tenure. 

med_tenure <- median(cust_churn$tenure)


# 2. Calculate the median of 'Monthly Charges' column and store it in 
# med_MonthlyCharges. 

med_MonthlyCharges <- median(cust_churn$MonthlyCharges)

# 3. Calculate the median of 'Total Charges' column and store it in med_TotalCharges. 

med_totalcharges <- median(cust_churn$TotalCharges , na.rm = T)

#-------------------------------------------------------------------------------
# Using student placement data set: 
# 1. Calculate the median of percentage scored in senior secondary exams (ssc_p) and 
# store it in med_ssc. 

med_ssc <- median(placement_data$ssc_p)



# 2. Calculate the median of scores in higher secondary exams 'hsc_p' and store it in 
# med_hsc. 

med_hsc <- median(placement_data$hsc_p)



# 3. Calculate the median of percentage score by students in their respective degree 
# (degree_p) and store it in med_degree.

med_degree <- median(placement_data$degree_p)

