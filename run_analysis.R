library(plyr)
##Step 1
setwd("/Users/deepikaneethirajan/Documents/Data Sciences Specialization/John-Hopkins/Getting & Cleaning Data/CourseProject/Trial/test")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subj_test <- read.table("subject_test.txt")
setwd("/Users/deepikaneethirajan/Documents/Data Sciences Specialization/John-Hopkins/Getting & Cleaning Data/CourseProject/Trial/train")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subj_train <- read.table("subject_train.txt")


x_dataset <- rbind(x_test,x_train)
y_dataset <- rbind(y_test,y_train)
subj_dataset <- rbind(subj_test,subj_train)
merged_dataset <- cbind(x_dataset,y_dataset,subj_dataset)

##Step 2
features_data <- read.table("features.txt")
mean_std_col_names <- grep(".*mean.*|.*std.*",features_data[,2])

