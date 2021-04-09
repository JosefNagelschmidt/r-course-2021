rm(list = ls())

#Exercise 1

#a)
X <- matrix(c(5, 6, 0, 6, 0, 5, 8, 9, 8), 3, 3)
b <- c(3, 5, 7)

det(X)
Y <- solve(X) %*% b

#b)
solve(X, b)

#c)
apply(X, MARGIN = 2, FUN = mean)
colMeans(X)

#d)
apply(X, MARGIN = 2, FUN = sd)

#e)
sorted <- apply(X, MARGIN = 1, FUN = sort, decreasing = TRUE)
sorted
t(sorted)


#Exercise 2

i <- 0
j <- 1

while(i < 1){
  
  x <- rnorm(100)
  y <- rnorm(100)
  
  res_lm <- lm(y ~ x)
  #without constant: lm(y ~ x -1)
  t <- res_lm$coefficients[2] / sqrt(diag(vcov(res_lm)))[2]
  
  if(abs(t) > qnorm(0.975)){
    i <- 1
  }
  print(j)
  j <- j + 1
}

#Exercise 3
library(carData)
#a)
Duncan$income[6]
Duncan[6, 2]
Duncan$income

#b)
Duncan$prestige
Duncan[, 4]
Duncan[, "prestige"]

#c)
Duncan[10, ]

#d)
Duncan$income[8:nrow(Duncan)]

#e)
Duncan[c(TRUE, FALSE), ]
Duncan[seq(from = 1, to = nrow(Duncan), by = 2), ]


#Exercise 4
faithful
?faithful

#a)
mean_std <- function(vec){
  avg <- sum(vec) / length(vec)
  res <- (1 / (length(vec) - 1)) * sum((vec - avg)^2)
  return(list(mean = avg, standard_dev = sqrt(res)))
}

res = mean_std(faithful$eruptions)

#b)
eruption_times <- faithful$eruptions

hist(eruption_times, probability = TRUE)
lines(density(eruption_times), col="red", lwd=2, lty="dashed")

#Exercise 5
getwd()

setwd("path_to_the_folder_where_your_data_is_located")
lwahl <- read.csv("Landtagswahl.csv",
                  header = TRUE)
lwahl <- read.csv("Landtagswahl.csv",
                  header = TRUE, row.names = 1)

?read.csv
#a)
row.names(lwahl) <- c("Wahlberechtigte", "ungueltige_Stimmen",
                      "Stimmen_fuer_SPD", "Stimmen_fuer_CDU",
                      "Stimmen_fuer_FDP",
                      "Stimmen_fuer_die_Gruenen", 
                      "Stimmen_fuer_sonstige_Parteien")

# if you want to change only one row name:
# row.names(lwahl)[1] <- c("hello")

# optional:
lwahl_reduced <- lwahl[,-1]

colnames(lwahl_reduced) <- c("Landtagswahl1996", "Landtagswahl2001")


#c)
voters <- c(sum(lwahl_reduced[-1, "Landtagswahl1996"] - lwahl_reduced[2, "Landtagswahl1996"]),
            sum(lwahl_reduced[-1, "Landtagswahl2001"] - lwahl_reduced[2, "Landtagswahl2001"]))

eligible <- lwahl_reduced[1, ]

turnout <- voters / (eligible) * 100


#d)
barplot(lwahl_reduced$Landtagswahl1996[3:nrow(lwahl_reduced)],
        names.arg = c("SPD", "CDU", "FDP", "Gruene", "Sonstige"),
        col = c("red", "black", "yellow", "green", "grey"))

barplot(lwahl_reduced$Landtagswahl2001[3:nrow(lwahl_reduced)],
        names.arg = c("SPD", "CDU", "FDP", "Gruene", "Sonstige"),
        col = c("red", "black", "yellow", "green", "grey"))

?barplot






















