rm(list = ls())

# basic arithmetic (by Josef)

1 + 1
1 - 1

2.5 * 4
1 / 3

2^2

2 ** (2 ** 3)

(2 ** 2) ** 3

# variables

x <- 10 + 5
x <- x + x

x**2

y <- x

# special numerical objects

pi

1 / 0

0 / 0

# data types

x <- 1 + 2i
typeof(x)

# data structures

# lists
my_list = list(1L, 1.25, "this_works")
str(my_list)

my_list[[3]]

# nested list
my_second_list = list(my_list, 1 + 2i)

length(my_second_list[[2]])

# vectors

x <- c(1,2,3,7)
x
y <- c("this", "actually", "works")
y
y <- c("wait", 1)
y

# indexing of lists and vectors

x <- c(2,4,6,8,10)
x[6]

x[2] <- 100

x[c(1,3,5)]

x[c(1,3,5)] <- -100

x[-c(1, 2)] <- 400

y <- list(1, 1.25, "this_works")

y[1]
y[[1]]

# useful commands

x <- c(1,2,3,4,5)
y <- 1:5

z <- seq(from=10, to=1, by=-2)

x <- seq(from=0, to=1, length.out=20)
x

x <- 1:10
y <- -4:5

x + y

x * y

# elementwise!
x ** y

x[2] ** y[2]

2 * x 

10 + x

x**2


x <- 1:5
y <- c(1,5,10)
y
x
x + y

# some useful functions

x <- -5:5
sum(x)

mean(x)
sd(x)

cumsum(x)

###################################################
# matrices (by Jona)

data <- 1:9
row <- 3
col <- 3

x <- matrix(data, row, col, byrow = TRUE)
x

dim(x)
nrow(x)
ncol(x)

x <- matrix(1:9,3)
x
y <- matrix(1:6, ncol = 3)
y
z <- rbind(x,y)
z

x <- cbind(1:3, 4:6)
x

rowSums(x)
colSums(x)
rowMeans(x)
colMeans(x)

m <- matrix(1:9,3)

apply(m, 1, mean)
apply(m, 2, mean)

####
# matrix algebra

X <- matrix(1:9, 3)
y <- -1:1

X*y

y <- c(2,7,5,1)
y*y

y %*% y # t(y) %*% y
y %*% t(y)

X <- matrix(1:9,3)
y <- -1:1

X %*% y

X * X
X %*% X

t(X)
solve(X)


X[1,3] <- 0
solve(X)

diag(X)

x <- c("Michael", "Robin", "Jonah")
y <- c(1.0, 1.3, 3.0)
z <- c("a", "b", "c")

myFirstDataFrame <- data.frame(names = x, grades =y, type = z)
myFirstDataFrame

as.data.frame(X)

head(myFirstDataFrame)
head(iris)


y[1]

X[2,3]
X[1,]
X[,2]

X[c(1,2), c(2,3)]

myFirstDataFrame$names

myFirstDataFrame["names"]
myFirstDataFrame[["type"]]


x <- 1:10
is.matrix(X)
is.data.frame(myFirstDataFrame)

x < 5

rowSums(X)
sum(x < 5)

x[!(x<5)]

x[(x<3) | (x >8)]

any(x < 8)
all(x>5)

which( x >9)

x <- c(1,5,7,2)
which(x > 6)




