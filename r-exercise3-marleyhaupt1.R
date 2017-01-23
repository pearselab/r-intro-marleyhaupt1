# 1. Implement a cat class, complete with race and print methods
mittens<-list(weight=10, speed="10", color="calico")
class(mittens)<-"cat"

new.cat<-function(weight, speed, color){
  output<-list(weight=weight,speed=speed, color=color)
  class(output)<-"cat"
  return(output)
}

race<-function(one,two) {
  if(!inherits(one,"cat") | !inherits(two,"cat"))
    stop("Hey! Give me a Cat Class you Dummy")
  if(one$speed > two$speed){
    print("Cat one Wins!")
    return(one)
  } else{
  print("Cat two Wins!")
  return(two)
}

print.cat<-function(x, ...){
  cat("This cat weighs", x$weight, "lbs.", ", is", x$color, ", and has a speed of", x$speed, "mph.")
}

ask.cat<-function(x, ...)
  UseMethod("ask.cat")
ask.cat.default<-function(x, ...)
  return("Dunno what this is")
ask.cat.character<-function(x, ...)
  return("Character String")
ask.cat.numeric <- function(x, ...)
  return("Number")
ask.cat.cat <- function(x, ...)
  return("CAT!!")

# 2. Implement a point class that holds x and y information for a point in space.
new.point<-function(x,y){
  output<-list(x=x,y=y)
  class(output)<-"point"
  return(output)
}

print.point<-function(x,...){
  point<-list(x=x$x, y=x$y)
  print(point)
}

# 3. Write a distance method that calculates the distance between two points in space.
distance<-function(point1, point2){ 
  if(!inherits(point1,"point") | !inherits(point2,"point"))
     stop("Not a Point Class") 
  output<-sqrt((point1$x - point2$x)^2 + (point1$y - point2$y)^2)     # Distance Formula
  return(output)
}

# 4. Implement a line class that takes two point objects and makes a line between them.
new.line<-function(point1, point2){
  if(!inherits(point1,"point") | !inherits(point2,"point")){
    stop("Input Must Be a Point Class")
  }
  output<-list(x1 = point1$x, y1 = point1$y, x2 = point2$x, y2 = point2$y)
  class(output)<-"line"
  return(output)
} 

# 5. Implement a polygon class that stores a polygon from point objects. Hint: a polygon is really just a load of lines.
new.polygon<-function(TotalPoints, point1, point2, point3, point4){
  if(!inherits(point1, "point") | !inherits(point2, "point") | !inherits(point3, "point") | !inherits(point4, "point")){
    stop("Input Must Be a Point Class")
  }
  for(i in 1:4){
    x[i] <- point[i]$x
    y[i] <- point[i]$y
    output<-list(x=x[i],y=y[i])
    return(output)
  }
}
  class(output)<-"polygon"
  return(output)
} 

# 6. Write plot methods for point and line objects.
plot.point<-function(point){
  if(!inherits(point, "point")){
    stop("Not a Point Class")
  }
  return(plot(x=point$x, y=point$y, xlab="X Axis", ylab="Y Axis", main="Your Mom Goes to College", col="red"))
}

plot.line<-function(line){
  if(!inherits(line, "line")){
    stop("Not a Line Class")
  }
  return(plot(x = list(line$x1,line$x2),y= list(line$y1,line$y2), xlab="X Axis", ylab="Y Axis", main="Your Mom Goes to College", type='l', col="red"))
}

# 7. Write a plot method for a polygon. Hint: if this isn't trivial, your doing something wrong.
plot.polygon<-function(polygon){
  if(!inherits(polygon, "polygon")){
    stop("Not a Polygon Class")
  }
  return(plot(x=list(polygon$x1, polygon$x2, polygon$x3, polygon$x4), y=list(polygon$y1, polygon$y2, polygon$y3, polygon$y4),
              xlab="X Axis", ylab="Y Axis", main="Your Mom Goes to College", type='l', col="red"))
}

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