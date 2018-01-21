#Author: Tedi Kondi
#Title: Getting and Cleaning Data Course Project
#Description: The purpose of this project is to demonstrate the  ability to collect, work with, and clean a data set.
#             The data to work with will come from wearable computing 

#Please setup as working directory the folder where werable data unziped folder is located("UCI HAR Dataset" folder)
#setwd("C:/Users/tkondi/Desktop/DataScientist/rProgramming/getandcleandata/project-assignment/")
#test data
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjecy_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#train data
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjecy_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#features 
features <- read.table("./UCI HAR Dataset/features.txt")

#labels
labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 1. Merges the training and the test sets to create one data set.
merged_x <- rbind(x_test,x_train)
names(merged_x) <- features[,2]
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
grep_mean_std <- grepl("mean|std", features[,2])
merged_x <- merged_x[,grep_mean_std]

merged_subject <- rbind(subjecy_test,subjecy_train)
names(merged_subject) <- "subject"

merged_y <- rbind(y_test,y_train)
# setting labels to y
merged_y[,2] <- labels[merged_y[,1],2]
# 3. Uses descriptive activity names to name the activities in the data set
names(merged_y) <- c("activity_id","activity") 

# 4. Appropriately labels the data set with descriptive variable names.
# All is labeld: now put all together in a single table
fianl_table <- cbind(merged_subject, merged_y, merged_x)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
if (!"dplyr" %in% installed.packages()) {
  install.packages("dplyr")
}
library(dplyr)
names(fianl_table)
fianl_table %>% 
  group_by(subject,activity_id,activity) %>% 
  summarise_all(funs(mean)) %>%
  write.table(file = "./tidy_mean_std.txt", row.names = FALSE)
