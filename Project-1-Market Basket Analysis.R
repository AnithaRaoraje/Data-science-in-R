#-------------------------------------------------------------------------------
market_basket <- read.transactions('market_basket.csv',
                                   format = 'basket',
                                   sep = ',',
                                   rm.duplicates = T,
                                   skip = 1,
                                   quote = '')
library(dplyr)
library(arules)
library(arulesViz)
library(RColorBrewer)
#-------------------------------------------------------------------------------
# A) Understand the Transactions 

summary(market_basket)

# a. Find the total number of transactions 

num_transactions <- nrow(market_basket)

# b. Find the total number of items in the inventory 

num_items <- ncol(market_basket)

# c. Find the total number of items purchased 

num_items_purchased <- 18440*22346*0.0009915565


# d. Find out the 10 most frequently bought items & make a plot

itemFrequencyPlot(market_basket,
                  topN = 10,
                  type = 'absolute',
                  horiz = T,
                  col = brewer.pal(10,'Spectral'))


#-------------------------------------------------------------------------------
# B) Building 1st set of association rules 
# a. Build apriori algorithm with support value-> 0.005 & Confidence value-> 0.8 

rule1 <- market_basket %>% 
  apriori(parameter = list(supp = 0.005,conf = 0.8)) 

# b. Sort the rules w.r.t confidence & inspect the top 5 rules & the bottom 5 rules 

rule1 %>% sort(by='confidence') %>% head(n=5) %>% inspect

rule1 %>% sort(by='confidence') %>% tail(n=5) %>% inspect

# c. Sort the rules w.r.t lift & Inspect the top 5 rules 

rule1 %>% sort(by='lift') %>% head(n=5) %>% inspect


# d. Plot the rules using different methods

plot(rule1,engine = 'htmlwidget')
plot(rule1,method = 'two-key', engine = 'htmlwidget')
plot(rule1,method = 'graph',engine = 'htmlwidget')


#-------------------------------------------------------------------------------
# C) Building 2nd set of association rules 
# a. Build apriori algorithm with support value-> 0.009 & Confidence value-> 0.3 

rule2 <- market_basket %>% apriori(parameter = list(supp = 0.009,conf = 0.3))

# b. Sort the rules w.r.t confidence & inspect the top 5 rules & the bottom 5 rules 

rule2 %>% sort(by='confidence') %>% head(n=5) %>% inspect

rule2 %>% sort(by='confidence') %>% tail(n=5) %>% inspect

# c. Plot the rules using different methods

plot(rule2,engine = 'htmlwidget')

plot(rule2,method = 'two-key',engine = 'htmlwidget')

plot(rule2,method = 'graph',engine = 'htmlwidget')

#-------------------------------------------------------------------------------
# D) Building 3rd set of association rules 
# a. Build apriori algorithm with support value-> 0.02 & Confidence value-> 0.5 

rule3 <- market_basket %>% apriori(parameter = list(supp = 0.02,conf = 0.5))


# b. Sort the rules w.r.t support & inspect the top 5 rules & the bottom 5 rules 

rule3 %>% sort(by = 'support') %>% head(n=5) %>% inspect

rule3 %>% sort(by = 'support') %>% tail(n=5) %>% inspect

# c. Plot the rules using different methods

plot(rule3,engine = 'htmlwidget')

plot(rule3,method = 'two-key',engine = 'htmlwidget')

plot(rule3,method = 'graph',engine = 'htmlwidget')


