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


##### expand.grid - Create a Data Frame from all combinations of factor variables
  # - Takes a vector or factor and turns it into a dataframe! Yay!
x<-seq(0,100,by=10)
y<-seq(-10,10,by=1)
expand.grid(x,y)
head(expand.grid(x,y))

##### eigen - Spectral Decomposition of a Matrix
  # - Computes eigenvalues and eigenvectors of numeric or complex matrices
v<-cbind(c(1,-1),c(-1,1))
eigen(v)

##### %*% - Matrix Multiplication
  # - Multiplies two matrices if they are conformable. Vectors become either rows or columns
x<-matrix(1,2,2)
y<-matrix(1:4,2,2)
x %*% y

##### lower.tri, upper.tri - Lower and Upper Triangular Part of Matrix
  # - Turns the values of a matrix to TRUEs or FALSEs with the TRUEs in either the "lower" or "upper" triangle
m2<-matrix(1:20,4,5)
lower.tri(m2)
upper.tri(m2)

##### diag - Matrix Diagonals
  # - Used for 4 things: (1) if x is a matrix it extracts the diagonal (2) if x is missing and nrow is specified 
  # - it returns an identify matrix (3) if x is a scalar and the only argument, it returns a square identity matrix
  # - given by the scalar (4) if x is a numeric vector with a length >2 or with further arguements, it returns
  # - a matrix with the given diagonal and zero off-diagonal entries
x<-matrix(1:20,4,5)
diag(x)
diag(NA,nrow=2)
diag(3)
y<-c(1,2,3,4)
diag(y)

##### gl - Generate Factor Levels
  # - Generates factors by specifying the pattern of their levels
gl(5,4,20)  ## - Generates the numbers 1:5 in sets of 4 (i.e., 1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5) w/Levels 1:5
gl(2,1,10,labels=c("Marley", "Haupt")) ## [1] Marley Haupt Marley Haupt Marley Haupt (10 times) w/ Levels Marley and Haupt

##### identical - Test Objects for Exact Equality
  # - A good way to check if two objects are exactly equal. If so, then TRUE if not then FALSE. 
  # - Even checks the type (i.e. double vs. integer)
x<-matrix(1:20,4,5)
y<-c(1,2,3,4)
identical(x,y) #[1] FALSE
y<-matrix(1:20,4,5)
identical(x,y) #[1] TRUE

##### image - Display a Color Image
  # - Can be used to visualize 3D spatial data (aka images). Creates a grid of colored or gray-scale rectangles c
  # - corresponding to values of z
image(t(volcano)[ncol(volcano):1,]) # I tried to think of an example that I could make up myself 
x<-y<-seq(-4*pi, 4*pi, len=27)      # but I wasn't sure where to start
r<-sqrt(outer(x^2,y^2,"+"))
image(z=z<-cos(r^2)*exp(-r/6),col=gray((0:32)/32))

##### library - Loading/Attaching and Listing of Packages
  # - The command that loads a package so you can use certain commands that are otherwise unavailable
library(rjags)            # Once rjags is loaded I can create JAGS models in R and run MCMC. 
library(lib.loc=.Library) # Lists all of the packages available

##### jitter - Add Noise ('Jitter') to Numbers
  # - Add a small amount of noise to a numeric vector
  # - jitter(x,...) returns a numeric of the same length as x, but with an amount of noise added in order to break ties
x<-seq(1,10,1)
# [1] 1 2 3 4 5 6 7 8 9 10
jitter(x)
# [1] 1.095372 2.032013 3.081988 3.973232 5.166270 5.803110 7.132575 7.885574 9.139420 9.956630

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

##### mean, median, max, min - Arithmetic Mean, Median Value, Maxima and Minima
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

##### paste - Concatenate Strings
  # - allows you to concatenate vectors after converting to character
family<-c("marley","seth","shelley","jeff","howard")
paste(family,"smells bad")

##### read.csv, read.table, write.csv, write.table - Data Input and Output
  # - allows you to input data into R from another file 
  # (i.e., a comma separated excel spreadsheet or .csv)
  # make sure you set the correct working directory first or it won't work
setwd("Dropbox/Docs_Marley/Graduate_Courses/BIOL4750_BayesianStats/datasets/")
read.csv("genotypes.csv")
family<-c("marley","seth","shelley","jeff","howard")
write.csv(family,"family.csv")

##### rnorm, pnorm, dnorm, qnorm - The Normal Distribution
  # - Density, distribution, quantile, and pseudo random generation for a normal distribution
test<-rnorm(50,5,1)
head(test)
#[1] 4.543691 5.187280 5.029950 4.514121 6.613280 3.467950
x=seq(1,20,by=0.5)
test2<-dnorm(x,mean=10,sd=1)
plot(test2)

##### runif, rpois - Uniform Distribution and Poisson Distribution
  # - similar to rnorm, but for a uniform and poisson distribution, respectively
rpois(n=100,lambda=10)
runif(n=100,min=1,max=10)

##### rank - Sample Ranks
  # - Ranks the values inside of a vector (from smalles to largest)
x<-c(3,1,4,15,92)
rank(x)
# [1] 2 1 3 4 5

##### sort, order - Sorting or Ordering Vectors
  # - sort (or order) a vector or factor into ascending or descending order
x<-c(1,7,5,6,2,3,9,10,8,4)
sort(x)
# [1]  1  2  3  4  5  6  7  8  9 10

##### outer - Outer Product of Arrays
  # - the outer product of two arrays X and Y is the array A with dimension c(dim(X),dim(Y))
x<-1:9
y<-2:8
outer(x,y)

##### rep - Replicate Elements of Vectors and Lists
  # - replicates the values in x, rep.int and rep_len are faster simplified versions
x<-1:9
rep(x)
rep.int(x,2)
rep_len(x,2)

##### rowSums, colSums - Form Row and Columns Sums and Means
  # - Form row and column sums and means for numeric arrays (or data frames)
x<-matrix(1:20,4,5)
colSums(x)
rowSums(x)

##### seq - Sequence
  # - creates a sequence vector
x<-seq(1,20,by=2)

##### source - Read R Code from a File or a Connection
  # - allows R to accept input from a named file or URL connection. Input is read and parsed
  # - that file until the end of the file is reached, then the parsed expressions are eval-
  # - uated sequentially in the chosen environment
setwd("/Users/marleyjadehaupt/Dropbox/Docs_Marley/Graduate_Courses/BIOL4750_BayesianStats/RScripts/")
source("normalGibbs.r")

##### which, which.min, which.max - Which indices are TRUE? Where is the Min() or Max() or first
  ##### - TRUE or FALSE
  # - Give the TRUE indices of a logical object, allowing for array indices
  # - Determines the location, i.e., index of the (first) min or max of a numeric (or logical vector)
which(LETTERS == "A")
x<-c(3,7,8,1,2,10,9)
which.min(x)

##### setdiff, intersect, union - Set Operations
  # - shows the different values, shows the same values, combines the two together
x<-c(1,2,3,4)
y<-c(4,5,6,7)
union(x,y)
intersect(x,y)
setdiff(x,y)
setdiff(y,x)

##### table - Cross Tabulation and Table Creation
  # - uses the cross-classifying factors to build a contingency table of the counts at each 
  # - combination of factor levels
a<-rep(c(NA,1/0:3),10)
table(a)

##### with - Evaluate an Expression in a Data Environment
  # - Evaluate an R expression in an environment constructed from data, possibly modifying
  # - (a copy of) the original data
library(MASS)
with(anorexia, {
  anorex.1<-glm(Postwt ~ Prewt + Treat +  offset(Prewt),
                family = gaussian)
  summary(anorex.1)
})

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

## A Tale of Two Cities! (I didn't even have to google this)
