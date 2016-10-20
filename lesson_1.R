################################################
## Exercises ###################################
################################################

# c - concatenate
#     - takes two (or more) vector and joins them together
c(1, 2, 3)
c(c(1,2,3), c(4,5,6))
#     - they need to be of the same type, though!
c(1,2, "three")

##### cat - concatenate and print
  # - kind of like print but print returns a vector and cat returns an object of class "NULL"
x<-"howdy partner"
cat(x)  #howdy partner
class(cat(x)) #howdy partner[1] "NULL"
m2<-matrix(1:12,3,4)
cat(m2)
#[1] 1 2 3 4 5 6 7 8 9 10 11 12

##### cbind - combine R objects by columns (rbind does the same thing only by rows instead of columns)
  # - takes a seq of vector, matrix, or df arguments and combines them by col, you can also rearrange the column orders
m2<-cbind(8:14,1:7)
m2<-cbind(m2,15:21)[,c(1,3,2)]

##### col, row - column and row indexes
  # - returns a matrix of integers indicating their row/column in a matrix like object
m2<-matrix(0,5,5)
m2[row(m2)==col(m2)]<-1
##This creates a 5:5 matrix and inserts 1 diagonally across the rows, but I'm not really sure why....I've played around
  #with this a bit and I think I am going to need a little bit of extra explanation

##### cut - convert numeric to factor
  # - divides a numeric vector into different ranges
x<-rbinom(5,20,0.2)
#[1] 6 6 3 1 1
test<-cut(x,breaks=2)
#[1] (3.5,6]    (3.5,6]   (0.995,3.5] (0.995,3.5] (0.995,3.5]
#Levels: (0.995,3.5]  (3.5,6]

##### diff - Lagged Differences
  # - returns suitably lagged and iterated differences
diff(1:10,2)
#[1] 2 2 2 2 2 2 2 2
diff(1:10,2,2)
#[1] 0 0 0 0 0 0
diff(1:100,99)
#[1] 99

##### dim - Dimensions of an Object
  # - tells you the dimensions of an object in rows and columns
m2<-matrix(1:12,3,4)
dim(m2)
#[1] 3 4
dim(airquality) #airquality is a dataset that is already in R
  #[1] 153  6

##### rownames, colnames, names - retrieve or set the row or column names of a matrix-like object, The names of an object
  # - allows you to set the names of rows and columns in a matrix, allows you to get or set the names of an object
x<-matrix(data=NA,4,0)
y<-cbind(1,1:4)
colnames(y)<-c("ones","one to four")
rownames(y)<-c("ur","mom","goes 2","college")


##### expand.grid

#####eigen,%*%, lower.tri, upper.tri, diag
  #####(try?"%*%", not?%*%, as this is an operator, and document the function, not the maths)

##### gl

##### identical

##### image

##### library

##### jitter

##### ls; what does rm(list=ls(()) do? - List Objects
  # - rm(list=ls()) erases R's memory of the names of objects you have previously called out
  # - ls shows what data sets and functions have been defined by the user (when invoked with no argument)
  # - ls returns the names of the functions local variables (when invoked with no argument inside of a function)

marleyfunc<-function(){y<-1;ls()}
marleyfunc
#function(){y<-1;ls()}  shows "y"
x<-c(1,2,3)
q<-c(4,5,6)
x
#[1] 1 2 3
rm(list=ls())
x
#Error: object 'x' not found
q
#Error: object 'q' not found

## mean, median, max, min - Arithmetic Mean, Median Value, Maxima and Minima
  # - Generic function for the arithmetic mean, computing the sample median, or returning the maximum and minimum input values
m2<-matrix(1:12,3,4)
mean(m2)
#[1] 6.5
median(m2)
#[1] 6.5
max(m2)
#[1] 12
min(m2)
#[1] 1

## paste - Concatenate Strings
  # - allows you to concatenate vectors after converting to character
family<-c("marley","seth","shelley","jeff","howard")
paste(family,"smells bad")

## read.csv, read.table, write.csv, write.table - Data Input and Output
  # - allows you to input data into R from another file 
  # (i.e., a comma separated excel spreadsheet or .csv)
  # make sure you set the correct working directory first or it won't work
setwd("Dropbox/Docs_Marley/Graduate_Courses/BIOL4750_BayesianStats/datasets/")
read.csv("genotypes.csv")
family<-c("marley","seth","shelley","jeff","howard")
write.csv(family,"family.csv")

## rnorm, pnorm, dnorm, qnorm - The Normal Distribution
  # - Density, distribution, quantile, and pseudo random generation for a normal distribution
test<-rnorm(50,5,1)
head(test)
#[1] 4.543691 5.187280 5.029950 4.514121 6.613280 3.467950
x=seq(1,20,by=0.5)
test2<-dnorm(x,mean=10,sd=1)
plot(test2)

## runif, rpois - Uniform Distribution and Poisson Distribution
  # - similar to rnorm, but for a uniform and poisson distribution, respectively
rpois(n=100,lambda=10)
runif(n=100,min=1,max=10)

## rank

## sort, rank, order

## outer

## rep

## rowSum, colSum

## seq

## source

## which, which.min, which.max

## setdiff, intersect, union

## table

## with (look at the examples because the technical explanation is way too smart for me)


################################################
## Bonus exercises #############################
################################################

bonus.text <- "It was the best of times, it was the worst of times, it was the age of
wisdom, it was the age of foolishness, it was the epoch of belief, it
was the epoch of incredulity, it it was the season of Light, it was the
season of Darkness, it was the spring of hope, it was the winter of
despair, we had everything before us, we had nothing before us, we
were all going direct to Heaven, we were all going direct the other
way- in short, the period was so far like the present period, that
some of its noiosiest authorities insisted on its being received, for
good or for evil, in the superlative degree of comparison only."
