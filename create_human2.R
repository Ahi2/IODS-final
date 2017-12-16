Name: Mohamadali Ahi
Email: mohamadali.ahi@helsinki.fi
Data: The data used for the assignment is the 'human' data originating from he United Nations Development Programme. The data can be found here: http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt
      The data are categoeized into two sets: "Human development" and "Gender inequality". I am going to join these two datasets and create a new variable.
      The procedure is explained below.
      Therefore, this is a R-Script file in which I am going to do data wrangling to prepare the data for further analysis.

# Reading the two datasets
      
    First, reading the Human Development data
    
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)

   Now we explore the data further by looking at the structure, dimension and the summary of the data. 
str(hd)
dim(hd)
summary(hd)

    Then, reading the 'gender inequality' data: 
    
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

    Now we explore the data further by looking at the structure, dimension and the summary of the data.
str(gii)
dim(gii)
summary(gii)

# Let us look at the column names and replace them with easier, shorter ones.

colnames(hd)
colnames(hd) <- c("HDI.rank", "Country", "HDI", "Life.Exp", "Edu.Exp", "Edu.Mean", "GNI", "GNI.rank")

colnames(gii)
colnames(gii) <- c("GII.Rank", "Country", "GII", "Mat.Mor", "Ado.Birth", "Parli.F", "Edu2.F", "Edu2.M", "Labo.F", "Labo.M")

# We now mutate the "Gender inequality" data and create two new variables. 
 
   First, the ratio of Female and Male populations with secondary education in each country. (i.e. edu2F / edu2M):

gii <- mutate(gii, Edu2.FM = Edu2.F/Edu2.M)

   Then, the ratio of labour force participation of females and males in each country (i.e. laboF / laboM).
   
gii<- mutate(gii, Labo.FM = Labo.F/Labo.M)

# I now join together the two datasets using the variable Country as the identifier

join_by <- c("Country")

human2 <- inner_join(hd, gii, by = join_by, suffix = c(".hd", ".gii"))

dim(human2)
colnames(human2)

# Now I transform the Gross National Income (GNI) variable to numeric, as now it is read as factor.

library(stringr)

str(human2$GNI)

str_replace(human2$GNI, pattern = ",", replace = "") %>% as.numeric(human2$GNI)

# Let us now exclude unneeded variabes, keeing only the following columns in the code

keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")

human2 <- select(human2, one_of(keep))

# Now we remove all rows with missing values
complete.cases(human2)
data.frame(human2[-1], comp = complete.cases(human2))

# filtering out all rows with NA values

human2_ <- filter(human2, complete.cases(human2))

# Data is ready!
The data should now be ready for analysis. 


