#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)

#-------------------------------------------------------------------------------
# 1. Create a histogram for 'ssc_p' column:
# a. Assign as color 'azure' to the histogram.

ggplot(data = placement_data,aes(x=ssc_p))+geom_histogram(col='azure')

# b. Set number of bins to 50. 

ggplot(data = placement_data,aes(x=ssc_p))+geom_histogram(bins=50,col='azure')


# c. Assign a color 'cornsilk4' to the 'fill' attribute in geom_histogram function. 

ggplot(data = placement_data,aes(x=ssc_p))+geom_histogram(bins=50,col='azure',fill='cornsilk4')


# d. Give it a title as 'SSC Percentage'

ggplot(data = placement_data,aes(x=ssc_p))+
  geom_histogram(bins=50,col='azure',fill='cornsilk4')+
  labs(title = 'SSC Percentage')


#-------------------------------------------------------------------------------
# 2. Create a histogram for 'hsc_p':
# a. Assign a color 'wheat3' to the plot.

ggplot(data = placement_data,aes(x=hsc_p))+geom_histogram(col='wheat3')

# b. Set number of bins to 50. 

ggplot(data = placement_data,aes(x=hsc_p))+geom_histogram(bins=50,col='wheat3')


# c. Assign a color 'black' to the 'fill' attribute in geom_histogram function.

ggplot(data = placement_data,aes(x=hsc_p))+geom_histogram(bins=50,col='wheat3',fill='black')


# d. Give it a title as 'HSC Percentage'

ggplot(data = placement_data,aes(x=hsc_p))+
  geom_histogram(bins=50,col='wheat3',fill='black')+
  labs(title = 'HSC Percentage')



#-------------------------------------------------------------------------------
# 3. Create a histogram as per the following conditions: 
# a. Assign 'degree_p' column to the x-axis. 

ggplot(data = placement_data,aes(x=degree_p))+geom_histogram()


# b. Set the number of bins to 80. 

ggplot(data = placement_data,aes(x=degree_p))+geom_histogram(bins=80)


# c. Assign a color 'violet' to the bars.

ggplot(data = placement_data,aes(x=degree_p))+geom_histogram(bins=80,col='violet')


# d. Assign a color 'white' to the 'fill' attribute in geom_histogram function.

ggplot(data = placement_data,aes(x=degree_p))+geom_histogram(bins=80,col='violet',fill='white')


# e. Give it a title as 'Degree Percentage'

ggplot(data = placement_data,aes(x=degree_p))+
  geom_histogram(bins=80,col='violet',fill='white')+
  labs(title = 'Degree Percentage')


#-------------------------------------------------------------------------------
# 4. Create a histogram as per the following condition: 
# a. Assign 'etest_p' column to the x-axis. 

ggplot(data=placement_data,aes(x=etest_p))+geom_histogram()

# b. Set the number of bins to 100. 

ggplot(data=placement_data,aes(x=etest_p))+geom_histogram(bins=100)


# c. Assign a color 'white' to the bars.

ggplot(data=placement_data,aes(x=etest_p))+geom_histogram(bins=100,col='white')


# d. Assign a color 'black' to the 'fill' attribute in geom_histogram function. 

ggplot(data=placement_data,aes(x=etest_p))+geom_histogram(bins=100,col='white',fill='black')


# e. Give it a title as 'E-test Percentage'


ggplot(data=placement_data,aes(x=etest_p))+
  geom_histogram(bins=100,col='white',fill='black')+
  labs(title = 'E-test Percentage' )


