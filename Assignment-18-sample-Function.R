#-------------------------------------------------------------------------------
# Read csv file into R

pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv' , stringsAsFactors = T)

#-------------------------------------------------------------------------------
# 1. Extract some random set of values using sample function. 
# a. Select five random values from LocationID. 

loc_id <- sample(pharma_data$LocationID,size = 5)

View(as.data.frame(loc_id))

# b. Extract 25 random values from age column. 

age <- sample(pharma_data$Age, size = 25)

View(as.data.frame(age))

# c. Extract 15 random from PatientID. 

pat_id <- sample(pharma_data$PatientID , size = 15)

View(as.data.frame(pat_id))

# d. Extract 10 random values from Issues column.

issue <- sample(pharma_data$Issues , size = 10)

View(as.data.frame(issue))
