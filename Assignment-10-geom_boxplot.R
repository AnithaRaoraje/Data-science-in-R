#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)

#-------------------------------------------------------------------------------
# 1. Create a box-plot between 'etest_p' & 'workex'. Map 'etest_p' to the y-axis & 
#   'workex' to the 'x-axis'
# a. Assign it a fill color of 'wheat3'

ggplot(data = placement_data,aes(y=etest_p,x=workex))+geom_boxplot(fill='wheat3')


# b. Assign it a boundary color of 'snow3'

ggplot(data = placement_data,aes(y=etest_p,x=workex))+geom_boxplot(fill='wheat3',col='snow3')

# c. Give a title as 'E-test & Workex'

ggplot(data = placement_data,aes(y=etest_p,x=workex))+geom_boxplot(fill='wheat3',col='snow3')+
  labs(title = 'E - test & Workex')


#-------------------------------------------------------------------------------
# 2. Build a box-plot between 'etest_p' & 'gender'. Map 'etest_p' to the y-axis & 'gender' 
# to the 'x-axis'
# a. Assign 'degree_t' to the fill aesthetic

ggplot(data = placement_data,aes(y=etest_p,x=gender,fill=degree_t))+geom_boxplot()


# b. Assign 'hsc_s' to the fill aesthetic

ggplot(data = placement_data,aes(y=etest_p,x=gender,fill=hsc_s))+geom_boxplot()


# c. Give a title as 'E-test & Gender'

ggplot(data = placement_data,aes(y=etest_p,x=gender,fill=degree_t))+geom_boxplot()+
  labs(title = 'E-test & Gender')


#-------------------------------------------------------------------------------
# 3. Build a box-plot between 'etest_p' & 'specialisation'
# a. Assign 'ssc_b' to the fill aesthetic 

ggplot(data = placement_data,aes(y=etest_p,x=specialisation,fill=ssc_b))+geom_boxplot()


# b. Assign 'hsc_b' to the fill aesthetic

ggplot(data = placement_data,aes(y=etest_p,x=specialisation,fill=hsc_b))+geom_boxplot()


# c. Give a title as 'E-test & Specialization'

ggplot(data = placement_data,aes(y=etest_p,x=specialisation,fill=ssc_b))+geom_boxplot()+
  labs(title = 'E-test & Specialization')

