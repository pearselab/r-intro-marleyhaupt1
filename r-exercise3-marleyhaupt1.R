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
new.pt<-function(x,y){
  output<-list(x=x,y=y)
  class(output)<-"point"
  return(output)
}

# 3. Write a distance method that calculates the distance between two points in space.
dist.pt<-function(pt1, pt2){ 
  if(!inherits(pt1,"point") | !inherits(pt2,"point"))
     stop("Not a Point Class") 
  output<-sqrt((pt1$x - pt2$x)^2 + (pt1$y - pt2$y)^2)     # Distance Formula
  return(output)
}

# 4. Implement a line class that takes two point objects and makes a line between them.
new.ln<-function(pt1, pt2){
  if(!inherits(pt1,"point") | !inherits(pt2,"point")){
    stop("Input Must Be Point Class")
  }
  output<-list(pt1, pt2)
  class(output)<-"line"
  return(output)
} 

# 5. Implement a polygon class that stores a polygon from point objects. Hint: a polygon is really just a load of lines.
new.plygn<-function(ln1, ln2, ln3, ln4){
  if(!inherits(ln1, "line") | !inherits(ln2, "line") | !inherits(ln3, "line") | !inherits(ln4, "line")){
    stop("Input Must Be Line Class")
  }
  output<-list(ln1, ln2, ln3, ln4)
  class(output)<-"polygon"
  return(output)
}

# 6. Write plot methods for point and line objects.
plot.pt<-function(pt){
  if(!inherits(pt, "point")){
    stop("Input Must Be Point Class")
  }
  return(plot(x=pt$x, y=pt$y, xlab="X Axis", ylab="Y Axis", main="Your Mom Goes to College", col="red"))
}



# 7. Write a plot method for a polygon. Hint: if this isn't trivial, your doing something wrong.
plot.polygon<-function(polygon){
  if(!inherits(polygon, "polygon")){
    stop("Not a Polygon Class")
  }
  return(plot(x=list(polygon$x1, polygon$x2, polygon$x3, polygon$x4), y=list(polygon$y1, polygon$y2, polygon$y3, polygon$y4),
              xlab="X Axis", ylab="Y Axis", main="Your Mom Goes to College", type='l', col="red"))
}

# 8. Create a canvas object that the add function can add point, line, circle, and polygon objects too. Write plot and print methods for this class.

# 9. Implement a circle object that takes a point and radius and stores a circle. Don't make a circle out of lines!

# 10. Write area generic methods for circle and polygon objects.

# 11. Add support for circle objects to your canvas.

# 12. Add a summary method for canvas that calculates the height and width of the canvas, 
  # the fraction of the canvas covered in filled-in-polygons and circles (if appropriate),
  # and average distance between any points on the canvas (if appropriate).

# 13. Add option color support for your objects.