# Reading csv file into R
placement_data <- read.csv('Placement_Data_Full_Class.csv')
cust_churn <- read.csv('customer_churn.csv')
#-------------------------------------------------------------------------------

# 1. Using switch case, check 67th row of hsc_s column from placement data: 
#   If it is "Science", then add 5 extra marks in degree_p score. 
# If it is "Commerce", then add 3 extra marks in degree_p score. 

degree_67 <- switch (placement_data$hsc_s[67],
                                       'Science' = placement_data$degree_p[67]+5,
                                       'Commerce' = placement_data$degree_p[67]+3
)

#-------------------------------------------------------------------------------

# 2. Check 74th row of ssc_b column in the placement data set: 
#   If it is "Others", then add 3 as grace marks in hsc_p for the 74th row. 
# If it is "Central", then add 5 as grace marks in hsc_p for the 74th row. 

hsc_74 <- switch (placement_data$ssc_b[74],
                 'Others' = placement_data$hsc_p[74]+3,
                 'Central' = placement_data$hsc_p[74]+5
)

#-------------------------------------------------------------------------------

# 3. Using switch case, check 4th row of contract column from customer churn data: 
#   If it is "One Year", then give a 20% discount in total charges. 
# If it is "Month-to-month", then give a discount of 5% in total charges. 

contract_4 <- switch (cust_churn$Contract[4],
                      'One year' = cust_churn$TotalCharges[4]*0.8,
                      'Month-to-month' = cust_churn$TotalCharges[4]*0.95
)


#-------------------------------------------------------------------------------

# 4. Check 14th row of Internet Service column in the customer churn data set: 
#   If the customer is using "Fiber optic", then give a discount of 15% in total 
# charges. 
# If it is "DSL", then give a discount of 10% in total charges.

service_14 <- switch (cust_churn$InternetService[14],
  'Fiber optic' = cust_churn$TotalCharges[14]*0.85,
  'DSL' = cust_churn$TotalCharges[14]*0.9
)

#-------------------------------------------------------------------------------