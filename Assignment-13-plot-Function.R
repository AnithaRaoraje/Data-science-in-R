#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)

#-------------------------------------------------------------------------------
# 1. Create a plot to understand the distribution of degree_t column. 

ggplot(data=placement_data,aes(x=degree_t))+geom_bar()

#-------------------------------------------------------------------------------
# 2. Create a plot to understand the distribution of hsc_s column. 


ggplot(data=placement_data,aes(x=hsc_s))+geom_bar()


#-------------------------------------------------------------------------------
# 3. Create a plot for specialization column and give a heading as 'Specialization of 
# Candidate'. 

ggplot(data=placement_data,aes(x=specialisation))+
  geom_bar()+
  labs(title = 'Specialisation of candidate')



#-------------------------------------------------------------------------------
# 4. Create a plot using ssc_b, give it a color of 'aquamarine4', and give a heading as 
# 'Type of Board'. 

ggplot(data=placement_data,aes(x=ssc_b))+
  geom_bar(col='aquamarine4')+
  labs(title = 'Type Of Board')



