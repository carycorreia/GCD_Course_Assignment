##GCD_Course_Assignment
=====================
### Introduction:
This repository houses the programming assignment for Coursera's Getting and Cleaning Data course project.
The repository has the following items enclosed:
 1.  readme.md                   ---> this file 
 2.  run_analysis.R              ---> an R program that performs the getting and cleaning of some data 
 3.  Codebook.md                 ---> a Codebook which describes the output data set's field names in details
 4.  average_sensor_measures.csv ---> a tidy data set as described in item 6 below (csv format)
 5.  average_sensor_measures.txt ---> a tidy data set as described in item 6 below (txt format)
     
### Overview:
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### The following are the objectives of the course project:
 1. create one R script that does the follow
 2. Merges the training and the test sets to create one data set.
 3. Extracts only the measurements on the mean and standard deviation for each measurement. 
 4. Uses descriptive activity names to name the activities in the data set
 5. Appropriately labels the data set with descriptive variable names. 
 6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


### Please note that these objectives are NOT the exact steps that were followed in creating the work flow for this project. 
### Please see the section regarding Code Walk-Through for the psuedo-code used.


The data used in this project is linked here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


### Setting up the code
The R code was designed on a Mac computer using OSX 10.93 with R v3.1 installed
The program will take your base directory (this is the default working directory on your computer) and then look for or go to a directory called "/GettingAndCleaningDataCourseProject/"...to make this work on a windows machine you will have to substitue "\GettingAndCleaningDataCourseProject\".

I prefer to keep this new directory tied to my baseline directory which is equivalent to this "/Users/carycorreia"

To do this setup just type this into your R session and substiture your account_name to "yourName".  See the example  below: (_note:  if your using a windows machine simply substitute the "/" for a "\"_)

 _setwd("/Users/yourName")_

### Pseudo-Code and Walk-thru
The project objectives are all achieved but my code works through the objectives in a different order.
Please note:  the project objectives makes no mention that your code has to achieve the objectives in a specific order.

### Program pseudo-code:
  1. Prepare the directory structure
  2. Prep the test data set
  3. Prep the train data set
  4. Merge the two data sets together
  5. Create the average_measures dataset
  6. Write the final file to disk

### Detailed walk thru
#### Steps 1a-1c - Prepare the directory structures:

  1a - Prep the data structure 
  
  1b - Download and unzip the files 
  
  1c - Setup the directories, get the label files, make the labels descriptive 
 
 #### At the end of step 1:
```
 - all files have been downloaded and unzipped
 - quick references to all sub-folders have been created
 - all label files have been reworked so that the names are meaningful
```
#### Steps 2a-2d - Prep the test data set: 

  2a - Read in all 3 test data files...note I renamed them to be subject, readings and activities
  
  2b - Fix all columns using regex in the subject and readings tables
  
  2c - Fix the activity_test table only this time we build the equivalent of a vlookup (use plyr and join)
  
  2d - Assemble the final _testData_ table 
  
#### At the end of step 2:
```
- we have a complete and tidy version of the testing data
- testData: 2,947 rows 69 variables
```
#### Steps 3a-3d - this is an exact duplicate of steps 2
   -only now we do it for the _train_ dataset
#### At the end of step 3:
```
- we have a complete and tidy version of the training data
- trainData: 7,352 rows 69 variables
- note:  there is a _SubjectName_ field, an _ActivityType_ field and a _DataSet_ field
         there are an additional 66 fields that represent mean or std dev measurements
         I did not include meanFreq() measures as these are not actual means but counts of means 
```

#### Step 4- Merge the two datasets together
  - the two files are then merged together
  - note I decided to use the merge command to just stack the two datasets on top of each other 

####At the end of step 4:
```
- we have a complete and tidy version of both datasets added together
- tidyData1: 10,299 rows 69 variables
```

#### Step 5 - Create the average_measures dataset
  - for each Subject and Activity the average of each reading was created
  - I opted to use the _reshape_ package to first melt then dcast the data into the final table

####At the end of step 5:
```
-dataset for the average of the readings for each subject and activity type
- tidyData2: 180 rows 68 variables
- note:  there exactly 180 rows which corresponds to our 30 test subjects with 6 activities
         there are now exaclty 68 rows because I decided to drop the _DataSet_ column
```
#### Step 6 - Write the table to a file on the computer
  - simple write.table command to save the file as a txt file was performed

#### At the end of step 6:
```
- a "average_sensor_measures.txt" file is saved to the computer
```
 


 


