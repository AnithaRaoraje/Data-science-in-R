#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

library(dplyr)

#-------------------------------------------------------------------------------
# 1. Add a column named 'Age' and assign a random value in customer churn data set 
# that lies within a range using sample() function based in the following conditions: 
# a. If the customer is a senior citizen (SeniorCitizen==1), then the age assigned 
# to the customer lies between 56 and 100. 
# b. If the customer is not a senior citizen (SeniorCitizen==0), then the age 
# assigned to the customers lies between 16:55 


cust_churn_age <- mutate(cust_churn,
       age = ifelse(SeniorCitizen == 0,
                    sample(x=(16:55)),
                    sample(x=(56:100))
                  )
       )

View(cust_churn_age)

#-------------------------------------------------------------------------------
# 2. Create a column named 'Customer_Category' based on the following condition:
# a. The customers whose monthly charges are less than 45 will be named as 
# 'Low Paying' customers.
# b. The customers whose monthly charges are less than '90' will be named as 
# 'Medium Paying' customers.
# c. The customers whose monthly charges are greater than '90' will be named 
# as 'High Paying' customers.


customer_category <- mutate(cust_churn,
                            customer_category = ifelse(MonthlyCharges < 45,
                                                       'Low Paying',
                                                       ifelse(MonthlyCharges < 90,
                                                              'MediumPaying',
                                                              'High Paying')
                                                       )
                            )

View(customer_category)

#-------------------------------------------------------------------------------
# 3. Create a column named "Security" based on the following condition:
# a. The customers who have opted for 'Online Security' will be marked as 
# 'Secure'.
# b. The customers who have not opted for 'Online Security' will be marked as 
# 'Not Secure'


Security <- mutate(cust_churn,
                   Security = ifelse(OnlineSecurity == 'Yes',
                                     'Secure',
                                     'Not Secure'
                                     )
                   )


View(Security)
