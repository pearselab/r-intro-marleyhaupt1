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
new.pg<-function(x){
  for (i in 1:length(x)){
    if(!inherits(x[[i]], "point")){
      stop("Input Must Be Point Class")
    }
  }
  output<-x
  class(output)<-"polygon"
  return(output)
}

# 6. Write plot methods for point and line objects.
plot.pt<-function(pt){
  if(!inherits(pt, "point")){
    stop("Input Must Be Point Class")
  }
  plot(x=pt$x, y=pt$y, xlab="X Axis", ylab="Y Axis", type="l",
       main="Your Mom Goes to College", col="red", xlim=c(-5, 5), ylim=c(-5,5))
}

plot.ln<-function(ln){
  if(!inherits(ln, "line")){
    stop("Input Must Be Line Class")
  }
  x1<-ln[[1]]$x
  x2<-ln[[2]]$x
  y1<-ln[[1]]$y
  y2<-ln[[2]]$y
  plot(x=list(x1, x2), y=list(y1, y2), type="l", col="red", main="Plot", xlab="X", 
       ylab="Y", xlim=c(-5,5), ylim=c(-5,5))
  par(new = TRUE)
}                                                                               

# 7. Write a plot method for a polygon. Hint: if this isn't trivial, your doing something wrong.
plot.pg<-function(pg){
  if(!inherits(pg, "polygon")){
    stop("Input Must Be Polygon Class")
  }
  for (i in 1:length(pg)){ 
    v<-i+1
    if(i==length(pg)){
      v<-1
    }
    plot.ln(new.ln(pg[[i]],pg[[v]])) 
  }
}


# 8. Create a canvas object that the add function can add point, line, circle, and polygon objects too. Write plot and print methods for this class.

# 9. Implement a circle object that takes a point and radius and stores a circle. Don't make a circle out of lines!

# 10. Write area generic methods for circle and polygon objects.

# 11. Add support for circle objects to your canvas.

# 12. Add a summary method for canvas that calculates the height and width of the canvas, 
  # the fraction of the canvas covered in filled-in-polygons and circles (if appropriate),
  # and average distance between any points on the canvas (if appropriate).

# 13. Add option color support for your objects.