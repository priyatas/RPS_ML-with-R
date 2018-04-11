names<- c("Priyata","sahai")
result<-paste(names,collapse=' ')
result
cat(names)


msg<-"Welcome to R training"
name<-readline("Enter your name")
result<-paste("Hi",name,msg)
cat(result)

#print all env variables
ls()
getwd()

#vector concatenation
firstNames <- c("HCL","Citi","TCS")
lastNames <- c("Technologies","Corp","Consulting")
result<- paste(firstNames,lastNames)
result

#mathematical function
data<-c(45,67,89,90)
sum(data)
mean(data)

#print arguments
print(pi,digits=2)
pi
letters
LETTERS
print(LETTERS,quote=FALSE)

str(firstNames)
data<-seq(20:40)
str(data)
data<-c(22,33,22)
str(data)
data<-c(22L,33L,22L)
str(data)
is.double(data)

