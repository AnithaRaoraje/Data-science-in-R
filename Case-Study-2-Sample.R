
#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

library(dplyr)

#-------------------------------------------------------------------------------
# 1. Extract 333 random records from the customer_churn data frame & store the result 
# in'customer_333'

customer_333 <- sample_n(cust_churn,size = 333)

View(customer_333)

#-------------------------------------------------------------------------------
# 2. Extract 1000 random records from the customer_churn data frame & store the 
# result in 'customer_1000'


sample_n(cust_churn,1000)->customer_1000
View(customer_1000)


#-------------------------------------------------------------------------------
# 3. Randomly extract 23% of the records from the customer_churn data frame & store 
# the result in 'customer_23_percent'


sample_frac(cust_churn,0.23)->customer_23_percent
View(customer_23_percent)

#-------------------------------------------------------------------------------
# 4. Get the count of different levels from the 'PaymentMethod' column 


count(cust_churn,PaymentMethod) -> count_levels

#-------------------------------------------------------------------------------
# 5. Get the count of different levels from the 'Churn' column

count(cust_churn,Churn) -> count_levels_churn


