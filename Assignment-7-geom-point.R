#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)

#-------------------------------------------------------------------------------
# 1. Create a scatter-plot: 
# a. Assign 'hsc_p' column to x-axis and 'ssc_p' column to y-axis. 

ggplot(data=placement_data,aes(x=hsc_p,y=ssc_p))+geom_point()

# b. Map 'gender' to the col aesthetic.

ggplot(data=placement_data,aes(x=hsc_p,y=ssc_p,col=gender))+geom_point()


# c. Map 'workex' to the col aesthetic.

ggplot(data=placement_data,aes(x=hsc_p,y=ssc_p,col=workex))+geom_point()


# d. Map 'status' to the col aesthetic.

ggplot(data=placement_data,aes(x=hsc_p,y=ssc_p,col=status))+geom_point()


# e. Add a title to the plot as 'Comparing HSC & SSC Percentage'.


ggplot(data=placement_data,aes(x=hsc_p,y=ssc_p,col=gender))+geom_point()+labs(title='Comparing HSC & SSC Percentage')


#-------------------------------------------------------------------------------
# 2. Create a scatter-plot: 
# a. Assign 'degree_p' column to the x-axis and 'mba_p' to the y-axis. 

ggplot(data=placement_data,aes(x=degree_t,y=mba_p))+geom_point()

# b. Use 'col' as an aesthetic and assign it the column 'status'.

ggplot(data=placement_data,aes(x=degree_t,y=mba_p,col=status))+geom_point()


# c. Use 'col' as an aesthetic and assign it the column 'specialisation'.

ggplot(data=placement_data,aes(x=degree_t,y=mba_p,col=specialisation))+geom_point()



# d. Add a title to the plot as 'Understanding Degree & MBA Percentage'.


ggplot(data=placement_data,aes(x=degree_t,y=mba_p,col=specialisation))+
                                geom_point()+
                                labs(title='Understanding Degree & MBA Percentage')


#-------------------------------------------------------------------------------
# 3. Create a scatter-plot: 
# a. Assign 'etest_p' column to the x-axis and 'salary' to the y-axis. 

ggplot(data=placement_data,aes(x=etest_p,y=salary))+geom_point(na.rm=T)



# b. Use 'col' as an aesthetic and assign it the column 'workex'.

ggplot(data=placement_data,aes(x=etest_p,y=salary,col=workex))+geom_point(na.rm=T)


# c. Use 'col' as an aesthetic and assign it the column 'gender'.

ggplot(data=placement_data,aes(x=etest_p,y=salary,col=gender))+geom_point(na.rm=T)


# d. Add a title to the plot as 'E-test & Salary'.

ggplot(data=placement_data,aes(x=etest_p,y=salary,col=workex))+
                                geom_point(na.rm=T)+
                                labs(title = 'E - test & Salary')


