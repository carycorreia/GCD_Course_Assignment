##average_sensors_measures.txt CodeBook
========================================================

#### This is an R Markdown document that describes the output dataset that is run from the program run_analysis.R.
========================================================
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
