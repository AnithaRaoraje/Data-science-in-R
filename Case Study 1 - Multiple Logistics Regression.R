#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)

#-------------------------------------------------------------------------------
# 1. Build a multiple logistic regression model: 
# a. Start off by dividing the data-set into 'train' & 'test' sets in 65:35 ratio, 
# with the split criteria being determined by 'gender' column 

split_churn <- sample.split(cust_churn$Churn,SplitRatio = 0.65)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)


# b. Build a logistic regression model on the train set where the dependent 
# variable is 'gender' & the independent variables are 'Dependents', 
# 'InternetService' & 'Contract' & store the result in 'log_mod_multi' 

log_mod_multi <- glm(gender ~ Dependents+InternetService+Contract,
                     data=train_churn,
                     family = 'binomial')

summary(log_mod_multi)

# c. Predict the values on top of the test set & store the result in 
# 'result_log_multi'

result_log_multi <- predict(log_mod_multi,newdata=test_churn,type = 'response')

View(as.data.frame(result_log_multi))

# d. Have a look at the range of 'result_log_multi' & build a confusion matrix 
# where the threshold of predicted values is greater than '0.49' 

range(result_log_multi)

table(test_churn$gender,result_log_multi>0.49)

# e. Calculate the accuracy of the model from the confusion matrix 

#Accuracy
(436+799)/(436+799+765+465)


#-------------------------------------------------------------------------------
# 2. Build second logistic regression model on the same 'train' & 'test' sets 
# a. In this case dependent variable is 'gender' & the independent variables are 
# 'tenure', 'MonthlyCharges' & 'PaymentMethod 

log_mod_multi2 <- glm(gender ~ tenure+MonthlyCharges+PaymentMethod,
                     data=train_churn,
                     family = 'binomial')

summary(log_mod_multi2)


# b. Predict the values on top of the test set & store the result in 'result_log_multi2' 

result_log_multi2 <- predict(log_mod_multi2,newdata=test_churn,type = 'response')

summary(result_log_multi2)

# c. Have a look at the range of 'result_log_multi2' & build a confusion matrix 
# where the threshold of predicted values is greater than 0.49 

range(result_log_multi2)

table(test_churn$gender,result_log_multi2>0.49)

# d. Calculate the accuracy of the model from the confusion matrix

# Accuracy

(372+860)/(372+829+404+860)


