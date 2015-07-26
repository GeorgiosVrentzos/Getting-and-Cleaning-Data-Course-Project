Getting and Cleaning Data Course Project
========================================
ReadMe
========================================

FILES 

* run_analysis.R
* Readme.md
* CodeBook.md

Instructions

* Input -> Download the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Analysis -> Run "run_analysis.R" scipt
* Output -> Having executed the script, two cleaned data sets will be prodeced and saved within the working directory.  
  * the "first_data_set_merged.txt"
  * and the "second_data_set_average.txt" which is a tidy data set with the average of each variable for each activity and each subject

Description
Run_analysis.R script does the following:
  merges data from a number of .txt files that then produces a cleaned data.


  1. It then reads all required .txt using the read.table().
  2. It merges the different data sets based on  "activity_id"'s and "subject_id"'s using the rbind().
  3. It extracts only the measurements on the mean and standard deviation for each measurement using the gsub().
  4. Appropriately labels the new data set with descriptive variable names using cbind() and write.table().
  5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject using the matrix(), as.data.frame(),sort(),col.means() and write.table().

   
