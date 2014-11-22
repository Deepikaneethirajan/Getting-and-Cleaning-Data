library(plyr)
##Step 1
## Reading data from the given text files

x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subj_test <- read.table("subject_test.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subj_train <- read.table("subject_train.txt")

## Merging the train and test datasets

## Creating x dataset
x_dataset <- rbind(x_test,x_train)

## Creating y dataset
y_dataset <- rbind(y_test,y_train)

## Creating subject dataset
subj_dataset <- rbind(subj_test,subj_train)

## Merge all three datasets
merged_dataset <- cbind(x_dataset,y_dataset,subj_dataset)

## Step 2
## To Extract only the measurements on mean and standard deviation

## Read data from features.txt
features_data <- read.table("features.txt")

## Identify columns with mean and std
mean_std_col_names <- grep(".*mean.*|.*std.*",features_data[,2])

##subset cols with mean and std
merged_dataset <- merged_dataset[,mean_std_col_names]

##Renaming columns
names(merged_dataset) <- features_data [mean_std_col_names,2]

## Step 3
## Descriptively Naming the activities in the dataset
## Read data from activity_labels.txt
activities <- read.table("activity_labels.txt")

## Update with correct column names
y_dataset[,1] <- activities[y_dataset[,1],2]

## Step 4
## Labelling the dataset with descriptive variable names

## Label with correct Column Name
names(y_dataset) <- "Activity_Name"
names(subj_dataset) <- "Subject"

## combining updated Datasets
merged_dataset <- cbind(x_dataset,y_dataset,subj_dataset)

## Step 5
## Creating a tidy data set with average of each column for each activity and each subject
average_of_each_activity <- ddply(merged_dataset, .(Subject,Activity_Name),function(x) colMeans(x[1:66]))

## Writing tidy data to a text file
write.table(average_of_each_activity,"tidy_dataset.txt",row.name=FALSE)

