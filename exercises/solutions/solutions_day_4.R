# Exercises Day 4
#Exercise 1
empty_mat <- matrix(rep(0, 100), 10, 10)
ein_mal_eins <- function(){
  for(i in 1:10){
    row = ""
    for(j in 1:10){
      #print(paste(i, "x", j))
      #empty_mat[i, j] <- paste(i, "x", j)
      row <- paste0(row, " ", paste0(i, "x", j))
    }
    print(row)
  }
  #return(empty_mat)
}
ein_mal_eins()

#Exercise 2
n <- 1e4
set.seed(123)
M <- matrix(data = rnorm(n^2), nrow = n, ncol = n)

sum(M)

summe <- 0
for(j in 1:n){
  summe <- summe + sum(M[, j])
}
summe

sums <- rep(0, n)
for(j in 1:n){
  sums[j] <- sum(M[, j])  
}
sums

summe <- 0
for(i in 1:n){
  for(j in 1:n){
    summe <- summe + M[i, j]
  }
}

#b)
mean_value <- function(v){
  summe <- 0
  for(i in 1:length(v)){
    summe <- summe + v[i]
  }
  summe <- summe / length(v)
  return(summe)
}

random_numbers <- rnorm(100000)
mean_value(random_numbers)  

#c)
variance <- function(v){
  mean_v <- mean_value(v)
  summe <- 0
  for(i in 1:length(v)){
    summe <- summe + (v[i] - mean_v)^2
  }
  summe <- summe / (length(v) - 1)
  return(summe)
}

variance(random_numbers)  


#Exercise 3
setwd("path_to_your_working_folder (where your dataset is saved)")
load("Test_auf_Normalverteilung.RData")


par(mfrow = c(1, 3))
hist(x, probability = TRUE)
hist(y, probability = TRUE)
hist(z, probability = TRUE)

vec <- c("x", "y", "z")
for(i in seq_along(vec)){
  hist(get(vec[i]), probability = TRUE)
  lines(density(get(vec[i])))
}

#Exercise 4
N <- 1e4
n <- 1e3
diff <- rep(0, N)
x <- runif(n)
a <- 0.9

for(j in seq_along(diff)){
  eps <- rnorm(n)
  y <- a * x + eps
  diff[j] <- a - lm(y ~ x -1)$coefficients
}
par(mfrow=c(2,1))
hist(diff, probability = TRUE, breaks = 100)
lines(density(diff))


diff2 <- rep(0, N)
for(j in seq_along(diff2)){
  yt <- rep(0, N)
  eps <- rnorm(n)
  
  for(i in 1:n){
    if(i==1){
      yt[i] <- eps[i]
    }
    else{
      yt[i] <- a * yt[i - 1] + eps[i]
    }
  }
  yt1 <- c(0, yt[-length(yt)])
  diff2[j] <- a - lm(yt ~ yt1 -1)$coefficients
}
hist(diff2, probability = TRUE, breaks=100)
lines(density(diff2))


#Exercise 5
n <- 10000
lambda <- 0.1
X1 <- rexp(n, rate = lambda)

X2 <- 20 - rexp(n, rate = lambda)
par(mfrow = c(2,1))
hist(X1, probability = TRUE, breaks = 50)
lines(density(X1))
hist(X2, probability = TRUE, breaks = 50)
lines(density(X2))


#d)
t.test(X1, X2)
mean(X1)
mean(X2)












  
  
  
  
  
  


















