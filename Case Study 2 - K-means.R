#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)

library(dplyr)

# -------------------------------------------------------------------------------
# 1. Building the k-means clustering algorithm: 
# a. Start off by extracting the 'MonthlyCharges', 'tenure' & 'TotalCharges' columns 
# from the 'customer_churn' data.frame. Store the result in 'customer_features' 

customer_features <- select(cust_churn,tenure,MonthlyCharges,TotalCharges)


# b. Remove any 'NA' values from 'customer_features' if present 

customer_features <- na.omit(customer_features)



# c. Build the kmeans algorithm on top of 'customer_features'. Here, the number of 
# clusters should be 3 

kmeans(customer_features,3) -> cluster_features

cluster_features

# d. Bind the clustering vector to 'customer_features'. 

cbind(customer_features,clusters = cluster_features$cluster) -> cluster_group


# e. Extract observations belonging to individual clusters

cluster_group1 <- filter(cluster_group,clusters == 1)
cluster_group2 <- filter(cluster_group,clusters == 2)
cluster_group3 <- filter(cluster_group,clusters == 3)
