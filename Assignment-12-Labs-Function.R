#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)

#-------------------------------------------------------------------------------
# 1. Create bar-plot as per the following condition: 
# a. Assign 'degree_t' to the x-axis. 

ggplot(data=placement_data,aes(x=degree_t))+geom_bar()

# b. Give title of the plot as 'Degree Plot'.

ggplot(data=placement_data,aes(x=degree_t))+
  geom_bar()+
  labs(title = 'Degree Plot')


# c. Assign a color 'yellowgreen'.

ggplot(data=placement_data,aes(x=degree_t))+
  geom_bar(col='yellowgreen')+
  labs(title = 'Degree Plot')


#-------------------------------------------------------------------------------
# 2. Create bar-plot as per the following condition: 
#  a. Assign 'ssc_b' to the x-axis. 

ggplot(data=placement_data,aes(x=ssc_b))+geom_bar()

# b. Give title of the plot as 'SSC Plot'.

ggplot(data=placement_data,aes(x=ssc_b))+
  geom_bar()+
  labs(title = 'SSC Plot')


# c. Assign a color 'beige'.

ggplot(data=placement_data,aes(x=ssc_b))+
  geom_bar(col='beige')+
  labs(title = 'SSC Plot')


#-------------------------------------------------------------------------------
# 3. Create bar-plot as per the following condition: 
# a. Assign 'hsc_b' to the x-axis. 

ggplot(data=placement_data,aes(x=hsc_b))+
  geom_bar()

# b. Give title of the plot as 'HSC Plot'.

ggplot(data=placement_data,aes(x=hsc_b))+
  geom_bar()+
  labs(title = 'HSC Plot')

# c. Assign a color 'cornsilk4'.

ggplot(data=placement_data,aes(x=hsc_b))+
  geom_bar(col='cornsilk4')+
  labs(title = 'HSC Plot')

#-------------------------------------------------------------------------------
# 4. Create bar-plot as per the following condition: 
# a. Assign 'specialisation' to the x-axis. 

ggplot(data=placement_data,aes(x=specialisation))+
  geom_bar()

# b. Give title of the plot as 'Specialization Plot'.

ggplot(data=placement_data,aes(x=specialisation))+
  geom_bar()+
  labs(title = 'Specialisation Plot')


# c. Assign a color 'pink'.

ggplot(data=placement_data,aes(x=specialisation))+
  geom_bar(col='pink')+
  labs(title = 'Specialisation Plot')



