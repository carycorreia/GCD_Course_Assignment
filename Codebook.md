###average_sensors_measures.txt CodeBook
========================================================

#### Overview
This is a markdown Codebook of the final file that was created by the program run_analysis.R
The purpose of the code was to take the following inputs, and create a tidy data set from it:
  - test inputs:
```
    subject_test.txt --> test subject data on 9 of the participants
    Y_test.txt       --> activity test data...note: these are coded variables from activities 1 to 6
    X_test.txt       --> measured readings from the participants  2,947 obs across 66 measures
```
  - train inputs:
``` 
    subject_train.txt--> test subject data on 21 of the participants
    Y_train.txt      --> activity train data..note:  these are coded variable from activities 1 to 6
    X_train.txt      --> measure readings from teh participants  7,352 obs across 66 measures
```


===========================================================
#### Transformations overview
##### The subject_test file lists each participant by number:
      - no recoding was deemed necessary as we only had a number given (so data was kept as is)
      
##### The activity data (Y_test) lists the data from 1-6:
      - I opted to recode the 1-6 activity types using the matching key given in the "activities_labels.txt) file
      - I used 'ply' and 'join' to perform the equivalent of a vlookup to recode the table (lines 67-70)
      - recode file looks like:
```
      V1	V2
    1	1	WALKING
    2	2	WALKING_UPSTAIRS
    3	3	WALKING_DOWNSTAIRS
    4	4	SITTING
    5	5	STANDING
    6	6	LAYING
```
##### To make the code easier to read I decided to relabel the files in my code as follows:

```
    Y files -->activity files (activity_test and activity train)
    X files -->reading files  (readings_test and readings train)
```
##### Because the requirement was to keep only column measures on mean() and std() measures I reduced the columns: 
 - this was accomplished using grep1 and a regex filter lines 64 and 86
 - note I decided not to keep meanFreq() columns as these were not actual mean readings but frequency readings
 - the number of mean() and std() columns is only 66 which was verfied manually by reviewing the features.txt file

=================================

#### How the code works
For a detailed walk-thru of the code please consult the README.md file located in the github repository (carycorreia/GCD_Course_Assignment)

The basic program flow is as follows:
  1. Setup the computers directory structure / download data--> makes it easy to download and retrieve files
      - input label file & use regex to make the labels meaningful (see code for details)
  2. Prep the test data set
      - read in the files and give them better names:
```
        - X_test.txt becomes readings.test
        - Y_test.txt becomes activity.test
```
      - use regex to clean up names and then assign the cleaned up names to all datasets
      - use regex and grep1 to pair down the readings data so it only contains mean and std dev readings
      - note meanFreq() measures were not inputted because these are frequency (count) measures
      - Combine all data together to create a tidy data set for test data...called it testData (data frame)
  3. Prep the train data set
      - I followed the exact same methodology as laid out in step 2
      - Final file is labelled....trainData (data frame)
  4. Merge or combine the two data sets together
      - since the two files or partial datasets of the entire dataset it was just necessary to combine both sets of data
      - decided to use the merge command would work fairly easily (see code for details)
      - final file which is the tidy data set for the full file --> tidyData1 (10,299 obs across 69 variables)
```
        - note there is a "SubjectName", "ActivityType", "DataSet" & 66 other column measures in the file
        - the "DataSet" column holds a "train" or "test" flag which tells an analyst where each row of data came from
```
  5. Create the final tidy data set which gives you the average sensor readings for each subject & activity type
      - note that there are 30 subjects X 6 activities = 180 observations with 66 average readings
      - note that in this file I decided to drop the "DataSet" column which yields only 68 columns in the final dataset
      - final file is called "tidyData2 (data frame)
  6. Save the final file "tidayData2" to disk
      - the final file is called "average_sensor_measures.txt"
      - the _carycorreia\GCD_Course_Assignment repository has a copy of this output file
      - I also opted to store it as a .csv document
      - To test that the data is indeed the correct format I would suggest you open it in excel

=======================================================
#### average_sensor_measures.txt column names and descriptions 

| Variable Name                | Variable Description                                                                                       | Format  | Range              | Units          |
|------------------------------|------------------------------------------------------------------------------------------------------------|---------|--------------------|----------------|
| SubjectNumber                | The subject id's that participated in the test                                                             | Integer | 1 to 30            | test subjects  |
| ActivityType                 | Activity name that was used in each test                                                                   | factor  | Standing           | n/a            |
|                              |                                                                                                            |         | Sitting            | n/a            |
|                              |                                                                                                            |         | Laying             | n/a            |
|                              |                                                                                                            |         | Walking            | n/a            |
|                              |                                                                                                            |         | Walking_Downstairs | n/a            |
|                              |                                                                                                            |         | Walking_Upstairs   | n/a            |
| Time_BodyAcc_mean_X          | Average readings of: mean Time domain signals for body accelerometer in the X direction                    | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyAcc_mean_Y          | Average readings of: mean Time domain signals for body accelerometer in the Y direction                    | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyAcc_mean_Z          | Average readings of: mean Time domain signals for body accelerometer in the Z direction                    | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyAcc_std_X           | Average readings of: std deviation Time domain signals for body accelerometer in the X direction           | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyAcc_std_Y           | Average readings of: std deviation Time domain signals for body accelerometer in the Y direction           | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyAcc_std_Z           | Average readings of: std deviation Time domain signals for body accelerometer in the Z direction           | numeric | -1.0000 to +1.0000 | g              |
| Time_GravityAcc_mean_X       | Average readings of: mean Time domain signals for gravity accelerometer in the X direction                 | numeric | -1.0000 to +1.0000 | g              |
| Time_GravityAcc_mean_Y       | Average readings of: mean Time domain signals for gravity accelerometer in the Y direction                 | numeric | -1.0000 to +1.0000 | g              |
| Time_GravityAcc_mean_Z       | Average readings of: mean Time domain signals for gravity accelerometer in the Z direction                 | numeric | -1.0000 to +1.0000 | g              |
| Time_GravityAcc_std_X        | Average readings of: standard deviation Time domain signals for gravity accelerometer in the X direction   | numeric | -1.0000 to +1.0000 | g              |
| Time_GravityAcc_std_Y        | Average readings of: standard deviation Time domain signals for gravity accelerometer in the Y direction   | numeric | -1.0000 to +1.0000 | g              |
| Time_GravityAcc_std_Z        | Average readings of: standard deviation Time domain signals for gravity accelerometer in the Z direction   | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyAccJerk_mean_X      | Average readings of: mean Time domain signals for body accelerometer jerk in the X direction               | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyAccJerk_mean_Y      | Average readings of: mean Time domain signals for body accelerometer jerk in the Y direction               | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyAccJerk_mean_Z      | Average readings of: mean Time domain signals for body accelerometer jerk in the Z direction               | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyAccJerk_std_X       | Average readings of: standard deviation Time domain signals for body accelerometer jerk in the X direction | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyAccJerk_std_Y       | Average readings of: standard deviation Time domain signals for body accelerometer jerk in the Y direction | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyAccJerk_std_Z       | Average readings of: standard deviation Time domain signals for body accelerometer jerk in the Z direction | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyGyro_mean_X         | Average readings of: mean Time domain signals for body gyroscope in the X direction                        | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyro_mean_Y         | Average readings of: mean Time domain signals for body gyroscope in the Y direction                        | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyro_mean_Z         | Average readings of: mean Time domain signals for body gyroscope in the Zdirection                         | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyro_std_X          | Average readings of: standard deviation Time domain signals for body gyroscope in the X direction          | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyro_std_Y          | Average readings of: standard deviation Time domain signals for body gyroscope in the Y direction          | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyro_std_Z          | Average readings of: standard deviation Time domain signals for body gyroscope in the Z direction          | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyroJerk_mean_X     | Average readings of: mean Time domain signals for body gyroscope jerk in the X direction                   | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyroJerk_mean_Y     | Average readings of: mean Time domain signals for body gyroscope jerk in the Y direction                   | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyroJerk_mean_Z     | Average readings of: mean Time domain signals for body gyroscope jerk in the Z direction                   | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyroJerk_std_X      | Average readings of: standard deviation Time domain signals for body gyroscope jerk in the X direction     | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyroJerk_std_Y      | Average readings of: standard deviation Time domain signals for body gyroscope jerk in the Y direction     | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyroJerk_std_Z      | Average readings of: standard deviation Time domain signals for body gyroscope jerk in the Z direction     | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyAccMag_mean         | Average readings of: mean Time domain signals for body accelerometer magnitude                             | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyAccMag_std          | Average readings of: standard deviation Time domain signals for body accelerometer magnitude               | numeric | -1.0000 to +1.0000 | g              |
| Time_GravityAccMag_mean      | Average readings of: mean Time domain signals for gravity accelerometer magnitude                          | numeric | -1.0000 to +1.0000 | g              |
| Time_GravityAccMag_std       | Average readings of: standard deviation domain signals for gravityy accelerometer                          | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyAccJerkMag_mean     | Average readings of: meanTime domain signals for body accelerometer jerk magnitude                         | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyAccJerkMag_std      | Average readings of: standard deviation domain signals for body accelerometer jerk                         | numeric | -1.0000 to +1.0000 | g              |
| Time_BodyGyroMag_mean        | Average readings of: meanTime domain signals for body gyroscope magnitude                                  | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyroMag_std         | Average readings of: standard deviation domain signals for body gyroscope magnitude                        | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyroJerkMag_mean    | Average readings of: mean Time domain signals for body gyroscope jerk magnitude                            | numeric | -1.0000 to +1.0000 | radians/second |
| Time_BodyGyroJerkMag_std     | Average readings of: standard deviaiton domain signals for body gyroscope jerk magnitude                   | numeric | -1.0000 to +1.0000 | radians/second |
| FFT_BodyAcc_mean_X           | Average readings of: mean FFT domain signals for body accelerometer in the X direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyAcc_mean_Y           | Average readings of: mean FFT domain signals for body accelerometer in the Y direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyAcc_mean_Z           | Average readings of: mean FFT domain signals for body accelerometer in the Z direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyAcc_std_X            | Average readings of: mean FFT domain signals for body accelerometer in the X direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyAcc_std_Y            | Average readings of: mean FFT domain signals for body accelerometer in the Y direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyAcc_std_Z            | Average readings of: mean FFT domain signals for body accelerometer in the Z direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyAccJerk_mean_X       | Average readings of: mean FFT domain signals for body accelerometer in the X direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyAccJerk_mean_Y       | Average readings of: mean FFT domain signals for body accelerometer in the Y direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyAccJerk_mean_Z       | Average readings of: mean FFT domain signals for body accelerometer in the Z direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyAccJerk_std_X        | Average readings of: mean FFT domain signals for body accelerometer in the X direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyAccJerk_std_Y        | Average readings of: mean FFT domain signals for body accelerometer in the Y direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyAccJerk_std_Z        | Average readings of: mean FFT domain signals for body accelerometer in the Z direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyGyro_mean_X          | Average readings of: mean FFT domain signals for body accelerometer in the X direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyGyro_mean_Y          | Average readings of: mean FFT domain signals for body accelerometer in the Y direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyGyro_mean_Z          | Average readings of: mean FFT domain signals for body accelerometer in the Z direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyGyro_std_X           | Average readings of: mean FFT domain signals for body accelerometer in the X direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyGyro_std_Y           | Average readings of: mean FFT domain signals for body accelerometer in the Y direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyGyro_std_Z           | Average readings of: mean FFT domain signals for body accelerometer in the Z direction                     | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyAccMag_mean          | Average readings of: mean FFT domain signals for body accelerometer magnitude                              | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyAccMag_std           | Average readings of: standard deviation FFT domain signals for body accelerometer magnitude                | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyBodyAccJerkMag_mean  | Average readings of: mean FFT domain signals for body accelerometer jerk magnitude                         | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyBodyAccJerkMag_std   | Average readings of: standard deviation FFT domain signals for body accelerometer  jerk magnitude          | numeric | -1.0000 to +1.0000 | g              |
| FFT_BodyBodyGyroMag_mean     | Average readings of: mean FFT domain signals for body gyroscope magnitude                                  | numeric | -1.0000 to +1.0000 | radians/second |
| FFT_BodyBodyGyroMag_std      | Average readings of: standard deviation FFT domain signals for body gyroscope magnitude                    | numeric | -1.0000 to +1.0000 | radians/second |
| FFT_BodyBodyGyroJerkMag_mean | Average readings of: mean FFT domain signals for body gyroscope jerk magnitude                             | numeric | -1.0000 to +1.0000 | radians/second |
| FFT_BodyBodyGyroJerkMag_std  | Average readings of: standard deviation FFT domain signals for body gyroscope jerk magnitude               | numeric | -1.0000 to +1.0000 | radians/second |
=======
