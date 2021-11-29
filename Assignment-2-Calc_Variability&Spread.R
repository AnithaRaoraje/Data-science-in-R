#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)
pharma_data<-read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)
placement_data <- read.csv('Placement_Data_Full_Class.csv',stringsAsFactors = T)

#-------------------------------------------------------------------------------
# 1. Calculate the following for the 'tenure' column of customer churn dataset:
# a. Mean 

mean(cust_churn$tenure)

# b. Median 

median(cust_churn$tenure)

# c. Range 

range(cust_churn$tenure)

# d. IQR 

IQR(cust_churn$tenure)

# e. Variance 

var(cust_churn$tenure)

# f. Standard Deviation 

sd(cust_churn$tenure)

#-------------------------------------------------------------------------------
# 2. Calculate the following for the 'ssc_p'column of student placement dataset:
# a. Mean 

mean(placement_data$ssc_p)

# b. Median 

median(placement_data$ssc_p)

# c. Range 

range(placement_data$ssc_p)

# d. IQR 

IQR(placement_data$ssc_p)

# e. Variance 

var(placement_data$ssc_p)

# f. Standard Deviation 

sd(placement_data$ssc_p)


#-------------------------------------------------------------------------------
# 3. Calculate the following for the 'age' column of pharmacovigilance dataset: 
# a. Mean 

mean(pharma_data$Age)

# b. Median 

median(pharma_data$Age)

# c. Range 

range(pharma_data$Age)

# d. IQR 

IQR(pharma_data$Age)

# e. Variance 

var(pharma_data$Age)

# f. Standard Deviation 

sd(pharma_data$Age)

