## 1. Write a loop that prints out the numbers from 20 to 10
for (i in 20:10){
  print(i)
}

## 2. Write a loop that prints out only the numbers 20 to 10 that are even
for (i in 20:10){
  if (i %% 2 == 0){
    print(i)
    }
} 

## 3. Write a function that calculates whether a number is a prime number
prime<-function(x){
  for (i in (x-1):2){
    r<-x %% i 
  if(r == 0){
    return(FALSE)
    }
  }
  return(TRUE)
}

## 4. Write a loop that prints out the numbers from 1 to 20, printing
  # "Good: NUMBER" if the number is divisible by five and "Job: NUMBER"
  # if the number is prime, and nothing otherwise.
for (i in 1:20){
  f<-i %% 5
  if(f == 0){
    print("Good: NUMBER")
    print(i)
  }
  for (p in 2:(i-1)){
    g<- i %% p
    if(g == 0){
    } else{
      print("Job: NUMBER")
      print(i)
    }
  }
}

## 5. A biologist is modelling population growth using a Gompertz curve, which
  # is defined as y(t) = a.e^−b.e^−c.t where y is population size, t is time,
  # a and b are parameters, and e is the exponential function. Write them a 
  # function that calculates population size at any time for any values of its
  # parameters.
gompertz<-function(time, a, b, growth){
  y<-a*exp(-b*exp(-growth*time))
  return(y)
}

## 6. The biologist likes your function so they want you to write another
  # function that plots the progress of the population over a given length of
  # time. Write it for them.
plotgomp<-function()

## 7. The biologist has fallen in love with your plotting function, but wants
  # to color y values above a as blue and y values above b as red. Change your
  # function to allow that.

## 8. You are beginning to suspect the biologist is taking advantage of you.
  # Modify your function to plot in purple any y value that is above a and b.
  # Hint: Try putting 3==3 & 2==2 and 3==4 | 2==2 into an if statement and see
  # what you get. Using this construction may make this simpler.

## 9. Write a function that draws boxes of a specified height and look like this
  # (height 3, width 5):
  # *****
  # *   *
  # *****

## 10. Modify your box function to ut text centered inside the box, like this:
  # *****************
  # *               *
  # *   some text   *
  # *               *
  # *****************

## 11. Modify your box function to build boxes of arbitrary text, taking the
  # demensions specified in terms of demensions, not the text. For example,
  # box ("wdp", 3, 9, "hey") might produce:
  # wdpwdpwdp
  # w  hey  w
  # wdpwdpwdp

## 12. In ecology, hurdle models are often used to model the abundance of species
  # found on surveys. They first model the probability that a species will be
  # present (drawn, for example, from the Poisson distribution). Write a function
  # that simulates the abundance of a species at n sites given a probability of
  # presence (p) and that its abundance is drawn from a Poisson with a given 
  # (lambda). Hint: there is no ernoulli distribution in R, but the Bernoulli is
  # a special case of what distribution?...

## 13. An ecologist really likes your hurdle function (will you never learn?). 
  # Write them a function that simulates lots of species (each with their own p 
  # and lambda) across n sites. Return the results in a matrix where each species
  # is a column, and each site a row (this is the standard used for ecology data 
  # in R).

## 14. Professor Savitzky approaches you with a delicate problem. A member of faculty
  # became disoriented during fieldwork, and is now believed to be randomly
  # wandering somewhere in the desert surrounding Logan. He is modelling their 
  # progress through time in five minute intervals, assuming they cover a random,
  # Normally-distributed distance in latitude and longitude in each interval. Could
  # you simulate this process 100 times and plot it for him?

## 15. Professor Savitzky is deeply concerned to realise that the member of faculty
  # was, in fact, at the top of a steep mountain in the fog. Approximately 5 miles
  # away, in all directions, from the faculty member's starting point is a deadly
  # cliff! He asks if you could run your simulation to see how long, on average,
  # until the faculty member plummets to their doom.

## 16. Sadly, by the time you have completed your simulatiosn the faculty member
  # has perished. Professor Savitzky is keep to ensure this will never happen again,
  # and so has suggested each faculty member be attached, via rubber band, to a 
  # pole at the center of the site whenever conducting fieldwork. He assures you
  # that you can model this by assuing that the faculty member, at each time-step
  # moves alpha * distance-from-pole latitudinally and longitudinally (in 
  # additon to the rate of movement you've already simulated) each time-step.
  # Simulate this, and see how strong the rubber band (alpha) must be to keep
  # the faculty member safe for at least a day.

## 17. (If you finish early: Most, if not all, faculty members are not as young
  # as they once were. See what effect the faculty member tiring (and 
  # eventually sitting down and giving up) would have on their likelihood of
  # survival. What would happen if a faculty member panicked and walked faster
  # through time?)

## Bonus Exercises: Your loops will go a lot faster in R if you pre-allocate your output
  # variables....