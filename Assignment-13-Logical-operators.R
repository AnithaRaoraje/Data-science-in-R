# Read csv file into r 

cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)

#-------------------------------------------------------------------------------
# 1. Extract the data of customers as per the following conditions: 
# a. People who are senior citizen of gender female. 

fem_sen <- cust_churn$SeniorCitizen == 1 & cust_churn$gender == 'Female'

subset(cust_churn,fem_sen == T) -> fem_sen


# b. Female customers who are not having partner. 

fem_sin <- cust_churn$Partner == 'No' & cust_churn$gender == 'Female'

subset(cust_churn,fem_sin) -> fem_sin

# c. Customers using 'DSL' as their internet service with no online security.

DSL <- cust_churn$InternetService == 'DSL' & cust_churn$OnlineSecurity == 'No'

subset(cust_churn,DSL == T) -> DSL 

# d. Customers using 'Fiber optics' as internet service with no online backup.

Fiber_optics <- cust_churn$InternetService == 'Fiber optic' & cust_churn$OnlineBackup == 'No'

subset(cust_churn,Fiber_optics == T) -> Fiber_optics

# e. Senior citizens using payment method as electronic check. 

sen_pay <- cust_churn$SeniorCitizen == 1 & cust_churn$PaymentMethod == 'Electronic check'

subset(cust_churn,sen_pay == T) -> sen_pay


#-------------------------------------------------------------------------------
# 2. Extract the data of customers who are: 
# a. Using payment method as mailed check and having a contract of one year 

pay_mailed <- cust_churn$PaymentMethod == 'Mailed check' & cust_churn$Contract == 'One year'

subset(cust_churn,pay_mailed == T) -> pay_mailed

# b. Having services such as online security, online backup, device protection, 
# and tech support enabled 


services <- cust_churn$OnlineSecurity == 'Yes' & cust_churn$OnlineBackup == 'Yes' & 
            cust_churn$DeviceProtection == 'Yes' & cust_churn$TechSupport == 'Yes'

subset(cust_churn,services == T) -> services

# c. Not senior citizens having tenure of 72 months. 

tenure_72 <- cust_churn$SeniorCitizen == 0 & cust_churn$tenure == 72

subset(cust_churn,tenure_72 == T) -> tenure_72

#-------------------------------------------------------------------------------
# 3. Check the customers data where the customer's are:
# a. Either using bank transfer or credit card as their payment method. 

bank_credit <- cust_churn$PaymentMethod == 'Bank transfer (automatic)' | cust_churn$PaymentMethod == 'Credit card (automatic)'

subset(cust_churn,bank_credit == T) -> bank_credit

# b. Having phone service or multiple lines enabled. 

multi_phone <- cust_churn$PhoneService == 'Yes' | cust_churn$MultipleLines == 'Yes'

subset(cust_churn,multi_phone == T) -> multi_phone

# c. Either having payment method as mailed check or electronic check. 

payment_method <- cust_churn$PaymentMethod == 'Electronic check' | cust_churn$PaymentMethod == 'Mailed check'

subset(cust_churn,payment_method == T) -> payment_method


# d. Either using fiber optic or having no internet service.

noint_fiber <- cust_churn$InternetService == 'No' | cust_churn$InternetService == 'Fiber optic'

subset(cust_churn,noint_fiber == T) -> noint_fiber

