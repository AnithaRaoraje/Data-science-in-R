#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_class.csv',stringsAsFactors = T)

library(dplyr)

#-------------------------------------------------------------------------------
# 1. Extract the data of students who studied Science (hsc_s) from Central board (hsc_b) 
# and secured more than 70 percent (hsc_p) and store it in s_science. 

s_science <- filter(placement_data,hsc_s == 'Science' & hsc_b == 'Central' & hsc_p > 70.00)

View(s_science)

# 2. Extract the data of students who are pursuing a degree in Commerce & Management 
# (degree_t) and specialization is Mkt&Fin and store it in d_commerce. 

d_commerce <- filter(placement_data,degree_t == 'Comm&Mgmt' & specialisation == 'Mkt&Fin')

View(d_commerce)

# 3. Extract the data of students whose score in MBA (mba_p) is greater than 75 with 
# etest score greater than 70. 

mba_etest <- filter(placement_data,mba_p > 75.00 & etest_p > 70.00)

View(mba_etest)

# 4. Extract the data of students with specialization as Mkt&Fin with etest score greater 
# than 90. 

spec_etest <- filter(placement_data,specialisation == 'Mkt&Fin' & etest_p > 90.00)

View(spec_etest)

# 5. Extract the data of students who are either from Commerce or Science stream.

comm_science <- filter(placement_data,hsc_s == 'Commerce' | hsc_s ==  'Science')

View(comm_science)
