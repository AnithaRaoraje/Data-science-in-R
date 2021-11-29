#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)

#-------------------------------------------------------------------------------
# 1. Build a bar-plot: 
# a. Assign 'etest_p' column to x-axis 

ggplot(data = placement_data,aes(x=etest_p))+geom_bar()

# b. Assign 'specialisation'column to x-axis 

ggplot(data = placement_data,aes(x=specialisation))+geom_bar()


# c. Assign 'workex' to the fill attribute 

ggplot(data = placement_data,aes(x=specialisation,fill=workex))+geom_bar()


#-------------------------------------------------------------------------------
# 2. Build a bar-plot for the 'degree_t' column: 
# a. Assign the fill color to be 'orange'

ggplot(data = placement_data,aes(x=degree_t))+geom_bar(fill='orange')

# b. Assign the boundary color to be 'peru'

ggplot(data = placement_data,aes(x=degree_t))+geom_bar(fill='orange',col='peru')


#-------------------------------------------------------------------------------
# 3. Build a bar-plot for the 'hsc_s' column assigned to x-axis and then: 
# a. Assign 'hsc_b' to the fill aesthetic 

ggplot(data = placement_data,aes(x=hsc_s,fill=hsc_b))+geom_bar()


# b. Assign 'degree_t' to the fill aesthetic 

ggplot(data = placement_data,aes(x=hsc_s,fill=degree_t))+geom_bar()


# c. Change the position of bars to 'identity'

ggplot(data = placement_data,aes(x=hsc_s,fill=degree_t))+geom_bar(position = 'identity')


