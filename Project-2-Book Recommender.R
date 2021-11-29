#-------------------------------------------------------------------------------
library(dplyr)
library(tidyr)
library(data.table)
library(recommenderlab)
library(ggplot2)
library(stringr)
library(Matrix)
library(methods)
library(DT)
library(grid)
library(gridExtra)
library(knitr)


book_tags <- read.csv('book_tags.csv')
books <- read.csv('books.csv',stringsAsFactors = T)
ratings <- read.csv('ratings.csv')
tags <- read.csv('tags.csv',stringsAsFactors = T)

#-------------------------------------------------------------------------------
# 1) In the first phase, we'd do a bit of data cleaning.
# a. So, we'll start off by removing the duplicate ratings. i.e., there are cases where a user has 
# rated the same book more than one time. So, we'll go ahead & remove all these instances. 

ratings <- ratings %>% group_by(user_id,book_id) %>% mutate(N = n())
table(ratings$N)
ratings <- ratings %>% filter(N == 1)
table(ratings$N)

# b. After which, we'll go ahead & remove those users who have rated fewer than 3 books

ratings <- ratings %>% group_by(user_id) %>% mutate(ratings_given = n())

ratings <- ratings %>% filter(ratings_given > 2)

#-------------------------------------------------------------------------------
# 2) In the second phase we'll do some data exploration
# a. We'll start off by extracting a sample set of 2% records from the entire data set. 

set.seed(1)
sample <- 0.02
unique_users <- unique(ratings$user_id)
sample_users <- sample(unique_users,round(sample*length(unique_users)))
nrow(ratings)
ratings <- ratings %>% filter(user_id %in% sample_users)
nrow(ratings)
# b. Then, we will make a bar-plot for the distribution of ratings. i.e we'd want to analyze the 
# count of different ratings. 

ratings %>% ggplot(aes(x=rating,fill = factor(rating))) + geom_bar()


# c. After which, we'll make a plot to understand how many times each book has been rated. 

ratings %>% group_by(book_id) %>% 
  summarize(num_of_ratings_per_book = n()) %>%
  ggplot(aes(x = num_of_ratings_per_book))+geom_bar(fill = 'skyblue',col = 'blue',width = 1)+coord_cartesian(c(0,12))


# d. Then, we'll make a plot for the percentage distribution of different 'genres'. 

genres <- str_to_lower(c('Art','Biography','Business',"Children's",'Christian','Romance','Science',
                         'science Fiction','Crime','Fantasy','Horror','Humor and Comedy','Travel',
                         'Thriller','religion','Spirituality','Classics','Music','Comics'))

available_genres <- genres [str_to_lower(genres) %in% tags$tag_name]
available_tags <- tags$tag_id[match(available_genres,tags$tag_name )]

book_info <- book_tags %>% filter(tag_id %in% available_tags) %>% 
  group_by(tag_id) %>% 
  summarize(n = n()) %>% 
  ungroup() %>%
  mutate(sumN = sum(n), percentage = n/sumN) %>%
  arrange(-percentage) %>%
  left_join(tags, by = 'tag_id') 
  
book_info %>% ggplot(aes(reorder(tag_name,percentage),percentage,fill = 'percentage'))+
  geom_bar(stat = 'identity')+
  coord_flip()


# e. Going ahead, we'll find the top 10 books with highest ratings. 

top_10 <- books %>% arrange(-average_rating) %>% 
  top_n(10,wt=average_rating) %>% 
  select(title,ratings_count,average_rating)


# f. And finally, we'll find out the 10 most popular books


popular_10 <- books %>% arrange(-ratings_count) %>% 
  top_n(10,wt=ratings_count) %>%
  select(title,ratings_count,average_rating)


#-------------------------------------------------------------------------------
# 3) In the 3rd phase, we'll finally do some recommending!!!!
# a. So, we'll start off by building the 'user-based collaborative filtering' model.

dimension_names <- list(user_id=sort(unique(ratings$user_id)),book_id=sort(unique(ratings$book_id)))
ratingmat <- spread(select(ratings,book_id,user_id,rating),book_id,rating) %>% select(-user_id)

ratingmat <- as.matrix(ratingmat[,-1])
ratingmat[1:5,1:5]
dimnames(ratingmat) <- dimension_names
ratingmat[1:5,1:5]
dim(ratingmat)



ratingmat0 <- ratingmat
dim(ratingmat0)
ratingmat0[is.na(ratingmat0)] <- 0
ratingmat0[1:5,1:5]
sparse_rating <- as(ratingmat0,'sparseMatrix')
sparse_rating[1:5,1:5]
real_ratings <- new('realRatingMatrix',data=sparse_rating)

sample(x=c(T,F),size = nrow(real_ratings),replace = T,prob = c(0.80,0.20)) -> sample_split 

real_ratings[sample_split,] -> recc_train
real_ratings[!sample_split,] -> recc_test

# b. Then, we'll recommend 6 new books for two different readers

recc_model_ibcf <- Recommender(data = recc_train,method = 'IBCF')

recc_num <- 6

recc_predict <- predict(recc_model_ibcf, recc_test,n=recc_num)

user_5_book_predictions <- recc_predict@items[[5]]
recc_predict@itemLabels[user_5_book_predictions]
 
books %>% filter(id == 616) %>% select(title,authors)
books %>% filter(id == 779) %>% select(title,authors)
books %>% filter(id == 820) %>% select(title,authors)

user_20_book_predictions <- recc_predict@items[[20]]
recc_predict@itemLabels[user_20_book_predictions]

books %>% filter(id == 420) %>% select(title,authors)
books %>% filter(id == 454) %>% select(title,authors)
books %>% filter(id == 208) %>% select(title,authors)
