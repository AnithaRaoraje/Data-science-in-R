#-------------------------------------------------------------------------------
# Read CSV file into R

cust_loan <- read.csv('customer_loan.csv',stringsAsFactors = T)

library(dplyr)
library(caTools)
library(tibble)
library(e1071)
library(caret)
library(BBmisc)
#-------------------------------------------------------------------------------
# A) Data Preprocessing: 
# a. Have a glance at the structure of the data set and find if there are any missing 
# values present 

str(cust_loan)

cbind(lapply(lapply(cust_loan, is.na),sum))

# b. Calculate the debt-to-income ratio and add it as a new column named 'dti'

cust_loan$dti <- cust_loan$debt /cust_loan$income

# c. Create a new variable named 'loan_decision_status', where the value would be 
# '0' if 'loan_decision_type' is equal to 'denied', else it would be '1'
# i. Convert this variable into a factor 


cust_loan <- cust_loan %>%
  add_column(loan_decision_status = if_else(cust_loan$loan_decision_type == 'Denied', 0, 1)) 

cust_loan$loan_decision_status <- as.factor(cust_loan$loan_decision_status)

# d. Create a new data-set named 'customer_loan_refined', which would have 
# these column numbers from the original data frame - (3,4,6,7,8,11,13,14) 

customer_loan_refined <- cust_loan[,c(3,4,6,7,8,11,13,14)]


# e. Encode 'gender', 'marital_status', 'occupation', and 'loan_type' as factors and 
# then convert them into numeric 

customer_loan_refined[,c(1,3,4,6)] <- lapply(customer_loan_refined[,c(1,3,4,6)],as.numeric)


#-------------------------------------------------------------------------------
# B) Model Building: 
# a. Divide the data into 'train' & 'test' sets and set the split-ratio to be 70%
set.seed(7)

split_cust_loan <- sample.split(customer_loan_refined$loan_decision_status,SplitRatio = 0.70)

train_loan <- subset(customer_loan_refined,split_cust_loan == T)

test_loan <- subset(customer_loan_refined,split_cust_loan == F)

# b. Apply feature scaling on all the columns of 'train' & 'test' set, except the 
# 'loan_decision_status' column

summary(train_loan)

train_loan[,1:7] <- normalize(train_loan[,1:7], method="standardize")

summary(train_loan)
summary(test_loan)
test_loan[,1:7] <- normalize(test_loan[,1:7], method="standardize")

summary(test_loan)

# c. Apply principal component analysis on the first 7 columns of 'train' & 'test' 
# set. The number of principal components obtained should be 2 

pca_train <- prcomp(train_loan[,c(1:7)], center = TRUE,scale. = TRUE,rank. = 2)

pca_test <- prcomp(test_loan[,c(1:7)], center = TRUE,scale. = TRUE,rank. = 2)


# d. Build the naïve bayes model on the train set 

naive_mod1 <- naiveBayes(loan_decision_status ~ .,train_loan)
naive_mod1

# e. Predict the values on the test set 

naive_results1 <- predict(naive_mod1,test_loan)

# f. Build a confusion matrix for actual values and predicted values

confusionMatrix(table(test_loan$loan_decision_status,naive_results1))
table(test_loan$loan_decision_status,naive_results1) -> cm1

acc1 <- sum(diag(cm1)/sum(cm1))

