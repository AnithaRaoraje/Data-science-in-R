#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
cust_churn <- read.csv('customer_churn.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)


library(ggplot2)
library(dplyr)
library(caTools)
library(rpart)
library(rattle)
library(rpart.plot)
library(tree)
library(caret)
library(lattice)
#-------------------------------------------------------------------------------
# 1. After splitting the data frame into train and test sets, build a decision tree model on 
# top of the train set for the city_temperature data frame. 


split_temp <- sample.split(city_temp$Region,SplitRatio = 0.70)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)

# a. For this model, take AvgTemperature as the independent variable and Region 
# as the dependent variable. 

mod_temp <- rpart(Region ~ AvgTemperature,train_temp)

summary(mod_temp)

rpart.plot(mod_temp)

pred_temp <- predict(mod_temp,test_temp,type = 'class')

table(test_temp$Region,pred_temp) -> cm1

confusionMatrix(test_temp$Region,pred_temp) 

# b. Now calculate the Misclassification Error Rate from the model. 

1-sum(diag(cm1)/sum(cm1))


#-------------------------------------------------------------------------------
# 2. After splitting the data frame into train and test sets, build a decision tree model on 
# top of the train set for the Customer_Churn data frame. 


split_churn <- sample.split(cust_churn$Churn,SplitRatio = 0.80)

train_churn <- subset(cust_churn,split_churn == T)

test_churn <- subset(cust_churn,split_churn == F)


# a. For this model, take Monthly Charges as the independent variable and Churn 
# as dependent variable. 

mod_churn <- tree(Churn ~ MonthlyCharges,train_churn)

summary(mod_churn)

plot(mod_churn)
text(mod_churn)

pred_churn <- predict(mod_churn,test_churn,type = 'class')

pred_churn

table(test_churn$Churn,pred_churn) -> cm2

# b. Now calculate the Misclassification Error Rate from the model. 

# (FP+FN)/total

1-sum(diag(cm2)/sum(cm2))

sum(diag(cm2)/sum(cm2))
#-------------------------------------------------------------------------------
# 3. After splitting the data frame into train and test sets, build a decision tree model on 
# top of the train set for the Pharmacovigilance_audit_Data data frame. 

split_pharma <- sample.split(pharma_data$Age,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_pharma == T)

test_pharma <- subset(pharma_data,split_pharma == F)


# a. For this model, take Age as independent variable and DrugId as dependent 
# variable. 

mod_pharma <- tree(DrugID ~ Age,train_pharma)

summary(mod_pharma)

pred_pharma <- predict(mod_pharma,test_pharma,type = 'class')


# b. Now calculate the Misclassification Error Rate from the model.

table(test_pharma$DrugID,pred_pharma) -> cm3

1-sum(diag(cm3)/sum(cm3))



