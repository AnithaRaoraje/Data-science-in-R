#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

library(dplyr)
library(sqldf)
library(RSQLite)
#-------------------------------------------------------------------------------
# 1. Select the 'OnlineBackup' column from the customer_churn dataframe & store 
# the result in 'customer_onine_backup' 

customer_online_backup <- sqldf('select OnlineBackup from cust_churn')
View(customer_online_backup)

#-------------------------------------------------------------------------------
# 2. Select the 'StreamingTV', 'StreamingMovies' & 'Contract' columns and store
# the result in 'customer_streaming_contract' 

customer_streaming_contract <- sqldf('select StreamingTV,StreamingMovies,Contract from cust_churn')
View(customer_streaming_contract)

#-------------------------------------------------------------------------------
# 3. Select all the customers whose payment method is 'mailed check' and store 
# the result in 'customer_mail' 


customer_mail <- sqldf("select * from cust_churn where PaymentMethod = 'Mailed check'")

View(customer_mail)

#-------------------------------------------------------------------------------
# 4. Select all the Female customers whose tenure is of 1 month & Payment Method
# is 'mailed check' and store the result in 'customer_random_selection


customer_random_selection <- sqldf("select * from cust_churn where gender = 'Female' and 
                                   PaymentMethod = 'Mailed check' and tenure = 1")

View(customer_random_selection)
