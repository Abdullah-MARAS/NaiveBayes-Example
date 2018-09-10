
#Naive Bayes Algorithm                   



# Reading Data
url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data"

cars <- as.data.frame(read.table(file = url, header = FALSE, dec = ".", sep = ","))

# Assigning column names
colnames(cars) <- c(
  "buying",
  "maint",
  "doors",
  "persons",
  "lug_boot",
  "safety",
  "Class")
#Summary Statistics of Dataset
summary(cars)

# Reducing number of target variable
table(cars$Class)
#Converting type of target variable as factor
cars$Class <- as.factor(cars$Class)
levels(cars$Class)
#Assigning new target variable values
levels(cars$Class) <- c("acc","acc","unacc","acc")
levels(cars$Class)
table(cars$Class)

# Again summary statistics
summary(cars)



#Applying Naive Bayes Algorithm

# Data Partitioning
# install.packages("caret")
library(caret)
set.seed(1)
trainIndices <- createDataPartition(y = cars$Class, p = .80, list = FALSE) 
trainIndices[1:10]
trainset <- cars[trainIndices,]
testset <- cars[-trainIndices,]
#Frequency counts of train and test sets
table(cars$Class)
table(trainset$Class)
table(testset$Class)

# Separating target and predictive attributes
testPredictive <- testset[, -7]
testTarget <- testset[[7]]

trainPredictive <- trainset[, -7]
trainTarget <- trainset[[7]]

#install.packages("e1071")
library(e1071)
set.seed(1)


#Creating model and predictions
naiveBayes_model<-naiveBayes(trainPredictive,trainTarget)
predictions<-predict(naiveBayes_model,testPredictive)
table(predictions)

#Model evaluation by benefiting from confusion Matrix
modelPerformance<-confusionMatrix(data=predictions,reference=testTarget,dnn
                                  =c("Predictions","Real Target"))


print(naiveBayes_modeli)
print(modelPerformansi)

