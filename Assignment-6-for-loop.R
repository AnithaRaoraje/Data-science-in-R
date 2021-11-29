#-------------------------------------------------------------------------------
# Importing placements csv and customer churn csv file into R
placement_data <- read.csv('Placement_Data_Full_Class.csv')
cust_churn <- read.csv('customer_churn.csv')

#-------------------------------------------------------------------------------

# 1. Using for loop, calculate the number of students from the placement dataset 
# according to the following conditions: 
# a) Students who are placed. 
variable <- placement_data$status
count <- 0

for (i in 1:length(variable)) {
  if (variable[i] == 'Placed'){
    count=count+1
  }
}

count

table(variable)
#-------------------------------------------------------------------------------
# b) Students who are from Science stream. 

variable1 <- placement_data$degree_t
count <- 0

for (i in 1:NROW(variable1)) {
  if (variable1[i] == 'Sci&Tech'){
    count=count+1
  }
}

count

table(placement_data$degree_t)

#-------------------------------------------------------------------------------
# c) Students who are from Commerce stream. 

variable3 <- placement_data$degree_t

count <- 0

for (i in 1:NROW(variable3)) {
  if (variable3[i] == 'Comm&Mgmt'){
    count=count+1
  }
}

count

table(placement_data$degree_t)
#-------------------------------------------------------------------------------
# 2. Using for loop, calculate the number of students from the placement dataset 
# who score more than 80.0 in higher secondary exams (hsc_p). 

req_var <- placement_data$hsc_p

count <- 0

for (i in 1:NROW(req_var)) {
  if (req_var[i] > 80.0) {
    count = count+1
  }
}

count

table(req_var)
#-------------------------------------------------------------------------------
# 3. Calculate the number of students who scored more than 75% in MBA (mba_p) 
# and got placed from campus placement drives. 

req_var <- placement_data$mba_p

count <- 0

for (i in 1:NROW(req_var)) {
  if (req_var[i] > 75 & variable[i] == 'Placed' ) {
    count = count+1
  }
}

count 


mba75 <- req_var > 75 & variable == 'Placed'
subset(placement_data,mba75 == T) -> mba75T
View(mba75T)
table(mba75T$mba_p)
#-------------------------------------------------------------------------------
# 4. Calculate the number of senior citizens from customer churn data set who are 
# using internet service as 'DSL'. 


calc_var <- cust_churn$SeniorCitizen
reqvar <- cust_churn$InternetService

count <- 0

for (i in 1:NROW(calc_var)) {
  if (calc_var[i] == 1 & reqvar[i] == 'DSL'){
    count=count+1
  }
}

count



Int <-calc_var == 1 & req_var == 'DSL'
subset(cust_churn,Int==T) -> senior_dsl
View(senior_dsl)

#-------------------------------------------------------------------------------