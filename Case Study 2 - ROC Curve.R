#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)
library(ROCR)
library(pROC)

#-------------------------------------------------------------------------------
# 1. Build a logistic regression model: 
# a. Start off by dividing the data-set into 'train' & 'test' sets in 80:20 ratio,
# with the split criteria being determined by 'Churn' column 

split_churn <- sample.split(cust_churn$Churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)


# b. Build a logistic regression model on the train set where the dependent variable is 
# 'Churn' & the independent variables are 'MonthlyCharges', 'tenure' & 'TechSupport' & 
# store the result in 'log_mod_roc' 


log_mod_roc <- glm(Churn ~ MonthlyCharges+tenure+TechSupport,
                     data=train_churn,
                     family = 'binomial')

summary(log_mod_roc)


# c. Predict the values on top of the test set & store the result in 'result_log_roc' 


result_log_roc <- predict(log_mod_roc,newdata=test_churn,type = 'response')

View(as.data.frame(result_log_roc))


# d. Use the performance () function from the ROCR package & build the 
# 'Accuracy vs cut off' plot e. Plot the 'ROC' curve 

pred_log <- prediction(result_log_roc,test_churn$Churn) 

acc <- performance(pred_log,'acc')

acc

plot(acc)

table(test_churn$Churn,result_log_roc > 0.41)

#Acuracy - 75%

(854+214)/(854+214+181+160)

roc_curve <- performance(pred_log,'tpr','fpr')

plot(roc_curve,colorize = T,lwd=2)

abline(a = 0, b = 1) 


table(test_churn$Churn,result_log_roc > 0.28)

# Accuracy - 72%

(751+266)/(751+266+284+108)

# e. Find out the "area under the curve"

auc(test_churn$Churn, result_log_roc) -> auc_pROC

auc <- performance(pred_log,'auc')

auc@y.values
