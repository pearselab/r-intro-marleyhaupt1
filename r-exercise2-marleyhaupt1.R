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
    return(FALSE)      # If there is ever a mod with a remainder of 0 then the number is not prime and function will return FALSE and stop
    }
  }
  return(TRUE)         # If the mod never turns up as 0 then the number is prime and the function will return TRUE
}

## 4. Write a loop that prints out the numbers from 1 to 20, printing
  # "Good: NUMBER" if the number is divisible by five and "Job: NUMBER"
  # if the number is prime, and nothing otherwise.

for (i in 1:20){
  f<-i %% 5                    # Checking if all of the numbers are divisable by 5
  if(f == 0){
    print("Good: NUMBER")
    print(i)
  }
  t<-TRUE                      # Creating a number to test for prime (true=prime)
  for(j in 2:(i-1)){
    p<-i %% j
    if(p == 0){                # This is basically the same as what I did in question 3
      t<-FALSE
      break
    }
  }
  if(t == TRUE || i == 1){
    print("Job: NUMBER")
    print(i)
  }
} 

## 5. A biologist is modeling population growth using a Gompertz curve, which
  # is defined as y(t) = a.e^−b.e^−c.t where y is population size, t is time,
  # a and b are parameters, and e is the exponential function. Write them a 
  # function that calculates population size at any time for any values of its
  # parameters.
gompertz<-function(time, a, b, c){
 y<-a*exp(-b*exp(-c*time))
 return(y)
}

## 6. The biologist likes your function so they want you to write another
  # function that plots the progress of the population over a given length of
  # time. Write it for them.
plotgomp<-function(start,end,by,a,b,c){     
  time<-seq(start,end,by)                  # Creates a vector with sequenctial values of time between a specified start and end by any increment
  popsize<-c(NA)                           # Creates a vector with the same length as the vector of time
  for(i in 1:length(time)){
   y<-gompertz(start+(i-1)*by,a,b,c)
   popsize[i]<-y                           # Populates the vector "popsize" with the values calcuated in the gompertz equation
  }
  plot(x=time, y=popsize, xlab="Time", 
       ylab="Population Size", main="Gompertz Plot")
  abline(h=a, lty=2, col="blue")          # Adds a blue horizontal line that intersects the y axis at the value of the parameter a
  abline(h=b, lty=2, col="red")           # Adds a red horizontal line that intersects the y axis at the value of the parameter b
}  

## 7. The biologist has fallen in love with your plotting function, but wants
  # to color y values above a as blue and y values above b as red. Change your
  # function to allow that.
plotgomp<-function(start,end,by,a,b,c){     
  time<-seq(start,end,by)
  popsize<-c(NA) 
  color<-c(NA)
  for(i in 1:length(time)){
    y<-gompertz(start+(i-1)*by,a,b,c)
    popsize[i]<-y
    if(y>=a){
      color[i]<-"blue"
      } else {
        color[i]<-"black"
      }
    if (y>=b){
      color[i]<-"red"
    } else {
        color[i]<-"black"
    }
  }
  plot(x=time, y=popsize, xlab="Time", ylab= "Population Size", main= "Gompertz Plot", col=color)
  abline(h=a, col="blue", lty=2)
  abline(h=b, col="red", lty=2)
}

## 8. You are beginning to suspect the biologist is taking advantage of you.
  # Modify your function to plot in purple any y value that is above a and b.
  # Hint: Try putting 3==3 & 2==2 and 3==4 | 2==2 into an if statement and see
  # what you get. Using this construction may make this simpler.
plotgomp<-function(start,end,by,a,b,c){     
  time<-seq(start,end,by)
  popsize<-c(NA) 
  color<-c(NA)
  for(i in 1:length(time)){
    y<-gompertz(start+(i-1)*by,a,b,c)
    popsize[i]<-y
    if(y>=a){
      color[i]<-"blue"
      } else {
        color[i]<-"black"
      }
    if (y>=b){
      color[i]<-"red"
    } else {
        color[i]<-"black"
    }
    if (y>= a && b){
    	color[i]<-"purple"
    }
  }
  plot(x=time, y=popsize, xlab="Time", ylab= "Population Size", main= "Gompertz Plot", col=color)
  abline(h=a, col="blue", lty=2)
  abline(h=b, col="red", lty=2)
}

## 9. Write a function that draws boxes of a specified height and look like this
  # (height 3, width 5):
  # *****
  # *   *
  # *****
box<-function(height,width){
  for (h in 1:height){
    w<-1                                          # Create Index for my While Loop
    while(w<=width){
      if(h==1 || h==height || w==1 || w==width){  # Only put * on the border ( || means or)
      cat("*")
      } else{                                     # If not on the border put a blank space inside the box ("" is not the same as " ")
        cat(" ")
      }
      w<-w+1                                      # Prevents an infinite loop, and a sad sad day for R
    } 
    cat("\n")                                     # For every new iteration of my for loop, create a new line
  }
}

## 10. Modify your box function to put text centered inside the box, like this:
  # *****************
  # *               *
  # *   some text   *
  # *               *
  # *****************
box.text<-function(height,width,words){ 
  width<-max(width,nchar(words)+2)                          # Makes the box fit the words incase the words don't fit the box (nchar counts the number of characters in the text)
  height<-max(height,3)									    # Makes the height of the box equal to the larger of either the height or 3 (3 so that the word will fit in the box)
  for (h in 1:height){ 
    w<-1
    while(w<=width){
      if(h==1 || h==height || w==1 || w==width){
        cat("*")                                          
      } else{											                          # Add words to the center of the box. Ceiling rounds up, floor rounds down
        if(h==ceiling(height/2)                             # Puts the words in the middle of the box vertically
          && w==ceiling(width/2)-ceiling(nchar(words)/2)){  # Puts the words in the middle of the box horizontally and makes it center instead of left align
          cat(words)                                        # Prints the words from the function
          w<-w+nchar(words)-1                               # Gets rid of blank spaces so the box is actually a box and not something funky
          } else {
            cat(" ")
        } 
      } 
      w<-w+1
    } 
    cat("\n")
  }
}

## 11. Modify your box function to build boxes of arbitrary text, taking the
  # demensions specified in terms of demensions, not the text. For example,
  # box ("wdp", 3, 9, "hey") might produce:
  # wdpwdpwdp
  # w  hey  w
  # wdpwdpwdp

box.text.b<-function(border,height,width,words){ 
  width<-max(width,nchar(words)+2)
  height<-max(height,3)
  for (h in 1:height){ 
    w<-1
    while(w<=width){
      if(h==1 || h==height || w==1 || w==width){
        if(h==1 || h==height){                             # If the top or bottom of the box then use the text from the border parameter in the function
          b<-((w-1)%%nchar(border))+1                      # Makes b=1 when w=0 and then loops through the rest of the letters in the border parameter
        } else{
          b<-1                                             # If in the center rows, always start with the first letter of the border parameter
        }
        cat(substr(border,b,b))                            # substr is a function that recognizes each letter in a word, cat then prints that letter based on the index "b" which we defined previously
      } else {
        if(h==ceiling(height/2)
           && w==ceiling(width/2)-floor(nchar(words)/2)){
          cat(words)
          w<-w+nchar(words)-1
        } else {
          cat(" ")
        } 
      } 
      w<-w+1
    } 
    cat("\n")
  }
}

## 12. In ecology, hurdle models are often used to model the abundance of species
  # found on surveys. They first model the probability that a species will be
  # present (drawn, for example, from the Poisson distribution). Write a function
  # that simulates the abundance of a species at n sites given a probability of
  # presence (p) and that its abundance is drawn from a Poisson with a given 
  # (lambda). Hint: there is no bernoulli distribution in R, but the Bernoulli is
  # a special case of what distribution?...

#A bernoulli distribution is a special case of a binomial distribution
hurdle.model<-function(n, lambda){
  alist<-list()
  for(i in 1:n){
    q<-qpois(p, lambda = lambda)
    alist<-append(alist,q)
  }
  return(alist)
} 

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

lost_prof<-function(speed.mph){
  xlist<-list()                     #Creates an empty list for the x values
  ylist<-list()                     #Creates an empty list for the y values
  start.x<-0
  start.y<-0
  s<-speed.mph*5280/12              #Takes a speed and converts it to the # of ft traveled in 5min
  for (i in 1:100){
    dist<-rnorm(1,s)                #Randomly simulates the number of ft traveled every 5min
    dir<-round(runif(1,1,4))        #Randomly determines a direction traveled
    if(dir==1){
      start.x<-start.x+dist
    }  
    if(dir==2){
      start.x<-start.x-dist
    }  
    if(dir==3){
      start.y<-start.y+dist
    }  
    if(dir==4){
      start.y<-start.x-dist
    } 
    xlist<-append(xlist, start.x)
    ylist<-append(ylist, start.y)
  }
  plot(x=xlist, y=ylist, col="red", type="l", main="Don't Die Professor")
}

## 15. Professor Savitzky is deeply concerned to realise that the member of faculty
  # was, in fact, at the top of a steep mountain in the fog. Approximately 5 miles
  # away, in all directions, from the faculty member's starting point is a deadly
  # cliff! He asks if you could run your simulation to see how long, on average,
  # until the faculty member plummets to their doom.
dead_prof<-function(speed.mph){ 
  start.x<-0
  start.y<-0
  time<-0
  ft<-speed.mph*5280/12              
  while (start.x <= 26400 || start.x >= -26400 || 
         start.y <= 26400 || start.y >= -26400){ 
    dist<-rnorm(1,ft)                
    dir<-round(runif(1,1,4))        
    if(dir==1){
      start.x<-start.x+dist
      if(start.x >= 26400){
        return(time*5)
      }
    }
    if(dir==2){ 
      start.x<-start.x-dist
      if(start.x <= -26400){
        return(time*5)
      }
    }
    if(dir==3){
      start.y<-start.y+dist
      if(start.y >= 26400){
        return(time*5)
      }
    }
    if(dir==4){
      start.y<-start.x-dist
      if(start.y <= -26400){
        return(time*5)
      }
    }
    time<-time+1
  }
}

## 16. Sadly, by the time you have completed your simulation the faculty member
  # has perished. Professor Savitzky is keen to ensure this will never happen again,
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