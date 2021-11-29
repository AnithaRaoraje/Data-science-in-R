#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_Class.csv', stringsAsFactors = T)

#-------------------------------------------------------------------------------
# 1. Extract the last few values of the following columns from the placement dataset:
# a. Ssc_p

ssc_p  <- tail(placement_data$ssc_p)


# b. Hsc_p

hsc_p <- tail(placement_data$hsc_p)


# c. Degree_p

degree_p <- tail(placement_data$degree_p)


# d. Etest_p

e_test <- tail(placement_data$etest_p)


# e. Mba_p

mba_p <- tail(placement_data$mba_p)

# f. Salary

sal <- tail(placement_data$salary)

#-------------------------------------------------------------------------------
# 2. Check an add 12000 to the last 8 values of the salary column.

salary_add <- tail(placement_data$salary, n = 8) + 12000

View(as.data.frame(salary_add))

#-------------------------------------------------------------------------------
# 3. Check and increase the mba_p score by 10 for the last few values.

mba_add <- tail(placement_data$mba_p) + 10 

View(as.data.frame(mba_add))
