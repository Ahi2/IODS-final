Name: Mohamadali Ahi
Email: mohamadali.ahi@helsinki.fi
Data: 
This is the R-Script file to do data wrangling to prepare the data for further analysis.

Reading the two datasets

hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

str(hd)
dim(hd)
summary(hd)

str(gii)
dim(gii)
summary(gii)

colnames(hd)

colnames(hd) <- c("HDI.rank", "Country", "HDI", "Life.Exp", "Edu.Exp", "Edu.Mean", "GNI", "GNI.rank")

colnames(gii)

colnames(gii) <- c("GII.Rank", "Country", "GII", "Mat.Mor", "Ado.Birth", "Parli.F", "Edu2.F", "Edu2.M", "Labo.F", "Labo.M")



