#------------------------------------------------------------------------------
# Reading csv file into R
pharma <- read.csv('Pharmacovigilance_audit_Data.csv')

#------------------------------------------------------------------------------
# 1. Extract a subset of pharmacovigilance data of all the female patients whose age 
# is less than 25 with issues of unclear dose. 

part1 <- pharma$Gender == 'F' & pharma$Age < 25 & pharma$Issues == 'unclear dose'

Female_under25 <- subset(pharma,part1 == T)
View(Female_under25)

#------------------------------------------------------------------------------
# 2. Extract the records of all the male patients whose age is less than 25 and 
# medication data is not available. 


part2 <- pharma$Gender == 'M' & pharma$Age < 25 & pharma$Issues == 'Medication history documenting error'

male_under25 <- subset(pharma,part2 == T)
View(male_under25)


#------------------------------------------------------------------------------
# 3. Fetch the records of children whose age equals to 8 whose documentation of 
# medication history is not available. 

part3 <- pharma$Age == 8 & pharma$Issues == 'Medication history documenting error'

children_8yrs <- subset(pharma,part3 == T)
View(children_8yrs)


#------------------------------------------------------------------------------
# 4. Extract all the records of female children of age>5 having an unclear dose. 


part4 <- pharma$Gender == 'F' & pharma$Age >5 & pharma$Issues == 'unclear dose'

female_over5 <- subset(pharma,part4 == T)
View(female_over5)



#------------------------------------------------------------------------------
# 5. Extract the records of male patients of age equals to 35 with an unclear 
# route of transmission.

part5 <- pharma$Gender == 'M' & pharma$Age == 35 & pharma$Issues == 'Unclear route'
 
male_35yrs <- subset(pharma,part5 == T)
View(male_35yrs)
