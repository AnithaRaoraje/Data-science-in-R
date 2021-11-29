#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)
library(rpart)
library(rpart.plot)
library(rattle)
library(tree)
# -------------------------------------------------------------------------------
# 1. Building a decision tree model: 
# a. Start off by dividing the 'customer_churn' data into train & test sets in 70:30 ratios. 
# The split-criteria would be determined by the 'Dependents' column 

split_tag <- sample.split(cust_churn$Dependents,SplitRatio = 0.70)

train_ds <- subset(cust_churn,split_tag == T)
  
test_ds <- subset(cust_churn,split_tag == F)
# b. Build a decision tree model on top of the 'train' set, where the dependent variable is 
# 'Dependents' & the independent variable is 'Partner'. Store the result in 'mod_tree1' 

mod_tree1 <- rpart(Dependents ~ Partner,train_ds)
  
# c. Plot the tree and add text 

plot(mod_tree1,margin = 0.20)
text(mod_tree1,use.n = T)

# d. Predict the values on the test set and store the result in 'result_tree1' 

result_tree1 <- predict(mod_tree1,test_ds,type = 'class')

# e. Build a confusion matrix for the actual values & the predicted values 

table(test_ds$Dependents,result_tree1) -> cm1

# f. Calculate the accuracy from the confusion matrix 

tree1_acc <- sum(diag(cm1)/sum(cm1))

# -------------------------------------------------------------------------------
# 2. Building 2nd decision tree model on same 'train' & 'test' sets: 
# a. In this case the dependent variable is 'Dependents' & the independent variables are 
# 'Partner' & 'InternetService'. Store the result in 'mod_tree2' 

mod_tree2 <- rpart(Partner ~ InternetService,train_ds,method="class")
# b. Plot the tree & add text 

plot(mod_tree2)


# c. Predict the values on the test set & store the result in 'result_tree2' 

result_tree2 <- predict(mod_tree2,test_ds,type = 'class')


# d. Build a confusion matrix for the actual values & the predicted values 

table(test_ds$Partner,result_tree2) -> cm2


# e. Calculate the accuracy from the confusion matrix

tree2_acc <- sum(diag(cm2)/sum(cm2))

