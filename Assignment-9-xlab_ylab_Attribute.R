#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_Class.csv',stringsAsFactors = T)



#-------------------------------------------------------------------------------
# 1. Create a plot using plot() function for hsc_s column, assign a color 'orange', and 
# label x-axis as 'Higher Secondary Subjects'. 

plot(placement_data$hsc_s,col='orange',xlab='Higher Secondary Subjects')

#-------------------------------------------------------------------------------
# 2. Create a plot using plot() function for 'degree_t' column: 
# a. Assign a color 'palegreen4'

plot(placement_data$degree_t,col='palegreen4')

# b. Label x-axis as 'Percentage in Graduation'

plot(placement_data$degree_t,col='palegreen4',xlab='Percentage in graduation')


# c. Label y-axis as 'Number of Students'

plot(placement_data$degree_t,col='palegreen4',xlab='Percentage in graduation',ylab='Number of students')


#-------------------------------------------------------------------------------
# 3. Create a plot using plot() function for 'specialisation' column: 
#   . Assign a color 'wheat3'
# a. Label x-axis as 'Specialization Field'

plot(placement_data$specialisation,col='wheat3',xlab='Specialisation Field')

# b. Label y-axis as 'Number of Students'

plot(placement_data$specialisation,col='wheat3',xlab='Specialisation Field',ylab='Number of Students')


# c. Give a heading using 'main' attribute as 'Distribution of Specialization'


plot(placement_data$specialisation,col='wheat3',
     xlab='Specialisation Field',
     ylab='Number of Students',
     main='Distribution of Specialization')

