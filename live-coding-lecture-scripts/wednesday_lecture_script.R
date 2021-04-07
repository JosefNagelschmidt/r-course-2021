rm(list = ls())


# conditional expressions:

x <- 10
if (x < 11) {
  print("x is smaller than 10.")
}


x <- 10
if (x < 10) {
  print("x is smaller than 10.")
} else {
  print("x is *not* smaller than 10.")
}

x <- 10
if (x < 10) {
  print("x is smaller than 10.")
} else if (x > 0) {
  print("x is between 0 and 10.")
} else {
  print("x is either smaller than 0 or bigger than 10.")
}

x <- 10
if ((x < 11) & (x > 0)) {
  print("x is smaller is in the interval (0,10).")
} else {
  print("x is either smaller than 0 or bigger than 10.")
}

# user input

cat("Please choose which type of regression should be run:\n")

x <- readline(prompt="Linear regression (1); Polynomial regression (2): ")
x <- as.integer(x)

if (x == 1) {
  print("Okay lets do linear regression!")
} else if (x == 2) {
  print("Oh no I hate polynomial regression :(")
} else {
  print("There were only two options what did you do?")
}


# loops
# i = 1 not needed beforehand
# rm(i)

for (i in 1:10){
  print(i)
}

# example
matrices <- list()
for (i in 1:10) {
  imatrix <- matrix(1:(i ** 2), nrow=i, ncol=i)
  
  matrices[[i]] <- imatrix
}
matrices[[5]]

# another example:

count <- 0
nsim <- 10000
for (i in 1:nsim) {
  x <- runif(1, min=0, max=1)
  y <- runif(1, min=0, max=1)
  
  z <- x + y
  if (z >= 0.75 && z <= 1.25) {
    count <- count + 1
  }
}
count / nsim

# while loop:

userinput <- NULL

while (is.null(userinput)) {
  input <- readline("Type in a number between 0 and 10. \n")
  input <- as.integer(input)
  
  if (is.numeric(input)) {
    if (input >= 0 && input <= 10) {
      userinput <- input
    }
  }
}
userinput


#################################################################################
# FUNCTIONS

# Definition:

# A function is a sequence of program instructions that performs a specific task, 
# packaged as a unit. This unit can then be used in programs wherever that particular 
# task should be performed. Functions may be defined within programs, or separately
# in libraries that can be used by many programs.

# examples of functions:

# basic functions without arguments (input parameters)

say_hello <- function(){
  print("hello")
}

say_hello()

# note that the last expression that returns a value in the function body will 
# be returned by default

add_numbers <- function(){
  a <- 4 + 5
  2 + 5
}

add_numbers()

a <- add_numbers()

# some side effects (plot):
plot_something <- function(){
  curve(4*x**2, ylim=c(0,4), xlim=c(0,1), col = "red")
}

plot_something()

y <- c(1,2)
# functions with one input param
add_2 <- function(any_name) { 
  any_name + 2
}

add_2(y)

add_2 <- function(y) { 
  return(y + 2)
}

# now suppose Now suppose you need another function that instead adds 7
# to its argument. The natural thing to do would be to write another function, just like add_2 where the 2
# is replaced with a 7. But this would be grossly inefficient: if in the future you discover that you 
# made a mistake and you in fact need to multiply the values instead of add them, you would be forced to change 
# the code in two places.

# A better idea would be to write a function that takes one argument, x, that returns another function 
# which adds its argument, y to x. In other words, something like this:

add_x <- function(x) {
  function(y) { x + y }
}

add_2 <- add_x(2)
add_7 <- add_x(7)

add_2(1:10)
add_7(1:10)

# another example:
power <- function(exponent) {
  function(x) {
    x ^ exponent
  }
}

square <- power(2)
square(2)

# function with several input params

normaldensity <- function(x, mu, sigma) {
  constant <- 1 / sqrt(2 * pi * sigma ** 2)
  exponential <- exp(- (x - mu) ** 2 / (2 * sigma ** 2))
  return(constant * exponential)
}
normaldensity(x=0, mu=0, sigma = 1)


# recursive functions

fibonacci <- function(n) {
  if (n == 0) {
    return(0)
  } else if (n == 1) {
    return(1)
  } else {
    return(fibonacci(n - 1) + fibonacci(n - 2))
  }
}

fibonacci(2)

n <- 1:10
fib <- sapply(n, fibonacci)
rbind(n, fib)

?apply