#run_analysis <- function() {
##  ---
##  title: "get and clean data: peer assignment 1"
##  author: "DianeCS"
##  date: "Sunday, July 26, 2015"
##  output: tidy data file
##  references: course materials including discussions
##              stackoverflow
##  ---
  
## get data
  if(!file.exists("./UCI HAR Dataset")){
    unzip("./getdata-projectfiles-UCI HAR Dataset.zip",exdir = ".")}
  
  
  testData <- read.table("./UCI HAR Dataset/test/X_test.txt")            # test data
  trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")         # training data
  testLabels <- read.table("./UCI HAR Dataset/test/Y_test.txt")          # test labels(activity codes)
  trainLabels <- read.table("./UCI HAR Dataset/train/Y_train.txt")       # training labels(activity codes)
  featurestxt <- read.table("./UCI HAR Dataset/features.txt")            # identification of test and train data columns
  activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
  testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
  testIStotalacc <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
  testISbodygyro <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
  
##  Merges the training and the test sets to create one data set.
  

  testandtrainData <- rbind(testData, trainData)
   ## next two lines based on stackoverflow (http://stackoverflow.com/questions/28549045/dplyr-select-error-found-duplicated-column-name)
  valid_column_names <- make.names(names=featurestxt[,2], unique=TRUE, allow_ = TRUE)
  names(testandtrainData) <- valid_column_names
  
##  Extracts only the measurements on the mean and standard deviation for each measurement.
  
  selectedColNames <- grep("mean|std",featurestxt[,2], value=FALSE)
  selectedDataSet <- subset(testandtrainData, select=selectedColNames)

### adds activity labels and subjects to dat
  testandtrainLabels <- rbind(testLabels, trainLabels)
  colnames(testandtrainLabels) <- c("activityType")
  
  testandtrainSubject <- rbind(testSubject, trainSubject)
  colnames(testandtrainSubject) <- c("subject")
 
  fulldataset <- cbind(testandtrainData, testandtrainLabels, testandtrainSubject)

  
##  Uses descriptive activity names to name the activities in the data set
  
  ## the following line suggested by Carly Stoughton in discussion
  fulldataset$activities <- factor(fulldataset$activityType
                                   , levels = sort(unique(fulldataset$activityType))
                                   ,labels =  activityLabels$V2)
  
##  Appropriately labels the data set with descriptive variable names. 
  
  # data labeled above (since the original data set uses a consistent coding of variable names, 
  # these are retained for column names)

##  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  tidyAverages <- aggregate(fulldataset, by=list(fulldataset$subject, fulldataset$activities), FUN="mean")  
  
  write.table(tidyAverages, file="tidyAverages.txt", row.names=FALSE)
#}