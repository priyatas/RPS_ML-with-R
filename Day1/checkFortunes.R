install.packages("fortunes")
library(fortunes)
fortune("google")
fortune("wiki")
fortune(23)
fortunes::read.fortunes()

#creating vectors
seq(from=4.5,to=2.5,by=-0.5)
#specifying numbers reqd in the range length.out=difference/partitions
seq(from=-2.7,to=1.3,length.out=5)

#combining vectors
v1 <- c(5,6,7,8)
v2 <-1:30
v3 <- c(v1,v2)
v3

#replicate vectors
rep(c(0,0,7),times=3)
rep(c(0,7),times=c(4,2))
rep(1:3,length.out=7)

#indexing
numbers<-30:1
numbers
numbers[5]
numbers[1:10]
numbers[c(1,3,5)]
indices<-c(2,4,6)
numbers[indices]
numbers[-3]
numbers[-1]
numbers[-(1:20)]
numbers[1]<-91
numbers
numbers[c(1,3,5)]<-5
numbers
numbers > 10
which(numbers > 25)
data <- 25:27
result <- numbers < data
result

x <- c(3,6,1,NA,2)
x[x>2]

numbers<-10:1
numbers
data<-c(8,4)
numbers < data

data <- 1:10
cumsum(data)
cummax(data)
cummin(data)
diff(data)

result<-seq(from=1.5,to=0.5,length.out=10)
result
diff(result)

org<-c("CITI","corp")
length(org)
nchar(org)

tail(LETTERS,5)
head(letters,10)


month.name
month.days<- c(31,28,31,30,31,30,31,31,30,31,30,31)
names(month.days)<-month.name
month.days
names(month.days[month.days==31])


status<- c("Lo","Hi","Med","Med","Hi")
ordered.status<- factor(status,levels=c("Lo","Med","Hi"),ordered=TRUE)
ordered.status
table(status)
table(ordered.status)

color<- c("Red","Blue","Green","Blue","Yellow")
ordered.color <- factor(color,levels=c("Red","Blue","Green","Yellow"),ordered=TRUE)
table(ordered.color)

xd <- as.Date("2014-09-04")
xd
str(xd)
weekdays(xd)
xd+7
xd +0:6
weekdays(xd + 0:6)

startDate <-as.Date("2018-09-04")
xm<- seq(startDate,by="2 months",length.out=6)
xm
months(xm)
quarters(xm)

Sys.localeconv()
#Date Formatting
as.Date("5 Aug 2016",format= "%d %b %Y")

apollo <- "July 20,1969,20:17:39"
apollo.fmt <- "%B %d, %Y, %H:%M:%S"
xct <- as.POSIXct(apollo,format=apollo.fmt,tz="UTC")
xct

xct + 7*86400
as.Date(xct) - 7

Sys.time()



