View(state.x77)
all.states<- as.data.frame(state.x77)
all.states$Name <- rownames(state.x77)
all.states$Name 

rownames(all.states)<- NULL
str(all.states)

#creating subset
cold.states <- all.states[all.states$Frost>150,c("Name","Frost")]
cold.states

large.states <- all.states[all.states$Area>=100000,c("Name","Area")]
large.states

#apply merge function
merge(cold.states,large.states)

#union
merge(cold.states,large.states,all=TRUE)

#Stacking

a<- data.frame(a=c(0,1,2),b=c(3,4,5),c=c(6,7,8))
a
b<- data.frame(a=c(9,10,11),c=c(12,13,14))
b

b$b <- NA
b

new <- rbind(a,b)
new
