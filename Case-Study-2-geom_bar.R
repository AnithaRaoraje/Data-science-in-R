#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(plotly)

#-------------------------------------------------------------------------------
# 1. Build a bar-plot for the 'PhoneService' column 
# a. Assign the fill color to be 'pink'

ggplot(data = cust_churn,aes(x=PhoneService))+geom_bar(fill='pink')


# b. Assign the boundary color to be 'peru'

ggplot(data = cust_churn,aes(x=PhoneService))+geom_bar(fill='pink',col='peru')


#-------------------------------------------------------------------------------
# 2. Build a bar-plot for the 'InternetService' column 
# a. Assign 'InternetService' to the fill aesthetic 

ggplot(data = cust_churn,aes(x=InternetService,fill=InternetService))+geom_bar()


# b. Assign 'Contract' to the fill aesthetic 

ggplot(data = cust_churn,aes(x=InternetService,fill=Contract))+geom_bar()


# c. Change the position of bars to 'identity'

ggplot(data = cust_churn,aes(x=InternetService,fill=Contract))+geom_bar(position = 'identity')


#-------------------------------------------------------------------------------
# 3. Build a bar-plot for 'TechSupport' column 
# a. Assign 'Churn' to the fill aesthetic

ggplot(data = cust_churn,aes(x=TechSupport,fill=Churn))+geom_bar()


