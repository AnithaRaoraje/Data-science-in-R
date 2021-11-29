#-------------------------------------------------------------------------------
# Read csv file into R

pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)

library(ggplot2)
library(dplyr)

#-------------------------------------------------------------------------------
# 1. Build a bar-plot: 
# a. Assign 'LocationID'column to x-axis. 

ggplot(data=pharma_data,aes(x=LocationID))+geom_bar()

# b. Assign 'Issues' to the fill attribute.

ggplot(data=pharma_data,aes(x=LocationID,fill=Issues))+geom_bar()


# c. Set title to 'Location ID Plot'

ggplot(data=pharma_data,aes(x=LocationID,fill=Issues))+geom_bar()+labs(title='Location ID Plot')

#-------------------------------------------------------------------------------
# 2. Build a bar-plot for the 'DrugID' column:
# a. Assign the fill color to be 'orange'

ggplot(data=pharma_data,aes(x=DrugID))+geom_bar(fill='orange')


# b. Assign the boundary color to be 'peru'

ggplot(data=pharma_data,aes(x=DrugID))+geom_bar(fill='orange',col='peru')

# c. Set title to 'Drug ID Plot'

ggplot(data=pharma_data,aes(x=DrugID))+geom_bar(fill='orange',col='peru')+labs(title='Drug ID Plot')


#-------------------------------------------------------------------------------
# 3. Build a bar-plot for the 'Gender' column assigned to x-axis and then: 
# a. Assign 'DrugID' to the fill aesthetic

ggplot(data=pharma_data,aes(x=Gender,fill=DrugID))+geom_bar()


# b. Assign 'Issues' to the fill aesthetic

ggplot(data=pharma_data,aes(x=Gender,fill=Issues))+geom_bar()


# c. Change the position of bars to 'identity'

ggplot(data=pharma_data,aes(x=Gender,fill=Issues))+geom_bar(position = 'identity')


# d. Set title to 'Gender Plot'

ggplot(data=pharma_data,aes(x=Gender,fill=Issues))+geom_bar(position = 'identity')+labs(title='Gender Plot')

