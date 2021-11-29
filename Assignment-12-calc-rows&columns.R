#-------------------------------------------------------------------------------
# Reading csv file into R
placement_data <- read.csv('Placement_Data_Full_Class.csv',stringsAsFactors = T)


#-------------------------------------------------------------------------------
# 1. Check how many rows and columns are there in the data set? 

nrows <- NROW(placement_data)
ncols <- ncol(placement_data)

#-------------------------------------------------------------------------------
# 2. Extract the data of people who are having the branch as Sci&Tech who are 
# employed. Then, check how many such people are there who are employed by 
# finding the number of rows that contains the data of employed people. 

 
sci_tech1  <- placement_data$degree_t == 'Sci&Tech' & placement_data$status == 'Placed'
sci_tech <- subset(placement_data,sci_tech1 == T)
View(sci_tech)

emp_sci_tech <- nrow(sci_tech)
emp_status  <- table(placement_data$status)

#-------------------------------------------------------------------------------
# 3. Find the number of rows of female students who are from Arts and Commerce 
# stream. 

fem_arts <- placement_data$gender == 'F' & placement_data$hsc_s == 'Arts'
fem_arts <- subset(placement_data, fem_arts == T)

nrows_fem_arts <- nrow(fem_arts)

fem_comm <- placement_data$gender == 'F' & placement_data$hsc_s == 'Commerce'
fem_comm <- subset(placement_data, fem_comm == T)

nrow_fem_comm <- nrow(fem_comm)


#-------------------------------------------------------------------------------
# 4. Fetch the number records of all the students as per the following condition: 
# a. Students who are placed 

placed <- placement_data$status == 'Placed'
placed_subset  <- subset(placement_data, placed==T)

nrow_placed <- NROW(placed_subset)

# b. Students who are earning more than 300000 

mt_30000 <- placement_data$salary > 300000
subset(placement_data,mt_30000 == T) -> mt_30000

nrow_mt_300000 <- nrow(mt_30000)


# c. Also find the number of such student 


placed_300000<- placement_data$status == 'Placed' & placement_data$salary > 300000

placed_300000 <- subset(placement_data,placed_300000 == T)

nrow(placed_300000)

#-------------------------------------------------------------------------------
# 5. Find the number of columns having data type as following: 
# a. Integer

table(sapply(placement_data,class)) -> int_type
View(int_type)

# b. Factor 

table(sapply(placement_data,class)) -> factor_type
View(factor_type)


# c. Numeric

table(sapply(placement_data,class)) -> Numeric_type
View(Numeric_type)
