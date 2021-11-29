#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_Class.csv', stringsAsFactors = T)

#-------------------------------------------------------------------------------
# 1. Check the first five values of the following columns using the head function:
# a. Sl_no

variable <- placement_data$sl_no
output <- 'sl_no'

output <- head(variable , n = 5)
View(as.data.frame(output))

# b. Gender

variable <- placement_data$gender
output <- 'gender'

output <- head(variable , n = 5)
View(as.data.frame(output))


# c. Ssc_p

variable <- placement_data$ssc_p
output <- 'ssc_p'

output <- head(variable , n = 5)
View(as.data.frame(output))


# d. Ssc_b

variable <- placement_data$ssc_b
output <- 'ssc_b'

output <- head(variable , n = 5)
View(as.data.frame(output))


# e. Hsc_p

variable <- placement_data$hsc_p
output <- 'hsc_p'

output <- head(variable , n = 5)
View(as.data.frame(output))

# f. Degree_p

variable <- placement_data$degree_p
output <- 'degree_p'

output <- head(variable , n = 5)
View(as.data.frame(output))

# g. Degree_t

variable <- placement_data$degree_t
output <- 'degree_t'

output <- head(variable , n = 5)
View(as.data.frame(output))

# h. Etest_p

variable <- placement_data$etest_p
output <- 'etest_p'

output <- head(variable , n = 5)
View(as.data.frame(output))

# i. Specialization

variable <- placement_data$specialisation
output <- 'specialisation'

output <- head(variable , n = 5)
View(as.data.frame(output))

# j. Mba_p

variable <- placement_data$mba_p
output <- 'mba_p'

output <- head(variable , n = 5)
View(as.data.frame(output))

# k. Salary

variable <- placement_data$salary
output <- 'salary'

output <- head(variable , n = 5)
View(as.data.frame(output))

#-------------------------------------------------------------------------------
# 2. Add 5000 to the first six data of the salary column.

sal_6 <- head(placement_data$salary) + 5000
View(as.data.frame(sal_6))

#------------- OR --------------

sal <- placement_data[c(1:6),15] + 5000
View(as.data.frame(sal))
#-------------------------------------------------------------------------------
# 3. Add 7.5 to the first 10 values of e_test column.

e_test <- head(placement_data$etest_p, n = 10 ) + 7.5
View(as.data.frame(e_test))

#------------- OR --------------

e_test1 <- placement_data[c(1:10),11] + 7.5
View(as.data.frame(e_test1))

#-------------------------------------------------------------------------------
# 4. Reduce the mba_p score by 5 for the first three values.

mba_p <- head(placement_data$mba_p, n = 3) - 5
View(as.data.frame(mba_p))

#------------- OR --------------

mba_p1 <- placement_data[c(1:3),13] - 5
View(as.data.frame(mba_p1))
