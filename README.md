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
  1. a - Prep the data structure 
  1. b - Download and unzip the files 
  1. c - Setup the directories, get the label files, make the labels descriptive
 
#### At the end of step 1: 
```
 - all files have been downloaded and unzipped
 - quick references to all sub-folders have been created
 - all label files have been reworked so that the names are meaningful
```
#### Steps 2a-2d - Prep the test data set:
  2.a - Read in all 3 test data files...note I renamed them to be subject, readings and activities
  2.b - Fix all columns using regex in the subject and readings tables
  2.c - Fix the activity_test table only this time we build the equivalent of a vlookup (use plyr and join)
  2.d - Assemble the final _testData_ table 
  
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
============================================================================================================
### Original README.txt- these note are take verbatim from the data files

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

 


 


