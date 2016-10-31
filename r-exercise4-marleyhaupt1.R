# 1. replicate is an important function that allows you to quickly generate
  # random numbers. Use it to create a dataset of 10 variables, each drawn
  # from a Normal distribution with different means and variances. This can
  # be achieved on one line.
replicate(10,rnorm(1,.Random.seed[1],.Random.seed[1]))

# 2. Make your own version of the summary function for continuous datasets 
  # (like the one you generated above). You don't have to slavishly replicated
  # summary.data.frame; write something you would find useful.

# 3. Write a summary function to summarise datasets containing only
  # categorical (...!is.numeric...) data.