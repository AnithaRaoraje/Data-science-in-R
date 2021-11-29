#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)
pharma_data<-read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)
placement_data <- read.csv('Placement_Data_Full_Class.csv',stringsAsFactors = T)

#-------------------------------------------------------------------------------
# 1. Calculate the IQR (Interquartile Range) for the following columns of the placement 
# dataset: 
# a. hsc_p 

IQR(placement_data$hsc_p)-> hsc_p_IQR

# b. ssc_p 

IQR(placement_data$ssc_p)-> ssc_p_IQR


# c. degree_p 

IQR(placement_data$degree_p)-> degree_p_IQR


# d. mba_p 

IQR(placement_data$mba_p) -> mba_p_IQR

# e. etest_p 

IQR(placement_data$etest_p) -> etest_IQR

#-------------------------------------------------------------------------------
# 2. Calculate the IQR (Interquartile Range) for the following columns of the customer 
# churn dataset: 
# a. TotalCharges 

IQR(cust_churn$TotalCharges,na.rm = T) -> Tot_Charges_IQR

# b. MonthlyCharges 

IQR(cust_churn$MonthlyCharges,na.rm = T) -> mon_char_IQR

# c. Tenure 

IQR(cust_churn$tenure) -> tenure_IQR

#-------------------------------------------------------------------------------
# 3. Calculate the IQR (Interquartile Range) for the following columns of the 
# pharmacovigilance dataset: 
# a. Age 

IQR(pharma_data$Age) -> age_IQR

# b. PatientID

IQR(pharma_data$PatientID) -> pat_id_IQR
