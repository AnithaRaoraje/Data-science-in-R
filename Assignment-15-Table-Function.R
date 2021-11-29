#-------------------------------------------------------------------------------
# Read csv file into R 

cust_churn <- read.csv('customer_churn.csv', stringsAsFactors = T)


#-------------------------------------------------------------------------------
# 1. Check the categories of various columns given below using table function and 
# extract the data of male customers who are senior citizens with partners internet 
# service as DSL along with services such as phone services enabled : 

male_details <- cust_churn$gender == 'Male' & cust_churn$SeniorCitizen == 1 & 
                cust_churn$Partner == 'Yes' & cust_churn$InternetService == 'DSL' &
                cust_churn$PhoneService == 'Yes'

subset(cust_churn,male_details == T) -> male_details

# a. Gender 

table(cust_churn$gender) -> no_of_males
View(no_of_males,'Number of Males')

# b. Senior Citizen 

table(cust_churn$SeniorCitizen) -> sen_citizens
View(sen_citizens)

# c. Partner 

table(cust_churn$Partner) -> partners
View(partners)

# d. Columns

table(cust_churn)

# e. Dependents 

table(cust_churn$Dependents) -> dependents
View(dependents)

# f. Phone Service 

table(cust_churn$PhoneService) -> phone_services
View(phone_services)

# g. Multiple Lines 

table(cust_churn$MultipleLines) -> multi_lines
View(multi_lines)

# h. Internet Service 

table(cust_churn$InternetService) -> int_service
View(int_service)

# i. Online Security 

table(cust_churn$OnlineSecurity) -> online

View(online)

# j. Online Backup 

table(cust_churn$OnlineBackup) -> backup

View(backup)

# k. Contract 

table(cust_churn$Contract) -> contract

View(contract)

# l. Payment Method 

table(cust_churn$PaymentMethod) -> pay_method

View(pay_method)
