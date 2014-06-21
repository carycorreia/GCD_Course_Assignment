GCD_Course_Assignment
=====================
### Introduction:
This repository houses the programming assingment for Coursera's Getting and Cleaning Data.
The repository has the following items:
 1.  readme.md       ---> this file 
 2.  run_analysis.R  ---> an R program that performs the getting and cleaning of some data 
 3.  codebook        ---> 
 4.  data        ---> 
     
### Overview:
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The following are the objectives of the course project:
 1. create one R script that does the follow-
 2. Merges the training and the test sets to create one data set.
 3. Extracts only the measurements on the mean and standard deviation for each measurement. 
 4. Uses descriptive activity names to name the activities in the data set
 5. Appropriately labels the data set with descriptive variable names. 
 6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Please note that these objectives are NOT the exact steps that were followed in creating the work flow for this project.  Please see the section regarding Code Walk-Through for the psuedo-code used.

The data used in this project is linked here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Setting up the code
The R code was designed on a Mac computer using OSX 10.93 with R v3.1 installed
The program will take your base directory (this is the default working directory on your computer) and then look for or go to a directory called "/GettingAndCleaningDataCourseProject/"

I prefer to keep this new directory tied to my baseline directory which is equivalent to this "/Users/carycorreia"
To do this setup just type this into your R session and substiture your account_name to "yourName".  See the example  below:

 _setwd("/Users/yourName")_

### Pseudo-Code and Walk-thru
The project objectives are all achieved but my code works through the objectives in a different order.
Please note:  the project objectives makes no mention that your code has to achieve the objectives in a specific order.

## Program pseudo-code:
  1. Prepare the directory structure
  2. Prep the test data set
  3. Prep the train data set
  4. Merge the two data sets together
  5. Create the average_measures dataset
  6. Write the final file to disk
 


 


