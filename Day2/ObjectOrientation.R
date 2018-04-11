#creating S3 class
s <- list(name="Jaya",age=21,GPA=3.5)
#name the class
class(s) <- "student"
#We now have an object of student class
s$name


#using constructor class

student <- function(n,a,g){
  if(g>4 || g<0) stop("GPA must be between 0 and 4")
  value <- list(name=n,age=a,GPA=g)
  attr(value,"class") <- "student"
  value
}

print.student <- function(obj){
  cat(obj$name,"\t")
  cat(obj$age,"years old \t")
  cat("GPA:", obj$GPA, "\n")
}
obj<-student("Pragnya",26,3.7)
obj

##Creating s4 class
setClass("student",slots=list(name="character",age="numeric",GPA="numeric"))
#create object
obj <- new("student",name="Jayanth",age=21,GPA=3.5)
setMethod("show",
          "student",
          function(object){
            cat(object@name, "\t")
            cat(object@age,"years old \t")
            cat("GPA:", obj@GPA, "\n")
          }
)

obj
isS4(obj)

setClass("InternationalStudent",
         slots=list(country="character"),
         contains="student")

s <- new("InternationalStudent",name="John",age=21,GPA=3.5,country="France")
show(s)


#setReference class

Person <- setRefClass("Person",fields=list(name="character",age="numeric",GPA="numeric"),methods=list(
  inc_age=function(x){
    age <<- age+x
  },
  dec_age=function(x){
    age <<- age-x
  }
))

obj <- Person(name="John",age=21,GPA=3.5)
obj
obj$inc_age(5)
obj
obj$age
