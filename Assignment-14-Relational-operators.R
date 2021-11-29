#-------------------------------------------------------------------------------
placement_data <- read.csv('Placement_Data_Full_Class.csv',stringsAsFactors = T)

#-------------------------------------------------------------------------------
# 1. Extract the data of the students who are: 
# a. Having SSC score greater than or equal to 65. 

value1 <- 65.00

variable1 <- placement_data$ssc_p

output <- 'ssc_gt65'

output <- variable >= value

subset(placement_data,output == T) -> output

# b. Having HSC score greater than 80. 

value1 <- 80.00

variable1 <- placement_data$hsc_p

output <- 'hsc_gt80'

output <- variable >= value

subset(placement_data,output == T) -> output


# c. Earning more than 200000. 

value1 <- 200000

variable1 <- placement_data$salary

output <- 'sal_gt200000'

output <- variable >= value

subset(placement_data,output == T) -> output

#-------------------------------------------------------------------------------
# 2. Extract the data of the students who are: 
# a. Placed and earning salary less than 250000. 

value1 <- 250000
variable1 <- placement_data$salary

value2 <- 'Placed'
variable2 <- placement_data$status

output <- 'placed_lt250000'


output <- variable1 < value1 & variable2 == value2

subset(placement_data,output == T) -> output


# b. From commerce and management having earning salary less than 600000. 


value1 <- 600000
variable1 <- placement_data$salary

value2 <- 'Comm&Mgmt'
variable2 <- placement_data$degree_t

output <- 'deg_sal'

output <- variable1 < value1 & variable2 == value2

subset(placement_data,output == T) -> output


# c. From Science stream with etest score greater than 90. 

value1 <- 90.00
variable1 <- placement_data$etest_p

value2 <- 'Science'
variable2 <- placement_data$hsc_s

output <- 'science_etest'


output <- variable1 > value1 & variable2 == value2

subset(placement_data,output == T) -> output

#-------------------------------------------------------------------------------
# 3. Extract the data of the students who are: 
# a. From Central board studying Arts. 


value1 <- 'Central'
variable1 <- placement_data$hsc_b

value2 <- 'Arts'
variable2 <- placement_data$hsc_s

output <- 'central_arts'


output <- variable1 == value1 & variable2 == value2

subset(placement_data,output == T) -> output


# b. From Sci&Tech with e_test score equals to 75. 

value1 <- 'Sci&Tech'
variable1 <- placement_data$degree_t

value2 <- 75.00
variable2 <- placement_data$etest_p

output <- 'science_eq75'


output <- variable1 == value1 & variable2 == value2

subset(placement_data,output == T) -> output


# c. Placed with a salary of 450000.

value1 <- 'Placed'
variable1 <- placement_data$status

value2 <- 450000
variable2 <- placement_data$salary

output <- 'placed_sal'


output <- variable1 == value1 & variable2 == value2

subset(placement_data,output == T) -> output