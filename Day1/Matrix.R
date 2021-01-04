first.matrix <- matrix(1:12,ncol=4)
first.matrix #xxx

matrix(1:12,ncol=4,byrow=TRUE)
str(first.matrix)
dim(first.matrix)
length(first.matrix)

v1 <-c(4,5,8,9)
v2<-c(34,56,78,90)
m1 <- rbind(v1,v2)
m1

cbind(1:3,4:6,matrix(7:12,ncol=2))

#extraction
first.matrix[1:2,2:3]

#scalar

first.matrix + 4
second.matrix <- matrix(1:3,nrow=3,ncol=4)
second.matrix
first.matrix
first.matrix + 1:3
rowSums(first.matrix)

#transposing

t(first.matrix)

#multiplying

first.matrix %*% t(second.matrix)

##Data Frames

x<- data.frame(item=1:4,status=c(T,T,F,F))
x
##read csv
data <- read.csv("D:/RProgramming/Day1/data-marketing-budget-12mo.csv")
print(data)
print(is.data.frame(data))
print(ncol(data))
print(nrow(data))
#Get the max sal from data frame

spend <- max(data$Spend)
print(spend)

retval <- subset(data,Month==2)
print(retval)

info <-subset(data,Spend > 4000 & Month==3)
print(info)

install.packages("rjson")
library(rjson)

result <- fromJSON(file="D:/RProgramming/Day1/input.json")
print(result)

print(result$Salary > 800)

x <- runif(10,0,10)
x

if(x > 3){
  y <- x
} else {
  y <- 0
}
y

priceCalculator <- function(hours,pph=40,public=TRUE){
  net.price <- hours*pph
  if(hours > 100) net.price <- net.price *0.9
  if(public){
    tot.price <- net.price*1.06
  } else {
    tot.price <- net.price *1.12
  }
  round(tot.price)
}
priceCalculator(25,public=TRUE)


x=2
while(x < 1000)
{
  x=x^2
  print(x)
}

countdown <- function(from)
{
  print(from)
  while(from!=0)
  {
    Sys.sleep(1)
    from <- from -1
    print(from)
  }
}

countdown(5)

x <- matrix(1:6,2,3)
x
for(i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x)))
  {
    print(x[i,j])
  }
}

x <- "item"
y <- data.frame(id=1L,name="laptop")
dump(c("x","y"),file="data.R")
rm("x","y")
source("data.R")
str(y)
getwd()
