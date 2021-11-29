# 1. Create these vectors: 
# a. A character vector named 'fruits' with these values: 'Apple', 'Guava', 
# 'Banana','Mango'

fruits <- c('Apple','Guava','Banana','Mango')
class(fruits)
is.vector(fruits)

# b. A numeric vector named 'hundred' comprising of the first 100 natural
# numbers 

hundred <- c(1:100)
class(hundred)
is.vector(hundred)


# c. A logical vector named 'logic_game' with these values:
#  'TRUE','TRUE','FALSE','FALSE'

logic_game <- c(TRUE,TRUE,FALSE,FALSE)
class(logic_game)
is.vector(logic_game)

# 2. Create a list named 'jumbo' which comprises of: 
# a. A character vector comprising of alphabets from A to D 

jumbo1 <- c('A','B','C','D')
class(jumbo1)
is.vector(jumbo1)
jumbo1


# b. A numeric vector comprising of numbers from 55 to 60

jumbo2 <- c(55:60)
class(jumbo2)
is.vector(jumbo2)
jumbo2

# c. A logical vector comprising of just these two values: True, False 
jumbo3 <- c(TRUE,FALSE)
class(jumbo3)
is.vector(jumbo3)
jumbo3


jumbo <- list(jumbo1,jumbo2,jumbo3)
class(jumbo)
is.list(jumbo)
jumbo

class(jumbo[[1]])
class(jumbo[[2]])
class(jumbo[[3]])

# i. Now, access the third value from the first element of the list 
jumbo1st <- jumbo[[1]][3]
jumbo1st

# ii. Access the 2nd value from the 2nd element of the list 

jumbo2nd <- jumbo[[2]][2]
jumbo2nd

# iii. Access the 1st value from the 3rd element of the list 

jumbo3rd <- jumbo[[3]][1]
jumbo3rd

# 3. Create a matrix named 'four_trouble', with the numbers 1 to 16. The 
# matrix should have 4 rows & 4 columns 

four_trouble <- matrix(1:16,ncol = 4,nrow = 4)
four_trouble

# a. Arrange the elements by row 

four_troublebyrow <- matrix(1:16,ncol = 4,nrow = 4,byrow = T)
four_troublebyrow


# 4. Create an array named 'sky_maze' with the numbers 1 to 32. The array should 
# comprise of two 4*4 matrices

sky_maze <- array(1:32,dim = c(4,4,2))
sky_maze


sky_maze1 <- array(data = c(1:32) ,dim = c(4,4,2))
sky_maze1