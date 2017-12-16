Name: Mohamadali Ahi
Email: mohamadali.ahi@helsinki.fi
Data: 
This is the R-Script file to do data wrangling to prepare the data for further analysis.

Reading the two datasets

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

