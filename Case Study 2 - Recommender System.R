#-------------------------------------------------------------------------------
# Read csv file into R

library(dplyr)  # data manipulation
library(recommenderlab) # building the recc engine

# -------------------------------------------------------------------------------
# 1. Implementing User-Based Recommender System: 
# a. Load the 'MovieLense' dataset which is a part of recommender lab Package 

data("MovieLense")
MovieLense@data
movie_vector <- as.vector(MovieLense@data)
table(movie_vector)
movie_vector <- movie_vector[movie_vector != 0]

# b. From the 'MovieLense' dataset, extract only those observations where the 
# users have seen atleast 100 movies & each movie has been seen at least 120 
# times. Store the result in 'sample_movie' 

sample_movies <- MovieLense[rowCounts(MovieLense) > 100,colCounts(MovieLense) > 120]

# c. Divide 'sample_movie' into train & test sets. The split ratio needs to be 70:30 

split_movie <- sample(x=c(T,F),size=nrow(sample_movies),replace = T,prob = c(0.7,0.3))

train_movies <- sample_movies[split_movie,]

test_movies <- sample_movies[!split_movie,]
# d. Build the User-Based Collaborative Filtering model on train set & store the 
# result in 'ubcf_model'

ubcf_model <- Recommender(train_movies, method = 'UBCF')


# e. Predict the values on the test set. The number of movies to be recommended is 
# 10. 

n_recc <- 10

predict_ubcf <- predict(ubcf_model,test_movies,n = n_recc)

# f. Recommend movies for user-3 & user-5 

user_3_recc <- predict_ubcf@items[3]
user_3_recc
predict_ubcf@itemLabels[unlist(user_3_recc)]
  
  
user_5_recc <- predict_ubcf@items[5]
user_5_recc
predict_ubcf@itemLabels[unlist(user_5_recc)]
# -------------------------------------------------------------------------------
# 2. Implementing Item-Based Recommender System: 
# a. On the same train set, build the Item-Based Collaborative Filtering Model & 
# store the result in 'ibcf_model' 

ibcf_model <- Recommender(train_movies,method = 'IBCF')


# b. Predict the values on test. The number of movies to be recommended is 12 

n_recc_ibcf <- 12

predict_ibcf <- predict(ibcf_model,test_movies,n = n_recc_ibcf)


# c. Recommend movies for user-2 & user-4

user_2_recc <- predict_ibcf@items[2]
user_2_recc
predict_ibcf@itemLabels[unlist(user_2_recc)]

user_4_recc <- predict_ibcf@items[4]
user_4_recc
predict_ibcf@itemLabels[unlist(user_4_recc)]
