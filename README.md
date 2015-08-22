# Getting and Cleaning Data course assignment
This readme contains

 - project overview
 - relevant files, description of
 - resources


## Project overview
Per the course

 - Purpose: "demonstrate your ability to collect, work with, and clean a data set"
 - Goal: "prepare tidy data that can be used for later analysis"
 - Tasks: 
 "You should create one R script called run_analysis.R that does the following. 
 
 - 1. "Merges the training and the test sets to create one data set.
 - 2. "Extracts only the measurements on the mean and standard deviation for each measurement. 
 - 3. "Uses descriptive activity names to name the activities in the data set
 - 4. "Appropriately labels the data set with descriptive variable names. 
 - 5. "From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
The assignment is based on data collected in an experiment. This data is activity data (collected by a smartphone) of "group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data." (http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names) Part of the assignment included merging the training and test data back together.


## Relevant files
Files in this repo

 - CODEBOOK - describes the data and provides additional references/links to resources
 - run_analysis.R - this file contains the code addressing the assignment and was used to generate the tidyAverages.txt file (described below)
 - tidyAverages.txt - this is the output from step 5 of the project: "tidy data set with the average of each variable for each activity and each subject." It was created with  write.table and can be viewed in R or in a spreadsheet application such as MS Excel:
 
 - - read.table("tidyAverages.txt", header=TRUE)
 - - in Excel (current versions), select delimeted file and set the delimiter to space

## Resources
For more information on the data, see 

 - Getting and Cleaning Data Course Project assignment description in Getting and Cleaning Data Coursera course
 - UCI Machine Learning Repository, particularly http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
 - project data at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 



