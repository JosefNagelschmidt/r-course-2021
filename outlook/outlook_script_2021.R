rm(list = ls())

# note that this script assumes that you have the python package "tensorflow"
# installed on your machine, and R knows how to find it.

library("EBImage")
library("keras")

# read in images
setwd("path_to_picture_folder")

# use file names of pics
pics <- c("p1.jpg", "p2.jpg", "p3.jpg",
          "p4.jpg", "p5.jpg", "p6.jpg",
          "c1.jpg", "c2.jpg", "c3.jpg",
          "c4.jpg", "c5.jpg", "c6.jpg",
          "b1.jpg", "b2.jpg", "b3.jpg")

mypic <- list()
for (i in 1:length(pics)){
  mypic[[i]] <- readImage(pics[i])
}

# explore a bit
print(mypic[[1]])
display(mypic[[12]])
summary(mypic[[1]])
hist(mypic[[1]])

# resize
min_width = 10000
min_height = 10000
for (i in 1:length(pics)){
  if (dim(mypic[[i]]@.Data)[1] < min_width){
    min_width <- dim(mypic[[i]]@.Data)[1]
  }
  if (dim(mypic[[i]]@.Data)[2] < min_height){
    min_height <- dim(mypic[[i]]@.Data)[2]
  }
}

for (i in 1:length(pics)){
  mypic[[i]] <- resize(mypic[[i]], min_width, min_height)
}

for (i in 1:length(pics)){
  mypic[[i]] <- array_reshape(mypic[[i]], c(min_width, min_height, 3))
}

# rowbind

trainx <- NULL
for (i in 1:5){
  trainx <- rbind(trainx, mypic[[i]])
}
str(trainx)

for (i in 7:11){
  trainx <- rbind(trainx, mypic[[i]])
}
str(trainx)

testx <- rbind(mypic[[6]], mypic[[12]],  mypic[[13]],  mypic[[14]],  mypic[[15]])

# let plane = 0 and car = 1

trainy <- c(rep(0,5), rep(1,5))
# testy <- c(0,1)

# one hot encoding
train_labels <- to_categorical(trainy)
test_labels <- to_categorical(testy)

train_labels

model <- keras_model_sequential()
model %>%
  layer_dense(units = 256, activation = "relu", input_shape = c(345600)) %>%
  layer_dense(units = 128, activation = "relu") %>%
  layer_dense(units = 2, activation = "softmax")

summary(model)

# compile
model %>%
  compile(loss = "binary_crossentropy",
          optimizer = optimizer_rmsprop(),
          metrics = c("accuracy"))

# fit model
history <- model %>%
  fit(trainx,
      train_labels,
      epochs = 20,
      batch_size = 32,
      validation_split = 0.2)


plot(history)

# evaluation and prediction
# training data performance
model %>% evaluate(trainx, train_labels)

# test data performance
(pred <- model %>% predict_classes(testx))
table(Predicted = pred, Actual = testy)
