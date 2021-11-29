#Reading a csv file into R studio

read_file <- 'customer_churn.csv'
cust_churn = read.csv(read_file)

# ------------------------------------------------------------------------------
# Add 5 to the fifth record of 'MonthlyCharges' column 

questn1 <- cust_churn$MonthlyCharges[1]*3

# ------------------------------------------------------------------------------
# Subtract 9.65 from the sixth record of 'MonthlyCharges' column 

questn2 <- cust_churn$MonthlyCharges[6]-9.65

# ------------------------------------------------------------------------------
# Multiply the 1st record of 'MonthlyCharges' column with 3 

questn3 <- cust_churn$MonthlyCharges[1]*3

# ------------------------------------------------------------------------------
# Divide the 37th record of 'MonthlyCharges' column with 3

questn4 <- cust_churn$MonthlyCharges[37]/3

# ------------------------------------------------------------------------------
#  Check if the value of 'tenure' in the 1st row is greater than the value of 
# 'tenure' in the 10th row 

questn5 <- cust_churn$tenure[1]>cust_churn$tenure[10]


# ------------------------------------------------------------------------------
# Check if the value of 'tenure' in the 3rd row is equal to value of 'tenure'
# in the 5th row

questn6 <- cust_churn$tenure[3]==cust_churn$tenure[5]

# ------------------------------------------------------------------------------
#  Get the count of those customers who have subscribed to both 
# "TechSupport" & "StreamingTV"


questn7 <- cust_churn$TechSupport == 'Yes' & cust_churn$StreamingTV == 'Yes'
View(as.data.frame(questn7))
table(questn7)


# ------------------------------------------------------------------------------

# Extract those customers whose 'InternetService' is either 'DSL' or 'Fiber 
# optic' & store the result in 'Internet_dsl_fiber'

Int <- cust_churn$InternetService == 'DSL' | cust_churn$InternetService == 'Fiber optic'
subset(cust_churn,Int==T) -> Internet_dsl_fiber
View(Internet_dsl_fiber)
table(Internet_dsl_fiber$InternetService)

