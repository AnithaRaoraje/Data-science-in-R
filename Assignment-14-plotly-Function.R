#-------------------------------------------------------------------------------
# Read csv file into R

pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv' ,stringsAsFactors = T)

library(plotly)

#-------------------------------------------------------------------------------
# 1. Build a histogram for the 'Age' column.
# a. Color should be determined by 'Issues' column

plot_ly(data=pharma_data,x=~Age,type = 'histogram',color = ~Issues)

# b. Color should be determined by 'Gender' column

plot_ly(data=pharma_data,x=~Age,type = 'histogram',color = ~Gender)


#-------------------------------------------------------------------------------
# 2. Create a scatter plot between 'Age' & 'Gender' as per the following condition: 
# a. Map 'Age' on the y-axis 

plot_ly(data=pharma_data,y=~Age,type='scatter',mode="markers")


# b. Map 'Gender' on the 'x-axis'

plot_ly(data=pharma_data,x=~Gender,type='scatter',mode="markers")



# c. Color should be determined by 'Issues' column

plot_ly(data=pharma_data,y=~Age,x=~Gender,type='scatter',mode="markers",color = ~Issues)

ggplot(data=pharma_data,aes(x=Gender,y=Age,col=Issues))+geom_point()

#-------------------------------------------------------------------------------
# 3. Create a box-plot between 'DrugID' & 'Age'.
# a. Map 'DrugID' on the x-axis 

plot_ly(data=pharma_data,x=~DrugID,type = 'box')

# b. Map 'Age' on the y-axis 

plot_ly(data=pharma_data,y=~Age,type = 'box')


# c. Color should be determined by 'Gender' column 

plot_ly(data=pharma_data,x=~DrugID,y=~Age,type = 'box',color = 'Gender')




