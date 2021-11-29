#-------------------------------------------------------------------------------

# Read csv file into R

pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv' , stringsAsFactors = T)

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

placement_data <- read.csv('Placement_Data_Full_Class.csv' , stringsAsFactors = T)

temp_data <- read.csv('city_temperature.csv' , stringsAsFactors = T)
#-------------------------------------------------------------------------------
# 1. Find the structure of customer churn data set using str() function and perform the 
# following operations: 

str_churn <- str(cust_churn)

# a. Convert the data type of internet service column from vector to character. 

cust_churn$InternetService <- as.character(cust_churn$InternetService)

is.character(cust_churn$InternetService)

# b. Convert the data type of partner column from vector to character. 

cust_churn$Partner <- (as.character(cust_churn$Partner))

is.character(cust_churn$Partner)

# c. Convert the data type of total charges column from num to int. 

cust_churn$TotalCharges <- (as.integer(cust_churn$TotalCharges))

is.integer(cust_churn$TotalCharges)

is.numeric(cust_churn$TotalCharges)


str_churn <- str(cust_churn) # Structure of the customer churn data set

#-------------------------------------------------------------------------------
# 2. Find the structure of the placement data. 

placement_str <- str(placement_data)

#-------------------------------------------------------------------------------
# 3. Find the structure of the pharmacovigilance data. 

pharma_str <- str(pharma_data)

#-------------------------------------------------------------------------------
# 4. Find the structure of city temperature data set.

str_temp <- str(temp_data)
