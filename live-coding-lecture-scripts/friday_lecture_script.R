rm(list=ls())

library("ggplot2")

n<-500

iq<-rnorm(n, mean = 110, sd=25)
income<- 1000 + exp(iq/50) + rnorm(n, sd=2)

Example1<-data.frame(iq=iq, income = income)

ggplot(Example1, aes(x=iq, y=income)) +
  geom_smooth()


#Linear Regression

n<-100 #number of data points
x1<-runif(n, 0, 10)
beta <-2 #true parameter
eps<-rnorm(n, 0, 1)

y<-x1*beta+eps #simulated outcomes

plot(x1,y)

linear_model1<-lm(y~x1)
summary(linear_model1)


#create our data

n<-100 #number of obersvations

x1<-runif(n, 0, 10)
x2<-rnorm(n)
x3<-rchisq(n, df=3)

X<-cbind(x1,x2,x3)

beta<-c(2,0,-1) #true parameters

eps<-rcauchy(n)

y<- X%*% beta + eps #simulated outcomes

linear_model2<-lm(y ~ X)

summary(linear_model2)


##Example 3

Example3<-data.frame(income =y, age = x1, edu=x2, nationality=x3)


linear_model3<-lm(income ~ age + edu + I(edu**2), data=Example3)
summary(linear_model3)
