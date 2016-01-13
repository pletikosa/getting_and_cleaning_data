library(dplyr)

## 0. PREPROCESSING

## check if the 'data' directory exists, otherwise create it
if (!file.exists("activity")) {
  dir.create("activity")}
}

## URL of the file containing the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## create a local temporary file for storing the data file
temp <- tempfile()

## download the file (in binary format)
download.file(fileUrl, temp, mode="wb")

## unzip the file
unzip(temp, exdir=".\\activity")

## delete the temporary file from the system
unlink(temp)


## read the data
yLabels = c("activityid")
subjectLabels = c("subjectid")

## Read the train data for facotrs(x), output(y), and subject
xTrainData <- read.table(".\\activity\\UCI HAR Dataset\\train\\X_train.txt")
yTrainData <- read.table(".\\activity\\UCI HAR Dataset\\train\\y_train.txt", col.names = yLabels)
subjectTrainData <- read.table(".\\activity\\UCI HAR Dataset\\train\\subject_train.txt", col.names = subjectLabels)

## Read the test data for facotrs(x), output(y), and subject
xTestData <- read.table(".\\activity\\UCI HAR Dataset\\test\\X_test.txt")
yTestData <- read.table(".\\activity\\UCI HAR Dataset\\test\\y_test.txt", col.names = yLabels)
subjectTestData <- read.table(".\\activity\\UCI HAR Dataset\\test\\subject_test.txt", col.names = subjectLabels)


## 1. MERGING

## merge all three components of train data
trainData <- cbind(xTrainData, subjectTrainData, yTrainData)

## merge all three components of train data
testData <- cbind(xTestData, subjectTestData, yTestData)

## merge the train and test datasets in a single data frame
data<- rbind(trainData, testData)


## 2. EXTRACTING OF MEAN AND STANDARD DEVIATION MEASUREMENTS

## read the names of features
features <- read.table(".\\activity\\UCI HAR Dataset\\features.txt")

labels <- c(make.names(features$V2), subjectLabels, yLabels)
names(data) <- labels

## select only data that corresponds to mean and std measurements (including activity and subject)
index <- grepl("\\.mean\\.|\\.std\\.|activityid|subjectid", labels)
data <- data[,index]


## 3. ASSIGNING DESCRIPTIVE ACTIVITY NAMES

##  read the labels for activities
activityLabels <- read.table(".\\activity\\UCI HAR Dataset\\activity_labels.txt", sep=" ", col.names=c("id", "activity"))

## merge the activity labels with the outcome variable 
## (to be able to transform it to a factor variable, with levels corresponding to activity labels) 
data <- merge(data, activityLabels, by.x="activityid", by.y="id", all=TRUE)

## remove the old column containing the activity as numeric value
data <- data[, !(colnames(data) %in% yLabels)]


## 4. LABELING THE VARIABLES WITH DESCRIPTIVE NAMES

varNames <- names(data);

## replace the abbreviations with full terms
varNames <- sub("Acc", "Accelerometer", varNames)
varNames <- sub("Gyro", "Gyroscope", varNames)
varNames <- sub("Mag", "Magnitude", varNames)

## capitalize the applied functions
varNames <- sub("\\.mean\\.", "\\.Mean\\.", varNames)
varNames <- sub("\\.std\\.", "\\.Std\\.", varNames)

## correct the typo of twice occuring Body
varNames <- sub("BodyBody", "Body", varNames)

## change the leding 't' and 'f' to 'time' and 'frequency'
varNames <- sub("^t","time", varNames)
varNames <- sub("^f","frequency", varNames)

## add 'Axis' after the corresponding axis symbol
varNames <- sub("X$","XAxis",varNames)
varNames <- sub("Y$","YAxis",varNames)
varNames <- sub("Z$","ZAxis",varNames)

## remove the dots
varNames <- gsub("\\.","",varNames)

## assign it
names(data) <- varNames


## 5. SUMMARIZING OVER ACTIVITY AND SUBJECT

## copy the data into a new independent dataset
tidyData <- data 

## transform the grouping variables into factors
tidyData$subjectid <- as.factor(tidyData$subjectid)
tidyData$activity <- as.factor(tidyData$activity)

## apply activity and subject as grouping variables
activitiesBySubject <- group_by(tidyData, activity, subjectid)

## summarize the data over activity and subject by calculating the average value (mean)
tidyData <-summarize_each(activitiesBySubject, funs(mean, "mean", mean(., na.rm = TRUE)))

## reapply again the variable names (before the last transformation)
names(tidyData) <- varNames

## store the data in a local folder
write.table(format(tidyData), ".\\activity\\tidyData.txt", row.names=FALSE, col.names=TRUE, quote=FALSE)

