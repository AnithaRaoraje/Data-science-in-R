#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

#-------------------------------------------------------------------------------
# 1. Check if the value in the 6th cell of 'PaymentMethod' column is 'Electronic check'. 
# If yes, print "Yes, the payment method is Electronic check"

payment_6th <- if (cust_churn$PaymentMethod[6] == 'Electronic check') {
  print('Yes, the payment method is Electronic check')
}


#-------------------------------------------------------------------------------
# 2. Check the value present in 12th cell of 'Contract' column. 
# If it's 'month-to-month', print 'The contract is on a month to month basis' 
# If it's 'One year', print 'The contract is on a yearly basis'
# If it's 'Two year', print 'The contract is on a two-year basis'

contract_12th <- if (cust_churn$Contract[12] == 'Month-to-month') {
  print('The contract is on a month to month basis')
} else if (cust_churn$Contract[12] == 'One year') {
  print('The contract is on a yearly basis')
} else {
  print('The contract is on a two-year basis')
}


#-------------------------------------------------------------------------------
# 3. Use switch to check the gender in 6th cell of 'gender' column. 
# If it's 'Male', give a discount of 20% in 'MonthlyCharges'
# If it's 'Female', give a discount of 50% in 'MonthlyCharges'


cust_churn$MonthlyCharges[6] <- switch (as.character(cust_churn$gender[6]),
  'Male' = cust_churn$MonthlyCharges[6] * 0.8,
  'Female' = cust_churn$MonthlyCharges[6] * 0.5
)

View(as.data.frame(gender_6th))
#-------------------------------------------------------------------------------
# 4. Use for loop to get the count of customers whose 'InternetService' is'DSL'

count <- 0

i <- 1
for (i in 1:NROW(cust_churn)) {
  if (cust_churn$InternetService[i] == 'DSL'){
    count=count+1
  }
}



#-------------------------------------------------------------------------------
# 5. Use while to find the number of customers whose tenure is exactly '2' months


count1 <- 0

j <- 1

while (j <= NROW(cust_churn)){
  if (cust_churn$tenure[j] == 2){
    count1 = count1+1
  }
  j = j+1
}


