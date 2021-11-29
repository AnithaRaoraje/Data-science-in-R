#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)

#-------------------------------------------------------------------------------
# 1. Build a simple logistic regression model on the 'customer_churn' dataframe, 
# where the dependent variable is 'Churn' & the independent variable is 
# 'TechSupport'. Store the result in 'log_mod_1'


split_churn <- sample.split(cust_churn$Churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)

log_mod_1 <- glm(Churn ~ TechSupport,data = train_churn,family = 'binomial')


# a. Have a glance at the summary of the model built 

summary(log_mod_1)

# b. Predict the result when the value of 'TechSupport' is'Yes'

tech_yes <- as.data.frame(test_churn$TechSupport == 'Yes')

tech_yes <- subset(test_churn,tech_yes == T)

predict(log_mod_1,newdata = tech_yes,type = 'response') -> predict_tech_yes

View(as.data.frame(predict_tech_yes))

# c. Predict the result when the value of 'TechSupport' is'No'

tech_no <- as.data.frame(test_churn$TechSupport == 'No')

tech_no <- subset(test_churn,tech_no == T)

predict(log_mod_1,newdata = tech_no,type = 'response') -> predict_tech_no

View(as.data.frame(predict_tech_no))


# d. Predict the result when the value of 'TechSupport' is 'No internetservice'

tech_no_int <- as.data.frame(test_churn$TechSupport == 'No internet service')

tech_no_int <- subset(test_churn,tech_no_int == T)

predict(log_mod_1,newdata = tech_no_int,type = 'response') -> predict_tech_no_int

View(as.data.frame(predict_tech_no_int))


#-------------------------------------------------------------------------------
# 2. Build a simple logistic regression model on the 'customer_churn' data frame, 
# where the dependent variable is 'Dependents' & the independent variable is 
# 'tenure'. Store the result in 'log_mod_2'


split_churn <- sample.split(cust_churn$Churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)

log_mod_2 <- glm(Dependents ~ tenure ,data = train_churn,family = 'binomial')


# a. Have a glance at the summary of the model built 

summary(log_mod_2)


# b. Predict the result when the value of 'tenure' is 10

tenure_10 <- as.data.frame(test_churn$tenure == 10)

tenure_10 <- subset(test_churn,tenure_10 == T)

predict_tenure_10 <- predict(log_mod_2,newdata = tenure_10,type = 'response')

View(as.data.frame(predict_tenure_10))

# c. Predict the result when the value of 'tenure' is 50

tenure_50 <- as.data.frame(test_churn$tenure == 50)

tenure_50 <- subset(test_churn,tenure_50 == T)

predict_tenure_50 <- predict(log_mod_2,newdata = tenure_50,type = 'response')

View(as.data.frame(predict_tenure_50))

# d. Predict the result when the value of 'tenure' is 70

tenure_70 <- as.data.frame(test_churn$tenure == 70)

tenure_70 <- subset(test_churn,tenure_70 == T)

predict_tenure_70 <- predict(log_mod_2,newdata = tenure_70,type = 'response')

View(as.data.frame(predict_tenure_70))


