x <- c(21,62,10,53)
labels <- c("London","Newyork","Singapore","Mumbai")

png(file="D:/RProgramming/Day2/city.jpg")
pie(x,labels,main="Pie chart of countries")
dev.off()

#annotated
slices <-c(10,12,4,16,8)
lbls <- c("US","UK","Australia","Germany","France")
pct <- round(slices/sum(slices)*100)
lbls<- paste(lbls,pct)
lbls<- paste(lbls,"%",sep="")
pie(slices,labels=lbls,col=rainbow(length(lbls)),main="Pie Chart of Countries")

install.packages("plotrix")
library(plotrix)

pie3D(slices,labels=lbls,explode=0.1,main="Pie Chart of Countries")

###barplot
#create the input vectors

colors <- c("green","Orange","brown")
months <- c("Mar","Apr","May","Jun","Jul")
regions <- c("East","West","North")
#create the matrix of the values

Values <- matrix(c(2,9,3,11,9,4,8,7,3,12,5,2,8,10,11),nrow=3,ncol=5,byrow=T)
png(file="D:/RProgramming/Day2/barchart_stacked.jpg")

barplot(Values,main="Total Revenue",names.arg=months,xlab="month",ylab="revenue",col=colors)
legend("topleft",regions,cex=1.3,fill=colors)
dev.off()


View(mtcars)

x <- mtcars[order(mtcars$mpg),]
x

x$cyl <- factor(x$cyl)
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"

dotchart(x$mpg,labels=row.names(x),cex=.7,groups=x$cyl,
         main="Gas Mileage for Car Model \ngrouped by cylinder",
         xlab="Miles per Gallon", gcolor="black",color=x$color)

###Peak Valley chart

install.packages("ggplot2")
library(ggplot2)
theme_set(theme_minimal())
economics

#Basic line plot

ggplot(data=economics,aes(x=date,y=pop))+geom_line(color="#00AFBB",size=2)

# # Plot a subset of the data
ss <- subset(economics, date > as.Date("2006-1-1"))
ggplot(data = ss, aes(x = date, y = pop)) +
  geom_line(color = "#FC4E07", size = 2)
install.packages("tidyr")
library(tidyr)
library(dplyr)
df <- economics %>%
  select(date, psavert, uempmed) %>%
  gather(key = "variable", value = "value", -date)
head(df, 3)
# # Multiple line plot
ggplot(df, aes(x = date, y = value)) +
  geom_line(aes(color = variable), size = 1) +
  scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  theme_minimal()
# # Area plot
ggplot(df, aes(x = date, y = value)) +
  geom_area(aes(color = variable, fill = variable),
            alpha = 0.5, position = position_dodge(0.8)) +
  scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800"))
