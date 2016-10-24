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

## 4. 