#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_Class.csv' ,stringsAsFactors = T)

library(ggplot2)
library(dplyr)

#-------------------------------------------------------------------------------
# 1. Build a bar-plot for the 'specialisation' column. Give it a fill color of 'skyblue'
# a. Give the panel a background color of 'cornsilk4'.

ggplot(data = placement_data,aes(x=specialisation))+
        geom_bar(fill='skyblue')+
        theme(panel.background = element_rect(fill='cornsilk4'))

# b. Give the plot a background color of 'lightgreen'.

ggplot(data = placement_data,aes(x=specialisation))+
        geom_bar(fill='skyblue')+
        theme(panel.background = element_rect(fill='lightgreen'))


#-------------------------------------------------------------------------------
# 2. Build a scatter-plot between 'hsc_p' & 'ssc_p'. Map 'hsc_p' on the y-axis & 'ssc_p' on 
# the x-axis. Assign a color of 'lightgreen' to the points.
# a. Add a title to the plot 'HSC Percent vs SSC Percent.

ggplot(data = placement_data,aes(x=ssc_p,y=hsc_p))+
        geom_point(col='lightgreen')+
        labs(title = 'HSC Percent vs SSC Percent')

# b. Give the panel a background color of 'skyblue'.

ggplot(data = placement_data,aes(x=ssc_p,y=hsc_p))+
  geom_point(col='lightgreen')+
  labs(title = 'HSC Percent vs SSC Percent')+
  theme(panel.background = element_rect(fill='skyblue'))

# c. Give the plot a background color of 'beige'.

ggplot(data = placement_data,aes(x=ssc_p,y=hsc_p))+
  geom_point(col='lightgreen')+
  labs(title = 'HSC Percent vs SSC Percent')+
  theme(panel.background = element_rect(fill='beige'))

# d. Center align the title. 

ggplot(data = placement_data,aes(x=ssc_p,y=hsc_p))+
  geom_point(col='lightgreen')+
  labs(title = 'HSC Percent vs SSC Percent')+
  theme(panel.background = element_rect(fill='beige'))+
  theme(plot.title = element_text(hjust = 0.5))


