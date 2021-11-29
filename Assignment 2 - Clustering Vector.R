#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)

library(dplyr)

# -------------------------------------------------------------------------------
# 1. Load the Customer_Churn dataset. 
# a. Build the kmeans algorithm on top of 'customer_features'. For the model, the 
# number of clusters should be 3. 


customer_features <- na.omit(select(cust_churn,tenure,MonthlyCharges,TotalCharges))

kmeans(customer_features,3) -> cluster_features


# b. Calculate the clustering vector values for the monthly charges column form the 
# customer_features.


cluster_month <- kmeans(customer_features$MonthlyCharges,3)
cluster_month

