#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(plotly)

#-------------------------------------------------------------------------------
# 1. Build a scatter-plot between 'TotalCharges' & 'tenure'. Map 'TotalCharges' to the y-axis & 
#   'tenure' to the 'x-axis'

ggplot(data=cust_churn,aes(x=tenure,y=TotalCharges))+geom_point(na.rm=T)

# a. Assign it the color 'wheat3'

ggplot(data=cust_churn,aes(x=tenure,y=TotalCharges))+geom_point(na.rm=T,col='wheat3')


# b. Use 'col' as an aesthetic and Map 'PaymentMethod' to col 

ggplot(data=cust_churn,aes(x=tenure,y=TotalCharges,col=PaymentMethod))+geom_point(na.rm=T)


# c. Use 'col' as an aesthetic and Map 'gender' to col 

ggplot(data=cust_churn,aes(x=tenure,y=TotalCharges,col=gender))+geom_point(na.rm=T)


# d. Map 'Dependents' to both 'col' & 'shape' aesthetics 

ggplot(data=cust_churn,aes(x=tenure,y=TotalCharges,col=Dependents,shape=Dependents))+geom_point(na.rm=T)


#-------------------------------------------------------------------------------
# 2. Build a scatter-plot between 'tenure' & 'MonthlyCharges'. Map 'tenure' to the y-axis & 
#   'MonthlyCharges' to the 'x-axis'

ggplot(data=cust_churn,aes(x=MonthlyCharges,y=tenure))+geom_point()

# a. Assign it the color 'yellowgreen'

ggplot(data=cust_churn,aes(x=MonthlyCharges,y=tenure))+geom_point(col='yellowgreen')


# b. Use 'col' as an aesthetic and Map 'InternetService' to col 

ggplot(data=cust_churn,aes(x=MonthlyCharges,y=tenure,col=InternetService))+geom_point()


# c. Use 'col' as an aesthetic and Map 'Contract' to col 

ggplot(data=cust_churn,aes(x=MonthlyCharges,y=tenure,col=Contract))+geom_point()


