#-------------------------------------------------------------------------------
# Read csv file into R

cust_churn <- read.csv('customer_churn.csv' ,stringsAsFactors = T)
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv',stringsAsFactors = T)

library(ggplot2)
library(dplyr)

#-------------------------------------------------------------------------------
# 1. Create a histogram for 'Age' column using pharmacovigilance dataset:
# a. Set number of bins to 100. 

ggplot(data=pharma_data,aes(x=Age))+geom_histogram(bins=100,fill='slategrey',col='black')

# b. Assign as color 'azure' to the histogram.

ggplot(data=pharma_data,aes(x=Age))+geom_histogram(bins=100,fill='slategrey',col='Azure')


# c. Assign a color 'white' to the 'fill' attribute in geom_histogram function.
 
ggplot(data=pharma_data,aes(x=Age))+geom_histogram(bins=100,fill='white',col='Azure')


#-------------------------------------------------------------------------------
# 2. Create a histogram for 'Patient ID' using pharmacovigilance data set:
# a. Assign a color 'wheat3' to the plot.

ggplot(data = pharma_data,aes(x=PatientID))+geom_histogram(col='wheat3')

# b. Set number of bins to 50. 

ggplot(data = pharma_data,aes(x=PatientID))+geom_histogram(bins=50,col='wheat3')


# c. Assign a color 'black' to the 'fill' attribute in geom_histogram function.

ggplot(data = pharma_data,aes(x=PatientID))+geom_histogram(fill='black',bins=50,col='wheat3')


#-------------------------------------------------------------------------------
# 3. Create a histogram using customer churn data set: 
# a. Assign 'MonthlyCharges' column to the x-axis. 

ggplot(data=cust_churn,aes(x=MonthlyCharges))+geom_histogram()


# b. Set the number of bins to 80. 

ggplot(data=cust_churn,aes(x=MonthlyCharges))+geom_histogram(bins=80)


# c. Assign a color 'violet' to the bars.

ggplot(data=cust_churn,aes(x=MonthlyCharges))+geom_histogram(bins=80,col='Violet')


# d. Assign a color 'white' to the 'fill' attribute in geom_histogram function.

ggplot(data=cust_churn,aes(x=MonthlyCharges))+geom_histogram(bins=80,col='Violet',fill='white')


#-------------------------------------------------------------------------------
# 4. Create a histogram using customer churn data: 
# a. Assign 'tenure' column to the x-axis. 

ggplot(data=cust_churn,aes(x=tenure))+geom_histogram()


# b. Set the number of bins to 50. 

ggplot(data=cust_churn,aes(x=tenure))+geom_histogram(bins=50)


# c. Assign a color 'white' to the bars.

ggplot(data=cust_churn,aes(x=tenure))+geom_histogram(bins=50,col='white')



# d. Assign a color 'black' to the 'fill' attribute in geom_histogram function.

ggplot(data=cust_churn,aes(x=tenure))+geom_histogram(bins=50,col='white',fill='black')


