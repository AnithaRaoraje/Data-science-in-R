#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

#-------------------------------------------------------------------------------
# 1. Do these operations with the head() function: 
# a. Get the first 4 records from 'PhoneService' column 

head_4 <- head(cust_churn$PhoneService,4)

View(as.data.frame(head_4))

# b. Get the first 8 records from 'Contract' column 

contract_8 <- head(cust_churn$Contract,8)

View(as.data.frame(contract_8))

#-------------------------------------------------------------------------------
# 2. Do these operations with the tail() function: 
# a. Get the last record of 'TotalCharges' column 

tot_charge_last <- tail(cust_churn$TotalCharges,1)

View(as.data.frame(tot_charge_last))

# b. Get the last 5 records of 'tenure' column 

tenure_last5 <- tail(cust_churn$tenure,5)

View(as.data.frame(tenure_last5))

#-------------------------------------------------------------------------------
# 3. Find the average, minimum, maximum & range from the 'tenure' column 

avg_tenure <- mean(cust_churn$tenure)

min_tenure <- min(cust_churn$tenure)

max_tenure <- max(cust_churn$tenure)

range_tenure <- range(cust_churn$tenure)

#-------------------------------------------------------------------------------
# 4. Get 10 random values from the 'TotalCharges' column using sample() 

rand_totalcharges <- sample(cust_churn$TotalCharges,size = 10)

View(as.data.frame(rand_totalcharges))

#-------------------------------------------------------------------------------
# 5. Find the count of different levels in 'PaymentMethod' & 'Contract' columns 
# using table()

payment_count <- table(cust_churn$PaymentMethod)

View(as.data.frame(payment_count))

contract_count <- table(cust_churn$Contract)

View(as.data.frame(contract_count))
