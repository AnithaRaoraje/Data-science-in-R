#------------------------------------------------------------------------------
#Reading customer churn data set into R Studio
read_file <- ('customer_churn.csv')
cust_churn <- read.csv(read_file)


#------------------------------------------------------------------------------
# 1. Calculate the mean of the following columns from customer churn data set: 
# a. Tenure 

calc_col <- cust_churn$tenure
mean(calc_col) -> mean_tenure
View(mean_tenure)

# b. Monthly Charges 

calc_col <- cust_churn$MonthlyCharges
mean(calc_col) -> mean_mon_chrg
View(mean_mon_chrg)

# c. Total Charges

calc_col <- cust_churn$TotalCharges
mean(calc_col, na.rm = T) -> mean_tot_chrg
View(mean_tot_chrg)


#------------------------------------------------------------------------------
#Reading Placement data set into R studio

read_file1 <- ('Placement_Data_Full_Class.csv')
placement <- read.csv(read_file1)


#------------------------------------------------------------------------------
# 2. Calculate the mean of the following columns from the placement dataset: 
# a. Ssc_p

col_name <- placement$ssc_p
mean(col_name) -> mean_ssc_p
View(mean_ssc_p)

# b. Hsc_p 

col_name <- placement$hsc_p
mean(col_name) -> mean_hsc_p
View(mean_hsc_p)


# c. Degree_p 

col_name <- placement$degree_p
mean(col_name) -> mean_degree_p
View(mean_degree_p)


# d. Etest_p 

col_name <- placement$etest_p
mean(col_name) -> mean_etest_p
View(mean_etest_p)

# e. Mba_p 

col_name <- placement$mba_p
mean(col_name) -> mean_mba_p
View(mean_mba_p)

# f. Salary

col_name <- placement$salary
mean(col_name,na.rm = T) -> mean_salary
View(mean_salary)


