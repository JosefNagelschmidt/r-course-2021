rm(list=ls())

#Best practice for working with real-world data
#1) Each observation should have its own row,
#while each variable should have its own column
#Use NA for missing values (instead of 0)
#3)Variable names are not allowed to contain spaces, # and %.
#Also they are not allowed to begin with a number
#4)do not replace the source file


#Importing data
?read.table
cars<-read.table("C:/Users/User/Desktop/R-Kurs/mtcars.txt", header = TRUE,
                 sep = " ", dec = ".")


#Export
?write.table
write.table(cars, file = "cars123.txt")

#Plotting data with basic R functions (instead of ggplot2)

#high-level commands: creates 
  #e.g. plot, hist, barplot, boxplot, qqnorm, curve
#low-level command: add things to an already existing plot


#working with high-level commands:

(y<-seq(100,700,100))
(x<-c(40,50,70,50,65,65,80))
#Plot data
?plot
plot(x,y)
plot(x,y, main = "Relationship between fertilizer and crop yield")
plot(x,y, main = "Relationship between fertilizer and crop yield",
     ylab = "Crop yield in USD", xlab = "Fetilizer in kilogramm")
plot(x,y, main = "Relationship between fertilizer and crop yield",
     ylab = "Crop yield in USD", xlab = "Fetilizer in kilogramm",
     col = "red", pch = 25)
plot(x,y, main = "Relationship between fertilizer and crop yield",
     ylab = "Crop yield in USD", xlab = "Fetilizer in kilogramm",
     type = "l")
plot(x,y, main = "Relationship between fertilizer and crop yield",
     ylab = "Crop yield in USD", xlab = "Fetilizer in kilogramm",
     ylim = c(0,1000), xlim=c(30, 90))


#Sampling from probability distribution
?rnorm
normal_sample<-rnorm(500, mean = 0, sd=1)
?hist
hist(normal_sample)
hist(normal_sample, freq =FALSE)
hist(normal_sample, freq =FALSE,
     xlim = c(-4,4), ylim = c(0, 0.5))
curve(dnorm(x, mean =0, sd=1), col = "green", add =TRUE)


#Examples of low-level commands

?abline
#abline(a,b) adds a straight line with the intercept a and the slope b
?lines
#lines(a,b) connetcs the points a,b with a line
#points(a,b) connects the a,b with dots/points
#text(x,y,"This is really interesting") 
#legend(x,y,legend) adds a legend at the coordinates (x,y)


#Apply low-level commands

curve(dnorm(x,mean=0, sd=1), from = -7.5, to =7.5)
curve(dnorm(x,mean=0, sd=2), from = -7.5, to =7.5, add = TRUE, col = "red")
curve(dnorm(x,mean=0, sd=0.5), from = -7.5, to =7.5, add = TRUE, col = "green")

legend("topleft",
       c(expression(paste(mu == 0," und ", sigma == 2)),
         expression(paste(mu == 0," und ", sigma == 1)),
         expression(paste(mu == 0," und ", sigma == 0.5))),
       lwd = c(1, 2, 2), lty = 1:3, col = c("black", "red", "green"))

#install packages
install.packages("ggplot2")

#load packages
library("ggplot2")

#the grammar of ggplot2
#1)data: raw material for your visualization
#2)aesthetics: mappins of your data to the visualization
#3) layers: each visualization requires at least layer. These layers take
#the form of a ggplot 2 geom function (e. g. simple scatter plot, hist, pie)

titanic<-read.csv("titanic.csv")

titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Survived <- as.factor(titanic$Survived)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)


#1. Plot: what was the survival rate?
ggplot(titanic, aes(x=Survived)) +
  geom_bar()

ggplot(titanic, aes(x=Survived)) +
  geom_bar() +
  labs(y ="Passenger Count",
       x = "Titanic Survival Rates")

#2. What was the survival rate by gender?

ggplot(titanic, aes(x=Sex, fill=Survived)) +
  geom_bar()

ggplot(titanic, aes(x=Sex, fill=Survived)) +
  geom_bar() +
  labs(y="Passenger Count",
       tile ="Titanic Survival Rates by Sex")

#3. What was the survival rate by class of ticket?
ggplot(titanic, aes(x=Pclass, fill = Survived)) +
  geom_bar() +
  facet_wrap(~Sex) +
  labs(y="Passenger Count",
       title = "Titanic Survival Rates by Sex and Passenger Class")
