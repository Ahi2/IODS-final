Name: Mohamadali Ahi
Email: mohamadali.ahi@helsinki.fi
Data: UCI Machine Learning Repository, Student Performance Data: https://archive.ics.uci.edu/ml/datasets/Student+Performance
This is the R-Script file to do data wrangling to prepare the data for further analysis. 

The aim is to understand the effect of different variables on the students performance in terms of final grade.
We use two datasets: students performance in mathematics and Portuguese language. 

We first need to read these two datasets into R, and look at the dimensions and structure of each dataset:
  

math <- read.table("C:/Data/IODS-final/student-mat.csv", sep=";", header=TRUE)

dim(math)
str(math)

As can be seen, 'math' dataset has 395 observation (rows) and 33 variables (columns). Now, lets look at Portuguese dataset. 

por <- read.table("C:/Data/IODS-final/student-por.csv", sep=";", header=TRUE)

dim(por)
str(por)

'por' dataset has 649 observations and 33 variables.

I join these two datasets now. To do so, I access the dplyr library first.

library(dplyr)

join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")

math_por <- inner_join(math, por, by = join_by, suffix = c(".math", ".por"))

Now I look at the names of the columns and then have a glance at the new dataset. 

colnames(math_por)
glimpse(math_por)

I now create a dataset with only the joined variables and will call it fam (because I am interested in knowing the effect of family (fam) relationship on grades)

fam <- select(math_por, one_of("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"))

The following is the columns in the datasets which were not used for joining the data:

notjoined_columns <- colnames(math)[!colnames(math) %in% join_by]

notjoined_columns

Now I use if-else structure to combine the duplicated answers from the two datasets. 

for(column_name in notjoined_columns) {
  two_columns <-  select(math_por, starts_with(column_name))
  first_column <- select(two_columns, 1)[[1]]
  if(is.numeric(first_column)) {
    fam[column_name] <- round(rowMeans(two_columns))
  } else {
    fam[column_name] <- (first_column)
  }
}

Let us have glimpse at the new combined data.

glimpse(fam)

Now my dataset is ready for analysis. I now save both of the created files in my hard drive.

write.csv(fam, file = "C:/Data/IODS-final/fam.csv", row.names = TRUE)

write.csv(math_por, file = "C:/Data/IODS-final/math_por.csv", row.names = TRUE)
