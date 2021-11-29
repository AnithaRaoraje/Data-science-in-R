#-------------------------------------------------------------------------------
# Read csv file into R

ratings <- read.csv('ratings_movies.csv')
movies <- read.csv('movies.csv',stringsAsFactors = F)


library(dplyr)  # data manipulation
library(tidyr) # data manipulation
library(Matrix) # this is convert different matrix structures
library(recommenderlab) # building the recc engine
library(reshape2)
# -------------------------------------------------------------------------------
# 1. Implementing User-Based Recommender System using SVD (Singular Value 
# Decomposition) method: 
# a. Load the 'ratings' and 'movies' datasets which is a part of 'MovieLense' 
# b. From the 'ratings' dataset, extract only those observations where a user has
# rated at least 131 movies & each movie has been rated more than30 times.

movie_group <- ratings %>% group_by(movieId) %>% summarise(count = n())

movie_30 <- as.data.frame(movie_group$count > 30)

movie_30 <- subset(movie_group,movie_30 == T)

ratings_group <- ratings %>% group_by(userId,) %>% summarise(count = n())

ratings_131 <- as.data.frame(ratings_group$count > 131 )

ratings_131 <- subset(ratings_group,ratings_131 == T)

# c. Create a rating matrix for the 'ratings' dataset and convert it to a 
# 'realRatingMatrix' object and store it in 'ratingmat' 

ratingmat <- dcast(ratings,userId~movieId,value.var = 'rating',na.rm = F)

ratingmat <- as.matrix(ratingmat[,-1])

ratingmat <- as(ratingmat,'realRatingMatrix')

ratingmat_normalized <- normalize(ratingmat)



# d. Build the User-Based Collaborative Filtering model on the 'ratingmat' using 
# SVD method & store the result in 'recommender_model' 

recommender_model <- Recommender(ratingmat_normalized,method = 'UBCF')


# e. Predict the ratings for the 5th user and store the result as a list in 'recom_list'. 
# f. Print the top10 recommended movies for 5th user 

recom_list  <- predict(recommender_model,ratingmat[5],n=10)

recom_list <- as(recom_list,'list')

recom_list

# g. Print evaluation metrics for the SVD model using the 5-fold cross-validation for 
# top 1, 3, 5, and 10 recommendations

evaluation_metric <- evaluationScheme(ratingmat,method = 'cross-validation',k=5,given = 3,goodRating = 5)

evaluation_results <- evaluate(evaluation_metric,method = 'SVD',n=c(1,3,5,10))

eval_results <- getConfusionMatrix(evaluation_results)[[1]]

eval_results


