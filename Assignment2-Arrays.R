#Reading a csv file into R studio

read_file <- 'customer_churn.csv'
cust_churn = read.csv(read_file)


#-----------------------------------------------------------------------------

# 1. An array named array_total_charges that contains the first 10 values from 
#     the total charges column 

tot_char <- cust_churn$TotalCharges[1:10]


array(data=tot_char,dim = c(5,2)) -> array_total_charges
View(array_total_charges)


#-----------------------------------------------------------------------------

# 2. An array named array_monthly_charges that contains first five values 
#     from the monthly charges column. 

mon_charg <- cust_churn$MonthlyCharges[1:5]

array(data=mon_charg,dim = c(5,1)) -> array_monthly_charges
View(array_monthly_charges)


#-----------------------------------------------------------------------------

# Read placement csv data set into R studio

read_file <- 'Placement_Data_Full_Class.csv'
placement_data = read.csv(read_file)

#-----------------------------------------------------------------------------


# 3. Data of first 15 values from salary column.

sal <- placement_data$salary[1:15]


array(data=sal,dim = c(5,3)) -> array_salary
View(array_salary)

#-----------------------------------------------------------------------------


# 4. Data of first five values from mba_p column. 

list_mba <- placement_data$mba_p[1:5]

array(data = list_mba,dim = c(5,1)) -> array_mba_p
View(array_mba_p)

#-----------------------------------------------------------------------------


# 5. Data of first 10 values from e_test column.

etest <-placement_data$etest_p[1:10]

array(data=etest,dim = c(5,2)) -> array_etest_p
View(array_etest_p)
