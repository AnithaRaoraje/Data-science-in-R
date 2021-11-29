# Reading csv file into R
placement_data <- read.csv('Placement_Data_Full_Class.csv')
cust_churn <- read.csv('customer_churn.csv')
#------------------------------------------------------------------------------

# 1. Calculate the number higher secondary students who are from "Central" 
# board. 

count <- 0

i <- 1

while (i <= NROW(placement_data)) {
  if(placement_data$hsc_b[i] == 'Central'){
    count = count+1
  }
  i = i+1
}

table(placement_data$hsc_b)

#-------------------------------------------------------------------------------

# 2. Calculate the number of students who are from Science stream and 
# secured percentage greater than 75. 

count1 <- 0
i <- 1

while (i <= NROW(placement_data)) {
  if(placement_data$hsc_s[i] == 'Science' & placement_data$hsc_p[i] > 75){
    count1 = count1+1
  }
  i = i+1
}



#-------------------------------------------------------------------------------

# 3. Calculate the number of customers from customer churn data set as per 
# following condition: 
#   (i). The customer should be a senior citizen who is having a contract of 
# 'One year' for 'Fiber optic' there as internet service. 
 
count3 <- 0
i <- 1
while(i <= NROW(cust_churn)){
  if (cust_churn$SeniorCitizen[i] == 1 & 
      cust_churn$Contract[i]=='One year' & cust_churn$InternetService[i] == 'Fiber optic'){
    count3 = count3+1
  }
  i = i+1
}

# (ii). The customer is not a senior citizen who is having a contract of 'Two 
# year' and total charges is less than 7000.

count4 <- 0
i <- 1
while(i <= NROW(cust_churn)){
  if (cust_churn$SeniorCitizen[i] == 0 & 
      cust_churn$Contract[i]=='Two year' & cust_churn$TotalCharges[i] < 7000){
    count4 = count4+1
  }
  i = i+1
}

# (iii). The customers whose monthly charges are greater than 6500.

count5 <- 0
i <- 1

while(i <= NROW(cust_churn)){
  if (cust_churn$MonthlyCharges[i] > 6500){
    count5 = count5+1
  }
  i = i+1
}