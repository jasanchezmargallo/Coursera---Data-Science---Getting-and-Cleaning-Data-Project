## Precondition: We consider that the files of the data set have been unziped in the current directory
library(data.table)

## ***************************************************************
## 1. Merges the training and the test sets to create one data set
## ***************************************************************

## Import the features and activity
features <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

## Import the test data set and labels
XTest <- read.table("UCI HAR Dataset/test/X_test.txt")
YTest <- read.table("UCI HAR Dataset/test/Y_test.txt")
subjectsTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Import the train data set and labels
XTraining <- read.table("UCI HAR Dataset/train/X_train.txt")
YTraining <- read.table("UCI HAR Dataset/train/Y_train.txt")
subjectsTraining <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Merge both data sets, test and train data sets 
mergedX <- rbind(XTest, XTraining)
mergedY <- rbind(YTest, YTraining)
subjects <- rbind(subjectsTest, subjectsTraining)


## *****************************************************************************************
## 2. Extracts only the measurements on the mean and standard deviation for each measurement
## *****************************************************************************************

## Get the indexes for the mean() and std() of each measurement
index <- grep("mean\\(\\)|std\\(\\)", features[,2]) 

## Extract the measurements for the mean() and std()
measures <- mergedX[,index]


## *************************************************************************
## 3. Uses descriptive activity names to name the activities in the data set
## *************************************************************************

## Replace values with the corresponding activity label
mergedY[,1] <- activities[mergedY[,1],2] 


## ********************************************************************
## 4. Appropriately labels the data set with descriptive variable names
## ********************************************************************

## Change the names for each variables of the data set and the columns of the 
## subjects and margedY tables
names(measures) <- features[index,2]
names(subjects) <- "ID"
names(mergedY) <- "Activity"

## ***************************************************************************
## 5. From the data set in step 4, creates a second, independent tidy data set
## set with the average of each variable for each activity and each subject
## ***************************************************************************

## Create a table combining the data of "subjects", "mergedY" and "measures"
cleanData <- cbind(subjects, mergedY, measures)
cleanDataTable <- data.table(cleanData)

## A new table was computed by means of applying the mean function (lapply function) 
## to the subset of variables (.SD) for each ID and Activity.
cleanDataTableAverages <- cleanDataTable[, lapply(.SD, mean), by = 'ID,Activity']

## Writing the cleaned data set into a text file
write.table(cleanDataTableAverages, file = "Tidy_Dat_Set.txt", row.name = FALSE)

