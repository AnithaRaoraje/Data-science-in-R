# Reading csv file into R
placement_data <- read.csv('Placement_Data_Full_Class.csv')
pharma_data <- read.csv('Pharmacovigilance_audit_Data.csv')
temp_data <- read.csv('city_temperature.csv')



# 1.Using the placement data set, perform the following tasks: 
#   a. Check the value of 12th row of degree_t column, if the value is 
# "Comm&Mgmt", and then print "The student is of the stream Commerce 
# and Management".
# b. Check the value of 23rd row of specialization column, if the value is 
# "Mkt&HR", then print "The specialization of student is Marketing and 
# Human Resource"
# c. Check the 39th row of status column, if the value is "Placed", then print 
# "The student is placed from campus."

degree_t_12 <- if (placement_data$degree_t[12] == 'Comm&Mgmt'){
  print('The student is of the stream Commerce and Management')
}


specialisation_23 <- if (placement_data$specialisation[23] == 'Mkt&HR'){
  print('he specialization of student is Marketing and Human Resource')
}

status_39 <- if (placement_data$status[39] == 'Placed'){
  print('The student is placed from campus')
}



# 2. Using the pharmacovigilance data set, perform the following tasks: 
#   a. Check the value of 37th row of Issues column, if the value is 
# "Medication history documenting error", then print "The patient's medical 
# record is missing".
# b. Check the value of 180th row of Issues column, if the value is "Unclear 
# Route", then print "The patient is having an unclear route of transmission"
# c. Check the 220th row of Location ID column, if the value is "Location3", 
# then print "The location ID of the patient is Location3."


issues_37 <- if (pharma_data$Issues[37] == 'Medication history documenting error') {
  print('The patient's medical record is missing')
}

issues_180 <- if (pharma_data$Issues[180] == 'unclear route') {
  print('The patient is having an unclear route of transmission')
}


loc_220 <- if (pharma_data$LocationID[220] == 'Location3'){
  print('The location ID of the patient is Location3')
}




# 3. Using the city temperature data set, perform the following tasks: 
#   a. Check the value of 11th row of Region column, if the value is "Africa", then 
# print "The region for which we are calculating average temperature is 
# Africa".
# b. Check the value of row number 79961 of city column, if the value is 
# "Conakry", then print "The city for which we are calculating average 
# temperature is Conakry".
# c. Check the value of 70th row of year column, if the value is "1995", then 
# prints "We are calculating average temperature for the year 1995"



reg_11 <- if(temp_data$Region[11] == 'Africa'){
  print('The region for which we are calculating average temperature is Africa')
}

city_79961 <- if(temp_data$City[79961] == 'Conakry'){
  print('The city for which we are calculating average temperature is Conakry')
}

year_70 <- if(temp_data$Year[70] == 1995){
  print('We are calculating average temperature for the year 1995')
}
