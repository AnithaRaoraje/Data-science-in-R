#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)

library(dplyr)

# -------------------------------------------------------------------------------
# 1. Load the Customer_Churn data set. 
# a. Build the kmeans algorithm on top of 'customer_features'. For the model, the 
# number of clusters should be 3. 

customer_features <- na.omit(select(cust_churn,tenure,MonthlyCharges,TotalCharges))

kmeans(customer_features,3) -> cluster_features

# b. Calculate the clustering vector values for the monthly charges column form the 
# customer_features. 

cluster_month <- kmeans(customer_features$MonthlyCharges,3)
cluster_month

# c. Bind the monthly charges column to the clustering vector and store that data 
# in month_group. 

month_group <- cbind(month = customer_features$MonthlyCharges,cluster = cluster_month$cluster)

# d. Convert the month_group matrix into a data frame. 

as.data.frame(month_group) -> month_group


# e. Separate all the 3 clusters with their values. 

cluster1_month <- filter(month_group,cluster == 1)
cluster2_month <- filter(month_group,cluster == 2)
cluster3_month <- filter(month_group,cluster == 3)


