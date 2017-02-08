# 1. replicate is an important function that allows you to quickly generate
  # random numbers. Use it to create a dataset of 10 variables, each drawn
  # from a Normal distribution with different means and variances. This can
  # be achieved on one line.
r <- replicate(10,rnorm(1,rnorm(1,runif(1,0,10),runif(1,1,3)))) 
          #10 replications drawn from a normal distribution with means ranging from 0 to 10 and sds ranging from 1 to 3

# 2. Make your own version of the summary function for continuous datasets 
  # (like the one you generated above). You don't have to slavishly replicated
  # summary.data.frame; write something you would find useful.
num.sum <- function(input){
  if(!inherits(input, "numeric")){
    stop("Input Must Be Numeric Class")
  }
  cat("Min:", "\n", round(min(input),digits=2),"\n","Max:","\n",round(max(input),digits=2), "\n",
    "Mean:", "\n", round(mean(input),digits=2), "\n", "Median:","\n",round(median(input),digits=2))
}

# 3. Write a summary function to summarise datasets containing only
  # categorical (...!is.numeric...) data.
char.sum <- function(input){
  if(!inherits(input,"character"))
    stop("Input Must Be Character Class")
  cat("Length:","\n",length(input),"\n","Class:","\n",class(input))
}

# 4. Finally, make a summary function capable of covering both kinds of data 
  # Hint: if your function doesn't call the functions above, youre likely doing it wrong.
gen.sum <- function(input){
  if(class(input)=="character"){
    char.sum(input)
  } else {
    num.sum(input)
  }
}

# 5. A molecular biologist you owe a favour approaches you with a problem. They
  # have a DNA sequence (e.g., 'ACGATATACGA') that they need to group into codons 
  # (groups of three) and translate into proteins (ignoring all complexities of translation
  # and transcription). Write them a function that will take an arbitrary input sequence
  # and an arbitrary codon lookup table, and output the translated sequence. Hint: 
  # expand.grid will help you make a demo lookup table.

codon.function <- function(input){
  codons <- expand.grid(first = c("A","T","C","G"), second = c("A","T","C","G"), third = c("A","T","C","G"))
  amino.acids <- c("lys", "STOP", "gin", "glu", "ile", "leu", "leu", "val", "thr", "ser", "pro", "ala", "arg",
                 "STOP", "arg", "gly", "asn", "tyr", "his", "asp", "ile", "phe", "leu", "val", "thr", "ser",
                 "pro", "ala", "ser", "cys", "arg", "gly", "asn", "tyr", "his", "asp", "ile", "phy", "leu",
                 "val", "thr", "ser", "pro", "ala", "ser", "cys", "arg", "gly", "lys", "STOP", "gin", "glu",
                 "met / START", "leu", "leu", "val", "thr", "ser", "pro", "ala", "arg", "trp", "arg", "gly")
  codons <- apply(codons, 1, paste, collapse="")
  names(amino.acids) <- codons
  return(amino.acids[input])
}

# 6. The molecular biologist now asks if you would write a function that will take
  # multiple sequences, translate them, and then flag where the sequences match-up (overlap).

# 7. One more thing: could you also write a summary-type function that would report 
  # percentage overlap across sequences?

# 8. The molecular biologist's advisor has shouted at them for ignoring the start-codons
  # and stop-codons. Modify your function from (5) to cut off all bits of the sequences
  # before (and including) the start codon, and then chop off everything after (and 
  # including) the stop codon. The advisor is certain you've re-used your code from (5)
  # for (6), so this will help with that function too, right?

# 9. Given recent events, Professor Savitzky has decided to keep more thorough tabs on
  # the people (graduate students, post-docs, and faculty members) and resourcs (lab
  # equipment, chemicals, and computers) in the Department of Biology. His friends in
  # other departments would like something similar. He asks you to make a list with two
  # slots for name, title and (optionally) advisor) and equip,ent (with slots for owner,
  # type, and kind). Make sure you write print and summary methods for deparments.

# 10. Professor Savitzky needs to present information about the department to the 
  # provost, and asks you to write a function that will calculate how many pieces 
  # of each type of equipment every member of faculty owns. Write a separate function 
  # that calculates the people who work for each member of faculty (remember that
  # people are not equipment).

# 11. The provost is very happy at how the Biology Department has grown, but is
  # concerned that too many members of facult have too many students and pieces of 
  # equipment. Write wrapper functions that let you add new staff and equipment to 
  # the department, assigning them to faculty members. Write the function such that 
  # if a member of faculty asks to have more than five pieces of equipment or four
  # employees, the function won't let them.

# 12. Don't tell the provost, but modify your function such that it gives the option
  # of promoting a post-doc to a member of faculty or throwing away a piece of 
  # equipment gives a faculty member more "space". Warning: this last exercise is
  # harder than it seems, and will require you to learn to handle use input (readlines).
