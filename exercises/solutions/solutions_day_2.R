# ex 1

HelloWorld <- function(){
  
  print("Hello World")
  
}

HelloWorld()


####################

Addition <- function(x=x, y=y){
  
  if (length(x) ==1 & length(y) == 1) {
    addition <- x+y
    return(addition)
  } else{
    stop(... = "There is a mistake!")
  }
  
  
  
}

Addition(x = 2, y = 2)


##################################

#Exercise 3a

sequence_function <- function(n){
  if(n>0 & n%%1==0){
    return(1:n)
  }
  else{
    stop()
  }
}

#Exercise 3b

sum_function <- function(n){
  if(n>0 & n%%1==0){
    value <- 0
    for(i in 1:n){
      value <- value + i
    }
    return(value)
  }
  else{
    stop()
  }
}

#Exercise 3c

sumofsquares_function <- function(n){
  if(n>0 & n%%1==0){
    value <- 0
    for(i in 1:n){
      value <- value + i**2
    }
    return(value)
  }
  else{
    stop()
  }
}

#Exercise 4a

recursive_faculty <- function(n){
  if(n>=0 & n%%1==0){
    if(n==0){
      return(1)
    }
    else{
      return(n*recursive_faculty(n-1))
    }
    
  }
  else{
    stop()
  }
}

#Exercise 4b

forloop_faculty <- function(n){
  if(n>=0 & n%%1==0){
    if(n==0){
      return(1)
    }
    else{
      value <- 1
      for(i in 1:n){
        value <- value * i
      }
      return(value)
    }
  }
  else{
    stop()
  }
}

######################################
# ex 5

A <- matrix(data = 1:16, 4, byrow = TRUE)
B <- matrix(cbind(rep(1,3), rep(2,3)), nrow = 3)
C <- matrix(data = c(11:13,21:23), nrow = 2, byrow = TRUE)

#a)

print(A[,2])
print(B[,2])
print(C[,2])

# b)

A[1,]
B[1,]
C[1,]

# c)

print(A[2,2])
print(B[2,2])
print(C[2,2])

# d)
B[c(1,3,4)]
A[seq(from=2, to=14, by=4)]
A[c(TRUE,FALSE)]
B[c(TRUE,FALSE,TRUE)]
C[c(TRUE,FALSE,TRUE)]
A[c(TRUE,FALSE,FALSE)]
B[,4]
A[,-2]
A[(1:2),-3]
A[c(TRUE,FALSE),c(TRUE,FALSE)]
C>11
C[C>11]



######################
# ex.6
# a)

v <- seq(from = 2, to = 33.5, by = 2.1)
M <- matrix(data = v, 4,4)

# b)
M[2,0] <- 42

# c)
M*M

# d)
M %*% M

# e)
v <- c(1,2,3,4)

M* v
M %*% v

# f)
det(M)

# g)
v1 <- cbind(v,v,v)
v2 <- rbind(v,v,v,v)

# let us do sth fancy! Create this as function

check <- function(x){
  if (is.matrix(x)== TRUE) {
    dim <- dim(x)
    return(paste("We have a matrix with", dim[1], "rows and", dim[2], "columns"))
  } else{
    stop("There is a mistake! The input is not a matrix")
  }
}

check(v1)

v3 <- "I am not a matrix"
is.matrix(v1)
is.matrix(v2)



















