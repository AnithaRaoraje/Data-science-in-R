#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)

library(dplyr)
# -------------------------------------------------------------------------------
# 1. Load the Customer_Churn . 
# a. Start off by extracting the 'MonthlyCharges', 'tenure' & 'TotalCharges' columns 
# from the 'customer_churn' data frame. Store the result in 'customer_features' 

customer_features <- select(cust_churn,tenure,MonthlyCharges,TotalCharges)


# b. Remove any 'NA' values from 'customer_features'. 

customer_features <- na.omit(customer_features)

# c. Build the kmeans algorithm on top of 'customer_features'. For the model, the 
# number of clusters should be 3.

kmeans(customer_features,3) -> cluster_features

cluster_features

