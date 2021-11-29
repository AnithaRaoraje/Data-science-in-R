#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)
placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)

#-------------------------------------------------------------------------------
# 1. Build a histogram for the 'TotalCharges' column. Map 'gender' onto fill aesthetic.
# a. Facet the plot w.r.t 'gender' column

ggplot(data = cust_churn,aes(x=TotalCharges,fill=gender))+geom_histogram(bins=20,na.rm=T)+facet_grid(~gender)


#-------------------------------------------------------------------------------
# 2. Build a box-plot between 'tenure' & 'InternetService'. Map 'tenure' on the y-axis & 
#   'InternetService' on the x-axis. Map 'Contract' to the fill aesthetic
# a. Facet the plot w.r.t 'Contract' column


ggplot(data = cust_churn,aes(x=InternetService,y=tenure,fill=Contract))+geom_boxplot()+facet_grid(~Contract)



#-------------------------------------------------------------------------------
# 3. Build a scatter-plot between 'etest_p' & 'mba_p'. Map 'etest_p' on the y-axis & 
#   'mba_p' on the x-axis. Map 'degree_t' onto col aesthetic 
# a. Facet the plot w.r.t 'degree_t' column


ggplot(data = placement_data,aes(x=mba_p,y=etest_p,col=degree_t))+geom_point()+facet_grid(~degree_t)


