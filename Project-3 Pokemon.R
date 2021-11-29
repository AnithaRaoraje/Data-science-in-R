#-------------------------------------------------------------------------------
# Read CSV file pokemon

pokemon <- read.csv('Pokemon.csv',stringsAsFactors = T)

library(dplyr)
library(caTools)
library(rpart)
library(caret)
library(lattice)
#-------------------------------------------------------------------------------
# A) Selecting a Pokémon 
# a. Select a Pokémon whose primary type is "Grass", secondary type is "Poison" 
# with the maximum speed 

range(pokemon$Speed)

grass_poison_pokemon <- pokemon %>% filter(Type.1 == 'Grass' & Type.2 == 'Poison' & Speed == 180)

# b. Select a Pokémon whose primary type is "Water", secondary type is "Flying" 
# with the maximum speed 

water_flying_pokemon <- pokemon %>% filter(Type.1 == 'Water' & Type.2 == 'Flying' & Speed == 180)


# c. Select a Pokémon whose primary type is "Fire", secondary type is "Psychic" 
# with the maximum speed 

fire_pyshic_pokemon <- pokemon %>% filter(Type.1 == 'Fire' & Type.2 == 'Pyshic' & Speed == 180)


#-------------------------------------------------------------------------------
# B) Attack vs. Defence 
# a. Divide the data-set into train & test sets 
set.seed(1)

split_pokemon <- sample.split(pokemon$Attack,SplitRatio = 0.75)

train_pokemon <- subset(pokemon,split_pokemon == T)

test_pokemon <- subset(pokemon,split_pokemon == F)

# b. Build a linear model on train set where independent variable is 'Defense' & 
#   Dependent variable is 'Attack'
  
mod1 <- lm(Attack ~ Defense,train_pokemon)

# c. Predict the values on the 'test' set

pred1 <- predict(mod1,test_pokemon)
pred1 <- as.data.frame(pred1)

result1 <- cbind(Actual = test_pokemon$Attack,predicted = pred1)
result1$error <- result1$Actual - result1$pred1

# d. Find the root mean square error

rmse1 <- sqrt(mean(result1$error^2))


#-------------------------------------------------------------------------------
# C) Legendary or not 
# a. Divide the data-set into train & test sets 

split_pokemon <- sample.split(pokemon$Legendary,SplitRatio = 0.70)

train_pokemon <- subset(pokemon,split_pokemon == T)

test_pokemon <- subset(pokemon,split_pokemon == F)


# b. Build a decision tree on train set where dependent variable is 'Legendary' & 
#   all other columns are independent variables 

mod2 <- rpart(Legendary ~ .,train_pokemon)

# c. Predict the values on the 'test' set

pred2 <- predict(mod2,test_pokemon,type = 'class')

confusionMatrix(test_pokemon$Legendary,pred2)

table(test_pokemon$Legendary,pred2) -> cm1

# d. Find the accuracy by making a confusion matrix

(220+9)/(220+9+10+1)

acc <- sum(diag(cm1)/sum(cm1))

