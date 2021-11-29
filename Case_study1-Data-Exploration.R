#Reading a csv file into R studio

read_file <- 'customer_churn.csv'
cust_churn = read.csv(read_file)

# ------------------------------------------------------------------------------
# 1. Extract 'InternetService' column and store it in'customer_internet_service'


customer_internet_service <- cust_churn$InternetService
View(as.data.frame(customer_internet_service))

# ------------------------------------------------------------------------------
# 2. Extract 'PaperlessBilling' column and store it in'customer_Paperless_Billing'

customer_Paperless_Billing <- cust_churn$PaperlessBilling
View(as.data.frame(customer_Paperless_Billing))


# ------------------------------------------------------------------------------
# 3. Extract 'StreamingTV' column and store it in'customer_Streaming_TV'

customer_Streaming_TV <- cust_churn$StreamingTV
View(as.data.frame(customer_Streaming_TV))


# ------------------------------------------------------------------------------
# 4. Extract the 3rd, 6th and 9th columns from the 'customer_churn' data.frame & 
# store it in 'customer_random_columns

customer_random_columns <- cust_churn[,c(3,6,9)]
View(as.data.frame(customer_random_columns))

# ------------------------------------------------------------------------------
# 5. Extract all the columns from column number-10 to column-number 20 and store 
# the result in 'customer_10_20'

customer_10_20 <- cust_churn[,10:20]
View(as.data.frame(customer_10_20))


# ------------------------------------------------------------------------------
# 6. Extract only these row numbers: 65, 765, 3726 & 7000 and store the result in
# 'customer_random_rows'

customer_random_rows <- cust_churn[c(65,765,3726,7000),]
View(as.data.frame(customer_random_rows))


# ------------------------------------------------------------------------------
# 7. Extract all the rows starting from row number-655 to row number-6550 & store the 
# result in 'customer_continuous_rows'

customer_continuous_rows <- cust_churn[655:6550,]
View(as.data.frame(customer_continuous_rows))

# ------------------------------------------------------------------------------
# 8. Extract row numbers- 10, 100 & 1000 & column numbers- 5, 10, 15 & store the 
# result in 'customer_random_data'

customer_random_data <- cust_churn[c(10,100,1000),c(5,10,15)]
View(as.data.frame(customer_random_data))

