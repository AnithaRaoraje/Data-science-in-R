#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)
placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)

#-------------------------------------------------------------------------------
# 1. After building the simple linear model on top of the train set for the 
# city_temperature data frame, now do the following tasks: 

split_temp <- sample.split(city_temp,SplitRatio = 0.70)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)

model_temp <- lm(Month ~ AvgTemperature,data=train_temp)

summary(model_temp)

# a. Create a scatter plot with the help of ggplot2 package and plot Month on the
# y axis and AvgTemperature on the x-axis of the graph. 

ggplot(data=city_temp,aes(y=AvgTemperature,x=Month))+geom_point()


# b. Now plot the regression line on the scatter plot.

ggplot(data=city_temp,aes(y=AvgTemperature,x=Month))+geom_point()+geom_smooth(method = 'lm',formula='y~x')


#-------------------------------------------------------------------------------
# 2. After building the simple linear model on top of the train set for the 
# Placement_Data_Full_Class data frame, now perform the following tasks: 

split_placement <- sample.split(placement_data,SplitRatio = 0.80)

train_placement <- subset(placement_data,split_placement == T)

test_placement <- subset(placement_data,split_placement == F)

model_placement <- lm(etest_p ~ status,data=train_placement)

summary(model_placement)

# a. Create a scatter plot with the help of ggplot2 package and plot etest_p on the 
# yaxis and status on the x-axis of the graph. 

ggplot(placement_data,aes(y = etest_p,x=status))+geom_point()


# b. Now plot the regression line on the scatter plot. 

placement_data[] <- lapply(placement_data, as.numeric)

fit <- lm(etest_p~status, data = placement_data) 


ggplot(placement_data,aes(y = etest_p,x=status))+geom_point()+
  geom_line(data = fortify(fit), aes(x = status, y = .fitted))


#-------------------------------------------------------------------------------
# 3. After building the simple linear model on top of the train set for the 
# Pharmacovigilance_audit_Data data frame, now perform the following tasks: 

split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_pharma == T)

test_pharma  <- subset(pharma_data,split_pharma == F)


model_pharma <- lm(Age ~ DrugID,data=train_pharma)

summary(model_pharma)

# a. Create a scatter plot with the help of ggplot2 package and plot Age on the 
# yaxis and DrugID on the x-axis of the graph. 


ggplot(pharma_data,aes(y=Age,x=DrugID))+geom_point()


# b. Now plot the regression line on the scatter plot.

pharma_data[] <- lapply(pharma_data, as.numeric)

fit <- lm(Age~DrugID, data = pharma_data) 

ggplot(pharma_data,aes(y=Age,x=DrugID))+geom_point()+
  geom_line(data = fortify(fit), aes(x = DrugID, y = .fitted))


