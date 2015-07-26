Getting and Cleaning Data Course Project CodeBook
=================================================
Code Book
=================================================
This code book describes the variables, the data, and any transformations or work that you performed to clean up the data

Data Set Information:
=================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Purpose 
=================================================
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare a tidy data set following the below steps.  

* Download the data set from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Unzip the data set into my chosen working directory
* Loade test and training data sets into data frames
* Loade source variable names for test and training data sets
* Loade activity labels
* Merge test and training data frames using rbind
* Paired down the data frames to only include the mean and standard deviation variables
* Replace activity IDs with the activity labels for readability
* Produce one data frame containing the subjects, measurements and activities
* Produce "first_data_set_merged.txt" with the combined data frame 
* Created another data set using the data.table library to easily group the tidy data by subject and activity
* Apply the mean and standard deviation calculations across the groups
* Produce "second_data_set_average.txt" as the second expected output

Please refer to run_analysis.R for implementation details.

Variables
=================================================
    tBodyAcc
    tGravityAcc
    tBodyAccJerk
    tBodyGyro
    tBodyGyroJerk
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag
    fBodyAcc
    fBodyAccJerk
    fBodyGyro
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag
