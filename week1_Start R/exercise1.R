##practice

##vector
x <- c(1,2)                #integer
x <- c(1.7,2.4)            #numeric
x <- c(T,F)                #logic
x <- vector("numeric",length=10)  #also:complex,character
y <- c(1.7,"a")
y <- c(TRUE,"a")
z <- 0:8
class(z)
as.numeric(z)
as.character(z)
as.complex(z)

##list
x <- list(1,"a",1+8i,0.1,T)

##matrix
m <- matrix(nrow=3,ncol=4)
dim(m)
attributes(m)
m <- matrix(1:12,nrow=3,ncol=4)
dim(m) <- c(2,6)
x <- 1:3
y <- 7:9
rbind(x,y)
cbind(x,y)

##factor
x <- factor(c("yes","yes","no","yes","no"))
table(x)
unclass(x)

x <- factor(c("yes","yes","no","yes","no"),levels = c("yes","no"))
#yes is first level,no is second level

##Data Frame, read.table(), read.csv(), row.name, data.matrix()
x <- data.frame(foo = 1:4, bar = c(T, T, F, F))
nrow(x)
ncol(x)

##Names
x <- c(1, 2, 3, 4)
names(x)
names(x) <- c('bar', 'jun', 'li', 'kk')
x

##Quiz1 dataset

##Detail of the dataset
data <- read.csv("hw1_data.csv")
str(data)

names(data)
r2 <- file("hw1_data.csv", "r")
data2 <- readLines(r2,3)
close(r2)
nrow(data) #R can divide the first line (feature name)!!!

##14.Extract the last 2 rows of the data frame and print them to the console. 
##What does the output look like?
datal2 <- tail(data,2) #head,tail
print(datal2)

##15.What is the value of Ozone in the 47th row?
print(data[47,1, drop = FALSE])

##16.How many missing values are in the Ozone column of this data frame?
sum(is.na(data$Ozone))

##17.What is the mean of the Ozone column in this dataset? 
##Exclude missing values (coded as NA) from this calculation.
mean(data$Ozone[!is.na(data$Ozone)])

##18.Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. 
##What is the mean of Solar.R in this subset?

Solarset <- subset(data, Ozone >31 & Temp >90)
mean(Solarset$Solar.R[!is.na(Solarset$Solar.R)])
##or another way
val <- complete.cases(data$Solar.R, data$Ozone, data$Temp)
mean(data$Solar.R[val & data$Ozone >31 & data$Temp >90])

##19.What is the mean of "Temp" when "Month" is equal to 6?
mean(data$Temp[data$Month == 6])

##20.What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
max(data$Ozone[data$Month == 5 & !is.na(data$Ozone)])