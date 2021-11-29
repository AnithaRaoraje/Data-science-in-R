#-------------------------------------------------------------------------------
# Read csv file into R

pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv' , stringsAsFactors = T)

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

placement_data <- read.csv('Placement_Data_Full_Class.csv' , stringsAsFactors = T)

temp_data <- read.csv('city_temperature.csv' , stringsAsFactors = T)
#-------------------------------------------------------------------------------

# 1. Calculate the range of following columns of customer churn data set: 
# a. Tenure 

tenure_range <- range(cust_churn$tenure)

# b. Monthly Charges 

monthlycharges_range <- range(cust_churn$MonthlyCharges)

# c. Total Charges 

totalcharge_range <- range(cust_churn$TotalCharges,na.rm = T)

#-------------------------------------------------------------------------------
# 2. Calculate the range of following columns of city temperature data set: 
# a. Day 

day_range <- range(temp_data$Day)

# b. Year 

year_range <- range(temp_data$Year)

# c. Average Temperature 

avg_temp_range <- range(temp_data$AvgTemperature)

#-------------------------------------------------------------------------------
# 3. Calculate the range of following columns of pharmacovigilance data set: 
# a. Age 

age_range <- range(pharma_data$Age)               

# b. Patient ID 

pat_range <- range(pharma_data$PatientID)


#-------------------------------------------------------------------------------
# 4. Calculate the range of following columns of placement dataset: 
# a. Sl_no 

sl_no_range <- range(placement_data$sl_no)

# b. Ssc_p 

ssc_p_range <- range(placement_data$ssc_p)

# c. Hsc_p 

hsc_p_range <- range(placement_data$hsc_p)

# d. Degree_p 

degree_p_range <- range(placement_data$degree_p)


# e. Etest_p 

etest_p_range <- range(placement_data$etest_p)


# f. Mba_p 

mba_p_range <- range(placement_data$mba_p)


# g. Salary 

sal_range <- range(placement_data$salary,na.rm = T)


