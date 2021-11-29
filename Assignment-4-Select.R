#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_class.csv',stringsAsFactors = T)

pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)

library(dplyr)

#-------------------------------------------------------------------------------
# 1. Extract the following columns using placement dataset: 
# a. Extract the specialization column (12th column) and store it in s_student. 

s_student <- select(placement_data,12)

# b. Extract the salary column (15th column) and store it in s_salary. 

s_salary <- select(placement_data,15)

# c. Extract the higher secondary percentage column (5th column) and store it 
# in hsc_percent. 

hsc_percent <- select(placement_data,5)

# 2. Extract the following columns from the pharmacovigilance data set: 
# a. Extract 1st, 3rd, and 5th column and store it in col_135. 

col_135 <- select(pharma_data,1,3,5)


# b. Extract the 2nd and 6th column and store it in col_26. 

col_26 <- select(pharma_data,2,6)


# 3. Extract column number 1 to 5 from placement data set.

col_1to5 <- select(pharma_data,1:5)

