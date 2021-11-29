# Using the placement data set, perform the following tasks: 
#-------------------------------------------------------------------------------
# Importing placements csv and customer churn csv file into R
placement_data <- read.csv('Placement_Data_Full_Class.csv')
cust_churn <- read.csv('customer_churn.csv')
#-------------------------------------------------------------------------------
# a. Check the value of 95th row of status column. 
# If the value is "Placed", then print "The student is placed from campus 
# placement drives".
# If it's "Not Placed", then print "The student is not placed from campus 
# placement drives."
# If it's "NA", then print "The data of the student is not available." 


status_95th <- if (placement_data$status[95] == 'Placed'){
  print("The student is placed from campus placement drives.")
}else{
  if (placement_data$status[95] == 'Not Placed') {
    print('The student is not placed from campus placement drives.')
  }else{
    print('The data of the student is not available.')
  }
}


#-------------------------------------------------------------------------------
# b. Check the value of 64th row of hsc_s column. 
# If it is "Science", then print "The subject opted by the student is Science."
# If it is "Commerce", then print "The subject opted by the student is 
# Commerce."
# If it is "Arts", then print "The subject opted by the student is Arts." 


hsc_s_64 <- if (placement_data$hsc_s[64] == 'Science') {
  print('The subject opted by the student is Science.')
}else{
  if (placement_data$hsc_s[64] == 'Commerce') {
    print('The subject opted by the student is Commerce.')
  }else{
    print('The subject opted by the student is Arts.')
  }
}



#-------------------------------------------------------------------------------
# c. Check the 28th row of Payment method column: 
#   If it is "Credit card (automatic)", then print"The customer is using credit 
# card as their payment method."
# If it is "Mailed check", then print "The customer is using mailed check for 
# payment."
# If it is "Electronic check", then print "The customer is using electronic check 
# for payment."a

payment_method_28th <-if (cust_churn$PaymentMethod[28] == 'Credit card (automatic)'){
  print('he customer is using credit card as their payment method.')
}else{
  if (cust_churn$PaymentMethod[28] == 'Mailed check') {
    print('The customer is using mailed check for payment.')
  }else{
    print('The customer is using electronic check for payment.')
  }
}



