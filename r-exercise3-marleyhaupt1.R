# 1. Implement a cat class, complete with race and print methods
mittens<-list(weight=10, speed="10")
class(mittens)<-"cat"

new.cat<-function(weight, speed){
  output<-list(weight=weight,speed=speed)
  class(output)<-"cat"
  return(output)
}

race<-function(one,two){
  if(!inherits(one,"cat") | !inherits(two,"cat"))
    stop("Hey! Give me a Cat Class you Dummy")
  if(one$speed > two$speed){
    print("Cat one Wins!")
    return(one)
  }
  print("Cat two Wins!")
  return(two)
}

print.cat<-function(x, ...){
  cat("This cat weighs", x$weight, "lbs", ",is", x$color, ",and has a speed of", x$speed, "mph.")
}

ask.cat<-function(x, ...)
  UseMethod("ask.cat")
ask.cat.default<-function(x, ...)
  return("Default")
ask.cat.numeric <- function(x, ...)
  return("Number")
ask.cat.cat <- function(x, ...)
  return("CAT!!")

# 2. Implement a point class that holds x and y information for a point in space.
pointclass<-function(x,y){
  output<-list(x=x,y=y)
  class(output)<-"point"
  return(output)
}

# 3. Write a distance method that calculates the distance between two points in space.
distance<-function(point1, point2){ 
  if(!inherits(point1,"point") | !inherits(point2,"point"))
     stop("Not a Point Class") 
  output<-sqrt((point1$x - point2$x)^2 + (point1$y - point2$y)^2)
  return(output)
}

# 4. Implement a line class that takes two point objects and makes a line between them.
lineclass<-function(point1, point2){
  if(!inherits(point1,"point") | !inherits(point2,"point"))
    stop("Not a Point Class")
  plot(x = list(point1$x,point2$x),y= list(point1$y,point2$y), type='l')
}

# 5. Implement a polygon class that stores a polygon from point objects. Hint: a polygon
  # is really just a load of lines.

# 6. Write plot methods for point and line objects.

# 7. Write a plot method for a polygon. Hint: if this isn't trivial, your doing something
  # wrong.

# 8. Create a canvas object that the add function can add point, line, circle, and polygon 
  # objects too. Write plot and print methods for this class.

# 9. Implement a circle object that takes a point and radius and stores a circle. Don't 
  # make a circle out of lines!

# 10. Write area generic methods for circle and polygon objects.

# 11. Add support for circle objects to your canvas.

# 12. Add a summary method for canvas that calculates the height and width of the canvas, 
  # the fraction of the canvas covered in filled-in-polygons and circles (if appropriate),
  # and average distance between any points on the canvas (if appropriate).

# 13. Add option color support for your objects.