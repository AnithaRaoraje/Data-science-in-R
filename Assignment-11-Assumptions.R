#-------------------------------------------------------------------------------
# Read csv file into R

city_temp <- read.csv('city_temperature.csv',stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)
placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)
library(caTools)

#-------------------------------------------------------------------------------
# 1. Analyze the features from the temperature data set. 

# Linearity - There is no linear Relationship between Year and Avg Temperature
ggplot(city_temp,aes(x = Year ,y = AvgTemperature,na.rm = T)) +
  geom_point(colour = "blue") +
  geom_smooth(formula = y ~ x,method = 'lm')
  scale_x_continuous(limits = c(1995,2020), breaks = seq(1995,2020,5)) +
  ggtitle ("Yearly average temperature") +
  xlab("Year") +  ylab ("Average Temperature ( ºC )")

# Equal Error Variance 
  
split_temp <- sample.split(city_temp,SplitRatio = 0.70)

train_temp <- subset(city_temp,split_temp == T)

test_temp <- subset(city_temp,split_temp == F)


model_temp <- lm(Year ~ AvgTemperature,data = train_temp )

summary(model_temp)

#Predict test data

predicted_temp <- predict(model_temp,data=test_temp)

#Bind Predictions with actual values

result1 <- cbind(Actual=test_temp$Year,predicted = predicted_temp)

result1 <- as.data.frame(result1)

head(result1)

# Find out the errors in the predicted values. 

result1$error <- result1$Actual - result1$predicted

View(result1)

# plotting a scatter plot between the predicted values and error

ggplot(data=result1,aes(x=predicted,y=error))+geom_point()

# Normality of errors

qqnorm(result1$error)
qqline(result1$error)


#-------------------------------------------------------------------------------
# 2. Analyze the features from the data data set. 

# Linearity - There is no linear Relationship between age and Issues

ggplot(data=pharma_data,aes(y=Age,x=Issues))+
  geom_point()+
  geom_smooth(formula = y ~ x,method = 'lm') 

# Equal Error Variance 

split_pharma <- sample.split(pharma_data,SplitRatio = 0.75)

train_pharma <- subset(pharma_data,split_pharma == T)

test_pharma  <- subset(pharma_data,split_pharma == F)


model_pharma <- lm(Age ~ Issues,data=train_pharma)

summary(model_pharma)

# Predict model on test data

predict_pharma <- predict(model_pharma,data=test_pharma)

# Bind actual and predicted values 

result2 <- cbind(actual = test_pharma$Age,predicted = predict_pharma)

result2 <- as.data.frame(result2)

head(result2)

# Find out the errors in the predicted values.

result2$errors <- result2$actual - result2$predicted

View(result2)

# plotting a scatter plot between the predicted values and error

ggplot(data=result2,aes(x=predicted,y=errors))+geom_point()

# Normality of errors

qqnorm(result2$errors)
qqline(result2$errors)


#-------------------------------------------------------------------------------
# 3. Analyze the features from the placement data set.

# Linearity - There is a positive linear Relationship between degree and etest_p
ggplot(data=placement_data ,aes(y=degree_p,x=etest_p))+
  geom_point()+
  geom_smooth(formula = y ~ x,method = 'lm') 

# Equal Error Variance

split_placement <- sample.split(placement_data,SplitRatio = 0.80)

train_placement <- subset(placement_data,split_placement == T)

test_placement <- subset(placement_data,split_placement == F)


model_placement <- lm(etest_p ~ degree_p ,data=train_placement)

summary(model_placement)

#Predict test data

predict_placement <- predict(model_placement,data=test_placement)

#Bind Predictions with actual values

result3 <- cbind(actual = test_placement$etest_p,predicted = predict_placement)

result3 <- as.data.frame(result3)

head(result3)

# Find out the errors in the predicted values. 

result3$errors <- result3$actual - result3$predicted

View(result3)

# plotting a scatter plot between the predicted values and error

ggplot(data=result3,aes(x=predicted,y=errors))+
  geom_point()  # Data is random and linear model can be built.

# Normality of errors

qqnorm(result3$errors)
qqline(result3$errors)



