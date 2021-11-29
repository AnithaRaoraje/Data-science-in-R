
# Reading Pharmacovigilance csv data into Rstudio

read_file <- ('Pharmacovigilance_audit_Data.CSV')
pharma_data <- read.csv(read_file)

#------------------------------------------------------------------------------

# 1. Extract the following columns from the data set: 
# a. Age and Issues. 
colno.1 <- 2
colno.2 <- 5
pharma_data[,c(colno.1,colno.2)] -> P_Ageissue
View(P_Ageissue)

# b. Patient ID and Drug ID. 

colno.1 <- 6
colno.2 <- 3
pharma_data[,c(colno.1,colno.2)] -> P_pat_drug_ID
View(P_pat_drug_ID)

# C. Gender, Age, and Issues. 

colno.1 <- 4
colno.2 <- 5
colno.3 <- 2
pharma_data[,c(colno.1,colno.2,colno.3)] -> P_gen_age_issues
View(P_gen_age_issues)

#-------------------------------------------------------------------------------
# 2. Extract the following rows: 

# a. Row numbers 1,2,3,4, and 5 

rowno. <- 1:5
pharma_data[rowno.,] -> P_1to5
View(P_1to5)


# b. Rows from 15 to 75 

rowno. <- 15:75
pharma_data[rowno.,] -> P_15to75
View(P_15to75)


# c. Rows from 100-150 


rowno. <- 100:150
pharma_data[rowno.,] -> P_100to150
View(P_100to150)

#------------------------------------------------------------------------------

# 3. Extract the following rows and columns: 
# a. Columns (1,2,4) and rows(1 to 10) 

rowno. <- 1:10
colno1 <- 1
colno2 <- 2
colno3 <- 4

pharma_data[rowno.,c(colno1,colno2,colno3)] -> pharma_rowcol1
View(pharma_rowcol1)

# b. Columns (2,4,5) and rows(50 to 120) 

rowno. <- 50 : 120
colno1 <- 2
colno2 <- 4
colno3 <- 5

pharma_data[rowno.,c(colno1,colno2,colno3)] -> pharma_rowcol2
View(pharma_rowcol2)

# c. Columns (1,3,6) and rows(100 to 200)

rowno. <- 100:200
colno1 <- 1
colno2 <- 3
colno3 <- 6

pharma_data[rowno.,c(colno1,colno2,colno3)] -> pharma_rowcol3
View(pharma_rowcol3)