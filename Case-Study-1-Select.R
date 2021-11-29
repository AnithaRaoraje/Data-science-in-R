
#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

library(dplyr)

#-------------------------------------------------------------------------------
# 1. Extract these individual columns: 
# a. Extract the 5th column & store it in 'customer_5'

customer_5 <- select(cust_churn,5)


# b. Extract the 15th column & store it in 'customer_15'

customer_15 <- select(cust_churn,15)

#-------------------------------------------------------------------------------
# 2. Extract the column numbers 3,6,9,12,15 & 18 and store the result in 
# 'customer_3_multiple'


customer_3_multiple <- select(cust_churn,3,6,9,12,15,18)


#-------------------------------------------------------------------------------
# 3. Extract all the columns from column number-10 to column number-20 and store 
# the result in 'c_10_20'

c_10_20 <- select(cust_churn,10:20)


#-------------------------------------------------------------------------------
# 4. Extract all the columns which start with letter 'P' & store it in'customer_P'

customer_p <- select(cust_churn,starts_with('P'))

#-------------------------------------------------------------------------------
# 5. Extract all the columns which end with letter 's' & store it in 'customer_s'

customer_s <- select(cust_churn,ends_with('s'))

