#Getting and Cleaning Data Course Project in R


##What requested for the project

- Create a R script called run_analysis.R to perform the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Data provided for the project 
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##How run_analysis.R for the further transofrmaition
1. Download and unzip: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Use setwd to change the working directory to the directory where the zip has been unzipped and folder "UCI HAR Dataset" is located.
3. Run run_analysis.R that will create the tidy file: tidy_mean_std.txt