
#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

library(dplyr)

#-------------------------------------------------------------------------------
# 1. Get the median, variance & standard deviation for the 'tenure' column 


mvsd_tenure <- summarise(cust_churn,med_tenure = median(tenure),var_tenure = var(tenure),sd_tenure = sd(tenure))

#-------------------------------------------------------------------------------
# 2. Get the median, variance & standard deviation for the 'MonthlyCharges' column 


mvsdmon_chrg <- summarise(cust_churn,med_tenure = median(MonthlyCharges),var_tenure = var(MonthlyCharges),sd_tenure = sd(MonthlyCharges))

#-------------------------------------------------------------------------------
# 3. Get the standard deviation of 'tenure' & group it w.r.t 'PaymentMethod' column 


sd_tenure <- summarise(group_by(cust_churn,PaymentMethod),sd_tenure = sd(tenure))


#-------------------------------------------------------------------------------
# 4. Get the median of 'MonthlyCharges' & group it w.r.t 'Contract' column 

med_monthchrg <- summarise(group_by(cust_churn,Contract),sd_tenure = sd(MonthlyCharges))


#-------------------------------------------------------------------------------
# 5. Get the variance of 'TotalCharges' & group it w.r.t 'InternetService' column


var_tot_charge <- summarise(group_by(cust_churn,InternetService),var_tot_charge = var(TotalCharges,na.rm = T))

