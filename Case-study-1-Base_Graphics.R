#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)

#-------------------------------------------------------------------------------
# 1. Create a bar-plot for the 'PaymentMethod' column. 
# a. Assign the color 'burlywood4'

plot(cust_churn$PaymentMethod,col='burlywood4')


# b. Assign the x-axis label to be "Payment Method"

plot(cust_churn$PaymentMethod,col='burlywood4',xlab='Payment Method')

# c. Assign the title to be "Bar-Plot for Payment Method"

plot(cust_churn$PaymentMethod,col='burlywood4',xlab='Payment Method',main='Bar-Plot for Payment Method')

#-------------------------------------------------------------------------------
# 2. Create a histogram for the 'TotalCharges' column 
# a. Assign the color 'forestgreen'

hist(cust_churn$TotalCharges,col='forestgreen')


# b. Assign the x-axis label to be "Total Charges"

hist(cust_churn$TotalCharges,col='forestgreen',xlab='Total Charges')

# c. Assign the title to be "Histogram for Total Charges"

hist(cust_churn$TotalCharges,col='forestgreen',xlab='Total Charges',main='Histogram for Total Charges')


#-------------------------------------------------------------------------------
# 3. Create a density plot for the 'TotalCharges' column
# a. Assign the color 'maroon'

plot(density(cust_churn$TotalCharges,na.rm=T),col='maroon')

# b. Assign the x-axis label to be "Total Charges"

plot(density(cust_churn$TotalCharges,na.rm=T),col='maroon',xlab='Total Charges')


# c. Assign the title to be "Density plot for Total Charges"

plot(density(cust_churn$TotalCharges,na.rm=T),
     col='maroon',
     xlab='Total Charges',
     main='Density plot for Total Charges')


