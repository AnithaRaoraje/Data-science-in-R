#------------------------------------------------------------------------------
#Reading city temperature data set into R Studio
read_file <- ('city_temperature.csv')
city_temp <- read.csv(read_file)

#------------------------------------------------------------------------------
#1. Find the class of the following attributes: 
# a. Region 

col_name <- city_temp$Region
class(col_name) -> class_region
View(class_region)

# b. Country 

col_name <- city_temp$Country
class(col_name) -> class_country


# c. City 

col_name <- city_temp$City
class(col_name)  -> class_city

# d. Month 

col_name <- city_temp$Month
class(col_name) -> class_month


# e. Day 

col_name <- city_temp$Day
class(col_name) -> class_day


# f. Year 

col_name <- city_temp$Year
class(col_name) -> class_year

# g. Avg Temperature

col_name <- city_temp$AvgTemperature
class(col_name) -> class_avg_temp

#------------------------------------------------------------------------------
#Reading city temperature data set into R Studio
read_file1 <- ('Placement_Data_Full_Class.csv')
placement<- read.csv(read_file1)

#------------------------------------------------------------------------------

# 2. After finding the class of the above attributes, convert them to the 
#     following data type: 
# i) Vector to Character 
# a. Gender 

col_name <- placement$gender
class(col_name) -> class_gender

# b. ssc_b 

col_name <- placement$ssc_b
class(col_name) -> class_ssc_b

# c. hsc_b 

col_name <- placement$hsc_b
class(col_name) -> class_hsc_b

# d. hsc_s 

col_name <- placement$hsc_s
class(col_name) -> class_hsc_s

# e. status 

col_name <- placement$status
class(col_name) -> class_status

# f. workex 

col_name <- placement$workex
class(col_name) -> class_workex

# g. specialization

col_name <- placement$specialisation
class(col_name) -> class_specialisation

# ii) Check the class of placement_data and convert it to character data type.

class(placement)
as.character(placement) -> ac_char
View(ac_char)
