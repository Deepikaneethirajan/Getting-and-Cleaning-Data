Code Book
    This document is an overview of the steps followed in run_analysis.R script to complete the expectations of the course project.
1. Merging of data is done by rbind() function.
    - All the data from x_test and x_train are combined into a dataset x_dataset
    - All the data from y_test and y_train are combined into a dataset y_dataset
    - All the data from subj_test and subj_train are combined into a dataset subj_dataset
2. In the given zip folder containing data, features.txt contains a list of all the features. These features include the mean and standard deviation measurements as well.
    - The columns containing mean and standard deviation(std) values are identified using grep() function
    - Then the columns with mean and std are subset from the merged dataset
3. In order to provide descriptive activity names, the activity labels are read from activity_labels.txt file. All the activities in the y_dataset are replaced by proper activity labels.
4. The variables in the datasets are appropriately labeled.
5. An independent tidy data set is created upon calculating the average of each column until column no 66 as the last two columns only contain the Subject and activity. This tidy dataset is written into a text file tidy_dataset.txt.