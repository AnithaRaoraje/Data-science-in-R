#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)

#-------------------------------------------------------------------------------
# 1. Create the following bar-plot where: 
# a. 'Gender' is assigned to x-axis, 'ssc_p' to y-axis, and map 'ssc_b' with col 
# aesthetic. 


ggplot(data=placement_data,aes(x=gender,y=ssc_p,col=ssc_b))+geom_boxplot()


# b. 'ssc_b' is assigned to x-axis, 'hsc_s' to y-axis, and map 'degree_t' with col 
# aesthetic. 

ggplot(data=placement_data,aes(x=ssc_b,y=hsc_s,col=degree_t))+geom_boxplot()


# c. 'Status' is assigned to x-axis, salary to y-axis, and map 'specialisation' with 
# col aesthetic. 

ggplot(data=placement_data,aes(x=status,y=salary,col=specialisation))+geom_boxplot(na.rm = T)



# d. 'Degree_t' is assigned to x-axis, 'etest_p' to y-axis, and map 'workex' with col 
# aesthetic. 

ggplot(data=placement_data,aes(x=degree_t,y=etest_p,col=workex))+geom_boxplot()



# e. 'Hsc_s' is assigned to x-axis, 'hsc_b' to y-axis, and map gender with col 
# aesthetic. 

ggplot(data=placement_data,aes(x=hsc_s,y=hsc_b,col=gender))+geom_boxplot()



# f. 'Hsc_s' is assigned to x-axis, 'etest_p' to y-axis, and map 'degree_t' with col 
# aesthetic.


ggplot(data=placement_data,aes(x=hsc_s,y=etest_p,col=degree_t))+geom_boxplot()

