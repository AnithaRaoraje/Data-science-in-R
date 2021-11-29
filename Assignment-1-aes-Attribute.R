#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)

#-------------------------------------------------------------------------------
# 1. Create the following bar-plot where: 
# a. PhoneService column is assigned to the x aesthetic. 

ggplot(data=cust_churn,aes(x=PhoneService))+geom_bar(fill = 'aquamarine4',col='black')


#-------------------------------------------------------------------------------
# b. Gender column is assigned to the x aesthetic. 

ggplot(data=cust_churn,aes(x=gender))+geom_bar(fill = 'darkolivegreen3',col='black')


#-------------------------------------------------------------------------------
# c. InternetService is assigned to x aesthetic and MonthlyCharges to aesthetic. 

ggplot(data=cust_churn,aes(x=InternetService,y=MonthlyCharges))+geom_boxplot(fill='skyblue')

#-------------------------------------------------------------------------------
# d. MonthlyCharges is assigned to x aesthetic and SeniorCitizen to aesthetic. 


ggplot(data = cust_churn, aes(x=MonthlyCharges, fill=SeniorCitizen))+
                              geom_histogram(bins = 10,col= "black")+
                              facet_grid(~SeniorCitizen)


#-------------------------------------------------------------------------------
# e. TotalCharges is assigned to x aesthetic and Tenure to aesthetic. 


ggplot(data=cust_churn,aes(x=TotalCharges,y=tenure))+geom_point(col='aquamarine4',na.rm=T)


#-------------------------------------------------------------------------------
# f. StreamingTV is assigned to x aesthetic and SeniorCitizen to aesthetic. 


ggplot(data=cust_churn,aes(x=StreamingTV,fill=SeniorCitizen))+geom_bar()+facet_grid(~SeniorCitizen)


#-------------------------------------------------------------------------------
# g. Dependents is assigned to x aesthetic and Partner to aesthetic.


ggplot(data=cust_churn,aes(x=Dependents,fill=Partner))+geom_bar(col='Black')

