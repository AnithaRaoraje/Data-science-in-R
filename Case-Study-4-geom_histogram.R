#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(plotly)

#-------------------------------------------------------------------------------
# 1. Build a histogram for the 'tenure' column 

ggplot(data = cust_churn,aes(x=tenure))+geom_histogram(bins=50)

# a. Assign the fill color to be 'mediumspringgreen'

ggplot(data = cust_churn,aes(x=tenure))+geom_histogram(bins=50,fill='mediumspringgreen')


# b. Assign the boundary color to be 'azure'

ggplot(data = cust_churn,aes(x=tenure))+geom_histogram(bins=50,fill='mediumspringgreen',col='azure')


# c. Change the number of bins to be 100

ggplot(data = cust_churn,aes(x=tenure))+
  geom_histogram(bins=100,fill='mediumspringgreen',col='azure')


#-------------------------------------------------------------------------------
# 2. Build histogram for the 'MonthlyCharges' column 

ggplot(data=cust_churn,aes(x=MonthlyCharges))+geom_histogram(bins=50)

# a. Assign 'PaymentMethod' to the fill aesthetic 

ggplot(data=cust_churn,aes(x=MonthlyCharges,fill=PaymentMethod))+geom_histogram(bins=50)


# b. Assign 'OnlineBackup' to the fill aesthetic 

ggplot(data=cust_churn,aes(x=MonthlyCharges,fill=OnlineBackup))+geom_histogram(bins=50)


#-------------------------------------------------------------------------------
# 3. Build histogram for the 'TotalCharges' column 

ggplot(data=cust_churn,aes(x=TotalCharges))+
  geom_histogram(bins=100,na.rm=T)

# a. Assign 'gender' to the fill aesthetic 

ggplot(data=cust_churn,aes(x=TotalCharges,fill=gender))+
  geom_histogram(bins=100,na.rm=T)


# b. Assign 'InternetService' to the fill aesthetic 

ggplot(data=cust_churn,aes(x=TotalCharges,fill=InternetService))+
  geom_histogram(bins=100,na.rm=T)


