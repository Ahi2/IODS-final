Name: Mohamadali Ahi
Email: mohamadali.ahi@helsinki.fi
Data: UCI Machine Learning Repository, Student Performance Data: https://archive.ics.uci.edu/ml/datasets/Student+Performance
This is the R-Script file to do data wrangling to prepare the data for further analysis. 

The aim is to understand the effect of different variables on the students performance data in terms of their final grade.
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

We need to join these two datasets now. To do so, we should access the dplyr library.

library(dplyr)

join_by <- c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet")

math_por <- inner_join(math, por, by = join_by, suffix = c(".math", ".por"))


colnames(math_por)
glimpse(math_por)
