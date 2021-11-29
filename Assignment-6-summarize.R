#-------------------------------------------------------------------------------
# Read csv file into R

placement_data <- read.csv('Placement_Data_Full_class.csv',stringsAsFactors = T)

library(dplyr)

#-------------------------------------------------------------------------------

# 1. Using summarize() function calculate the following for etest column: 
# a. Median 

med_etest <- summarise(placement_data,med_etest = median(etest_p))

# b. Variance 

var_etest <- summarise(placement_data,var_etest_p = var(etest_p))

# c. Standard Deviation 


sd_etest <- summarise(placement_data,sd_etest = sd(etest_p))

#-------------------------------------------------------------------------------
# 2. Calculate the following for MBA percentage(mba_p) of students: 
# a. Median 

med_mba <- summarise(placement_data,med_mba = median(mba_p))

# b. Variance 

var_mba <- summarise(placement_data,var_mba = var(mba_p))

# c. Standard Deviation 

sd_mba <- summarise(placement_data,sd_mba = sd(mba_p))

#-------------------------------------------------------------------------------
# 3. Calculate the median of hsc_p and group it w.r.t. 'Salary' column. 

group_sal <- summarise(group_by(placement_data,salary),med_hsc = median(hsc_p))


#-------------------------------------------------------------------------------
# 4. Calculate variance ssc_p and group it w.r.t. 'Salary' column. 

sal_ssc <- summarise(group_by(placement_data,salary),var_ssc = var(ssc_p))


#-------------------------------------------------------------------------------
# 5. Calculate standard deviation of etest_p and group it w.r.t. 'Salary'.

sal_etest <- summarise(group_by(placement_data,salary),sd_etestp = sd(etest_p))

