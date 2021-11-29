#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)
library(randomForest)
library(caret)
library(lattice)
# -------------------------------------------------------------------------------
# 1. Building the first "Random Forest" model: 
# a. Start off by dividing the 'customer_churn' data into train & test sets in 65:35 
# ratios. The split-criteria would be determined by the 'gender' column 

split_churn <- sample.split(cust_churn,SplitRatio = 0.65)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)


# b. Build a random forest model on top of the 'train' set, where the dependent 
# variable is 'gender' & the independent variables are 'MonthlyCharges' & 
#   'tenure'. The number of decision trees in the random forest would be 35. Store 
# the result in 'mod_forest1' 

mod_forest1 <- randomForest(gender ~ MonthlyCharges+tenure,cust_churn ,ntree = 35)

# c. Find the importance of the independent variables and also plot it 

importance(mod_forest1)

# d. Predict the values on top of the test set & store the result in 'result_forest1' 

result_forest1 <- predict(mod_forest1,test_churn,type = 'class')

# e. Build a confusion matrix for the actual values & the predicted values 

table(test_churn$gender,result_forest1) -> cm1

confusionMatrix(test_churn$gender,result_forest1)

# f. Find out the accuracy from the confusion matrix 

acc1 <- sum(diag(cm1)/sum(cm1))

# -------------------------------------------------------------------------------
# 2. Build a 2nd 'Random forest' model on the same train & test sets: 
# a. The dependent & the independent variables would be same. The number of 
# decision trees would be 350. Store the result in 'mod_forest2' 

mod_forest2 <- randomForest(gender ~ MonthlyCharges+tenure,cust_churn ,ntree = 350)


# b. Find the importance of the independent variables & also plot it 

importance(mod_forest2)

# c. Predict the values on top of test set & store the result in 'result_forest2' 

result_forest2 <- predict(mod_forest2,test_churn,type = 'class')

# d. Build a confusion matrix for the actual values & predicted values 

table(test_churn$gender,result_forest2) -> cm2

confusionMatrix(test_churn$gender,result_forest2)

# e. Find out the accuracy from the confusion matrix

acc2 <- sum(diag(cm2)/sum(cm2))

