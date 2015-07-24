# Step1. Merges the training and the test sets to create one data set.
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt") 
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
MergeData <- rbind(trainData, testData)
MergeLabel <- rbind(trainLabel, testLabel)
MergeSubject <- rbind(trainSubject, testSubject)


# Step2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("./UCI HAR Dataset/features.txt")
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
MergeData <- MergeData[, meanStdIndices]
names(MergeData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) # remove "()"
names(MergeData) <- gsub("mean", "Mean", names(MergeData)) # capitalize M
names(MergeData) <- gsub("std", "Std", names(MergeData)) # capitalize S
names(MergeData) <- gsub("-", "", names(MergeData)) # remove "-" in column names 

# Step3. Uses descriptive activity names to name the activities in the data set

activity <- read.table("./UCI HAR Dataset//activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[MergeLabel[, 1], 2]
MergeLabel[, 1] <- activityLabel
names(MergeLabel) <- "activity"

# Step 4. Appropriately labels the data set with descriptive variable names. 

names(MergeSubject) <- "subject"
cleanedData <- cbind(MergeSubject, MergeLabel, MergeData)
write.table(cleanedData, "first_data_set_merged.txt") # create first dataset

# Step5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

subjectLen <- length(table(MergeSubject)) 
activityLen <- dim(activity)[1] 
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
  for(j in 1:activityLen) {
    result[row, 1] <- sort(unique(MergeSubject)[, 1])[i]
    result[row, 2] <- activity[j, 2]
    bool1 <- i == cleanedData$subject
    bool2 <- activity[j, 2] == cleanedData$activity
    result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
    row <- row + 1
  }
}
head(result)
write.table(result, "second_data_set_average.txt") # creates a second, independent tidy data set
