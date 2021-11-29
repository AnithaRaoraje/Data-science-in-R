
#Reading a csv file into R studio

read_file <- 'customer_churn.csv'
cust_churn = read.csv(read_file)



#-------------------------------------------------------------------------------
# Assignment-operator
#-------------------------------------------------------------------------------
# 1. Increase the monthly charges of 1st record by 5.

mon_chr1 <- cust_churn$MonthlyCharges[1]
cust_churn$MonthlyCharges[1] <- cust_churn$MonthlyCharges[1]+5

#-----------------------------------------OR------------------------------------

rec_no <- 1
temp_chrg <- 19
charge_change <- 5
mon_chrg <- cust_churn[rec_no,temp_chrg]

cust_churn[rec_no,temp_chrg] <- mon_chrg+charge_change

#-------------------------------------------------------------------------------

# 2. Increase the monthly charges of the 5th record by 22
rec_no <- 5
temp_chrg <- 19
charge_change <- 22
mon_chrg <- cust_churn[rec_no,temp_chrg]

cust_churn[rec_no,temp_chrg] <- mon_chrg+charge_change

#-------------------------------------------------------------------------------

# 3. Reduce the total charges of the 4th record by 40.75. 
rec_no <- 4
temp_chrg <- 20
charge_change <- 40.75
mon_chrg <- cust_churn[rec_no,temp_chrg]

cust_churn[rec_no,temp_chrg] <- mon_chrg-charge_change


#-------------------------------------------------------------------------------

# 4. Subtract the total charges from 2nd record by 100. 
rec_no <- 2
temp_chrg <- 20
charge_change <- 100
mon_chrg <- cust_churn[rec_no,temp_chrg]

cust_churn[rec_no,temp_chrg] <- mon_chrg-charge_change


#-------------------------------------------------------------------------------

# 5. Reduce the monthly charges of the 25th record by 4.6 and divide it by 5.
rec_no <- 25
temp_chrg <- 19
charge_change <- 4.6
charge_change1 <- 5
mon_chrg <- cust_churn[rec_no,temp_chrg]

cust_churn[rec_no,temp_chrg] <- mon_chrg-charge_change/charge_change1


#-------------------------------------------------------------------------------

# 6. Increase the value of the total charge of the 5th record by 5.3 and multiply it by 2
rec_no <- 5
temp_chrg <- 20
charge_change <- 5.3
charge_change1 <- 2
mon_chrg <- cust_churn[rec_no,temp_chrg]

cust_churn[rec_no,temp_chrg] <- mon_chrg+charge_change*charge_change1



#-------------------------------------------------------------------------------

# 7. Multiply the 12th record of monthly charges by 5. 

rec_no <- 12
temp_chrg <- 19
charge_change <- 5
mon_chrg <- cust_churn[rec_no,temp_chrg]

cust_churn[rec_no,temp_chrg] <- mon_chrg*charge_change
