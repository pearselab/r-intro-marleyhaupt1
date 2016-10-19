################################################
## Exercises ###################################
################################################

# c - concatenate
#     - takes two (or more) vector and joins them together
c(1, 2, 3)
c(c(1,2,3), c(4,5,6))
#     - they need to be of the same type, though!
c(1,2, "three")

## cat - concatenate and print
  # - converts arguments to character vectors and concatenates them to a single character vector

## cbind - combine R objects by rows or columns
  # - takes a seq of vector, matrix, or df arguments and combines them by col or rows

## col, row - column and row indexes
  # - returns a matrix of integers indicating their row/column in a matrrix like object

## cut - convert numberic to factor
  # - divides the range of "x" into intervals and codes

## diff

## dim

## rownames, colnames, names

## expand.grid

##eigen,%*%, lower.tri, upper.tri, diag(try?"%*%", not?%*%, as this is an operator, and document the function, not the maths)

## gl

## identical

## image

## library

## jitter

## ls; what does rm(list=ls(()) do?

## mean, median, max, min

## paste

## read.csv, reat.table, write.csv, write.table

## rnorm, pnorm, dnorm, qnorm

## runif, rpois

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
