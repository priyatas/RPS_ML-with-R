x <- c(1:4,NA,6:7,NA)
x

is.na(x)
df <- data.frame(col1 = c(1:3,NA),
                 col2 = c("this",NA,"is","text"),
                 col3 = c(TRUE,FALSE,TRUE,TRUE),
                 col4 = c(2.5,4.2,3.2,NA),
                 stringsAsFactors = FALSE)
df

is.na(df)
is.na(df$col4)

which(is.na(x))
sum(is.na(df))

df1 <- data.frame(col1 = c(1:3,""),
                 col2 = c("this",NA,"is","text"),
                 col3 = c(TRUE,FALSE,TRUE,TRUE),
                 col4 = c(2.5,4.2,3.2,NA),
                 stringsAsFactors = FALSE)
df1
selectedData <- select(df1,col1)
selectedData
selectedData_L <- as.matrix(selectedData)
selectedData_L
for(i in selectedData_L)
{
  if (i == "")
  {
  print("99")
  }
}


##with nested loops

for (i in 1:4){
  for (j in 1:1){
    print(selectedData[i,j])
    len<-nchar(selectedData[i,j])
    if(len == 0)
    {
      print(99)
      selectedData[i,j]<-99
    }
  }
}

selectedData

x[is.na(x)] <- mean(x,na.rm = TRUE)
round(x,2)

df$col4[is.na(df$col4)] <- mean(df$col4,na.rm=TRUE)
df

#transformation
attach(airquality)
transform(Ozone,logOzone=log(Ozone))
transform(airquality, Ozone= -Ozone)
transform(airquality,new=-Ozone,Temp=(Temp-32)/1.8)
detach(airquality)
airquality

#Reshaping--Pivot in xls

install.packages("reshape2")
library(reshape2)
library(dplyr)

mydf <-data.frame(A=LETTERS[1:3],B=1:3,C=4:6)
mydf

?melt

mDF <- melt(mydf,id.vars="A")
mDF

data_melt=read.delim(file="D:/RProgramming/Day2/pew.txt",
                     header=TRUE,
                     stringsAsFactors = FALSE,
                     check.names = F)
data_melt

pew_mDF <- filter(melt(data_melt,id.vars="religion",variable.name="income",value.name="frequency"),religion=="Hindu")
pew_mDF

