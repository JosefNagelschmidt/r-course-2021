# some housekeeping
rm(list = ls())
###Exercises Day 1:

##1a)

#Circumference Rectangle = 2 * (Length + Width)
(Area_Circumference  = 2*(4.2+5.5))

#Area Rectangle = Length * Width
(Area_Rectangle = 4.2*5.5)

#Circumference Circle = 2 * pi * radius
(Circle_Circumference = 2 * pi * 13)

#Area Circle = pi * (radius)^2
(Area_Circle = pi * 13^2)

##1b)

3/2
2**4
10**5
#a**b raises the exponent a to the power b


##1c)
?sqrt
sqrt(8)


##1d)
?log
log2(9)

##Exercise Nr. 2:
##2a)

#write down variables in the console
#it works, i.e. it assigns the values to the variables

##2b)
x<-x*y*pi
y<-z*2*pi
z<-x*8*exp(3)

##2c)
x<-11
y<-6
z<-8
(x)
(y)
(z)

##2d)
res1<-x*y
res2<-x+y
res3<-x^(3^2)
res4<-(x^3)^2


##2e)
satz <- "Hello World"
satz
#The variable satz get's printed


##2f)
myName <- "Marvin"


#2g)
myName + x
#It does not work, because we are trying to make a non-numerical 
#variable work together with an operator made for numerical arguments

#2h)
?paste0
#the function paste binds vectros together after converting the values
#of the previously single vectors to cvharacter values
paste0(myName,x,satz,8)


##2i)
?paste
#you can tell by looking at the help site of ?paste, that the difference
#between paste and paste0 is the seperation between the different concatenated
#vectors, which is for paste0 not existent
paste(myName,x,satz,8)


##2j)
#we can make use of the different seperators in the functions
paste("11", "mal", "x", "ist", paste0("11", "x"))


##2k)
#The ls-function does return a character vector of all the named objects
#visible in the environment where it is called
#The rm-function deletes specified objects from the workspace
#Therefore overall rm(list=ls()) clears all objects from the workspace
rm(list=ls())


###Exercise Nr. 3:
##3a)
x<-42
x<-1
y<-5
y<-4
#y<-8
y<-5+x


##3b)
#leaving out line 1 does not change the value of x, because the value
#assigned to x in the first line get's overwritten anyway


##3d)
#line 5 does not change anything, because it is marked as a comment


##3e)
#it changes the x value

#
##############################
# ex 4 Constants

# U = 2*pi*r

radius <- 2

U <- 2*pi*radius
U

#print(U)

#
# b)
#

pi <- 3

radius <- 2

U <- 2*pi*radius
U

# carful! You can even overwrite constants without warning

################################
# ex 5 Saving and Loading Data

################################
# ex 6 Defining Vectors

# a)
a <- c("Hallo Welt, wie geht es dir?")
# a_1 <- c("Hallo", "Welt", "," ,"wie", "geht", "es", "dir") useful for g)


hallo <- "Hallo"
welt <- "Welt"
wie <- "wie"
a_2 <- paste(... = hallo, welt, wie, sep = " ")
a_2

# b)
b <- c(0,1,5,8,3,4)

# c)
c <- rep(x = 1, times = 100)

v = 1
c <- rep(x = v, times = 100)
c

# d)
d <- 1:213
d <- seq(from = 1, to = 213, by = 1)

# e)
e <- 31:5
e <-seq(from = 31, to = 5, by = -1)

# f)
v <- c(1,2,3,4)
f <- rep(x = v, times = 10)

# g)
g <- c() # difference to g <- NaN
g <- c(d,e,f) 

g <- c(d,e,f,a) 
# alternitve g <- c(g, a)


##################################
# exercise 7

# a)
manyNumbers <- 100:199

manyNumbers[5]
manyNumbers[8]
manyNumbers[13]

# b)
manyNumbers[c(5,8,13)]

# c)
manyNumbers[-5]
manyNumbers[-8]
manyNumbers[-13]

# d)
manyNumbers[-c(5,8,13)]

# e) 
rev(manyNumbers)
manyNumbers[length(manyNumbers):1]

# Intuition behind this
length(manyNumbers)
# 100
100:1
# 100 99 98 97
manyNumbers[10:25]

# f) 
seq_by_two <- seq(from = 2, to = (length(manyNumbers)),by = 2)
manyNumbers[seq_by_two]

# g)
x <- rep(FALSE,100)
x[5] <- TRUE
x[8] <- TRUE
x[13] <- TRUE
manyNumbers[x]

# we use boolean parameters to print particular elements of a vector. 
# to apply this methodic to d), set all equal to True, exept 5,8,13

x <- rep(TRUE, 100)
x[5] <- FALSE
x[8] <- FALSE
x[13]<- FALSE
manyNumbers[x]
manyNumbers

# h)
x <- rep(TRUE, 50)
x[5] <- FALSE
x[8] <- FALSE
x[13]<- FALSE
manyNumbers[x]
# indexing vector will starts over again

# i)
# missleading exercise. Of course you could do taht withut the rep and seq function, but this would take to much of your time.
#

x <- rep(TRUE, 100)
x[5] <- FALSE
x[8] <- FALSE
x[13]<- FALSE
manyNumbers[x]


# j)
# use the insights from exercise h. So we will create a vector containig booleans that allows us 
# to print out every third element

x <- c(FALSE, FALSE, TRUE)
manyNumbers[x]


#####################
# exercise 8)

y <- c(7,5,4,102,100,5,9,1,3,88)

# a)
length(y)

# b)
sum(y)

# c)
mean(y)
sd(y)

# Logical operators on which I told you yesterday in the lecture

# d)
y>7 #boolean
sum(y>7) # number of elements that are >7

# e)
y[y > 7] # gives us the value of elements that fullfill properties

# f) 
mean(y[y > 4])

# g)
sum(y^2)
exp(y)
sin(y)

print(sin(y))

# h)
z <- rep(2, length(y))
length(y)== length(z)

y+z
y-z
y*z
y/z

# i)

y %*% y
t(y) %*% y

# j)
y %*% t(y)

?sort

sort(x = y, decreasing = TRUE, na.last = TRUE)
sort(x = y, decreasing = FALSE, na.last = TRUE)
