#load activities and features data
activities <- read.table("activity_labels.txt", sep=" ", stringsAsFactors = FALSE, 
                         col.names=c("activity.id", "activity.name"))
features <- read.table("features.txt", stringsAsFactors = FALSE,
                       col.names=c("feature.id", "feature.name"))

#load test data
test.subject <- read.table("test/subject_test.txt", stringsAsFactors = FALSE, 
                           col.names="subject.id")
test.x <- read.table("test/X_test.txt", stringsAsFactors = FALSE, quote="", 
                     col.names=c(features$feature.name))
test.y <- read.table("test/y_test.txt", stringsAsFactors = FALSE, 
                     col.names="activity.id")

#load training data
train.subject <- read.table("train/subject_train.txt", sep=" ", stringsAsFactors = FALSE, 
                            col.names="subject.id")
train.x <- read.table("train/X_train.txt", stringsAsFactors = FALSE, 
                      col.names=c(features$feature.name))
train.y <- read.table("train/y_train.txt", sep=" ", stringsAsFactors = FALSE, 
                      col.names="activity.id")

#keep only pure mean and standard deviation columns from .x tables
test.x <- test.x[,grep("std|mean", colnames(test.x))]
test.x <- test.x[,-grep("meanFreq", colnames(test.x))]
test.x <- test.x[,-grep("X|Y|Z", colnames(test.x))]

train.x <- train.x[,grep("std|mean", colnames(train.x))]
train.x <- train.x[,-grep("meanFreq", colnames(train.x))]
train.x <- train.x[,-grep("X|Y|Z", colnames(train.x))]


#merge data
test.merged <- cbind(test.subject, test.y, test.x)
test.merged <- merge(activities,test.merged, by="activity.id")
train.merged <- cbind(train.subject, train.y, train.x)
train.merged <- merge(activities,train.merged, by="activity.id")
merged <- rbind(test.merged, train.merged)

#summarise tidy dataset
library(dplyr)
tidy <- group_by(merged, subject.id, activity.name)
tidy <- summarise_each(tidy, funs(mean))
tidy <- arrange(tidy, subject.id, activity.name)
tidy$activity.id <- NULL

##add friendlier column names
##doing it here for ease, kinda realized after the fact these names should be friendlier
colnames(tidy) <- gsub(pattern="^t" , replacement="time", colnames(tidy))
colnames(tidy) <- gsub(pattern="^f" , replacement="freq", colnames(tidy))

#write output
write.table(tidy, "tidy.txt", sep="\t", row.names=FALSE, quote=FALSE)

#clear objects from memory 
#uncomment to enable
#rm(list=ls())


