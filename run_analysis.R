#############################################################################################################################
##
##   Project:            Wearable Computer Data Prep
##   Description:        This program will collect and clean a data set pertaining to wearable sensor.
##                       The goal is to prepare a tidy data set that can be used for later analysis
##  
##   Project Sponsor:    Coursera - Getting and Cleaning Data - Course Project
##   Programmer:         Cary Correia
##   Date:               June 16, 2014
##
#############################################################################################################################
##
##   Project Objectives (clipped from Course Project Description):
##      You should create one R script called run_analysis.R that does the following:
##      1. Merges the training and the test sets to create one data set.
##      2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##      3. Uses descriptive activity names to name the activities in the data set
##      4. Appropriately labels the data set with descriptive variable names. 
##      5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##
#############################################################################################################################
##
##  Program Starts here
##
##  1. a Prepare the directory structure
##  
current_dir<-getwd()                                                    ## establish the current directory
sub_dir<-'/GettingAndCleaningDataCourseProject/'                        ## names our sub directory

if (file.exists(paste(current_dir,sub_dir, sep=""))){                    ## this block of code will look for the proper directories
        setwd(paste(current_dir, sub_dir, sep=""))                      ## if the directories exist...then set the workspace there     
}  else {
        dir.create(file.path(current_dir, sub_dir))                     ## otherwise create the sub directory and...
g}
##  1. b Download and unzip the files -- note:  the file will be placed into '/UCI HAR Dataset/'
##       If you run this again you will overwrite the dataset again...

        fileUrl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"  ## set the file for download
        download.file(fileUrl, destfile='./dataset.zip', method='curl')                                     ## get the file to your computer
        unzip('dataset.zip', overwrite=TRUE)                                                                ## unzip the files
##
##  1. c Set the directories up and get the labels saved (this is used to clean and install the labels to the data)
        testDir<-paste(getwd(), '/UCI HAR Dataset/test',sep="")
        trainDir<-paste(getwd(), '/UCI HAR Dataset/train', sep="")
        baseDir<-paste(getwd(), '/UCI HAR Dataset', sep="")
##
##      read in the features and activities labels
        features_labels<-read.table(paste(baseDir,'/features.txt',sep=""), , colClasses= "character", header=FALSE)   
        activities_labels<-read.table(paste(baseDir,'/activity_labels.txt',sep=""), colClasses="character", header=FALSE)  
##
        features_labels[,2]<-as.character(gsub("^t", "Time_", features_labels[,2]))       ## fix the labels so the headers become readable- t turns into Time
        features_labels[,2]<-as.character(gsub("^f", "FFT_", features_labels[,2]))        ## fix the labels so the headers become readable- f turns into FFT
        features_labels[,2]<-as.character(gsub("-", "_", features_labels[,2]))            ## fix the labels so the headers become readable- - turns into undescores
        features_labels[,2]<-as.character(gsub("[/(|/)]", "", features_labels[,2]))       ## fix the labels so the headers become readable- (or) turns into "no charaters"
##
##  2.a  Prep the test data set
        subject_test<-read.table(paste(testDir,"/subject_test.txt",sep=""), header=FALSE) ## read in subject's test file
        readings_test<-read.table(paste(testDir,"/X_test.txt",sep=""), header=FALSE)      ## read in the X-test aka the reading test file
        activity_test<-read.table(paste(testDir,"/Y_test.txt",sep=""), header=FALSE)      ## read in the Y-test aka the activity test file
##
##  2.b Fix each data set so the columns have meaningful names
        names(readings_test)<-c(features_labels[,2])                                      ## place the features_labels to our readings table
        names(subject_test) <-c("SubjectNumber")                                          ## place the SubjectNumber header to the subject table
        keep<-grepl("mean(_[XYZ])?$|std(_[XYZ])?$", features_labels$V2, perl=TRUE)        ## pair down the readings_test data so we only have means and std devs
        readings_test<-readings_test[,c(keep)]        
##
##  2.c Fix the activity_test column so that the data is more meaningful
library(plyr)
        act_fix<-join(activity_test, activities_labels, by="V1")                          ## copy the activities_test table but add in the activity label
        names(act_fix)<-c('ActivityNo', 'ActivityType')
##
##  2.d add in the subject, activity and readings table
        typeCol<-rep('test', nrow(readings_test))                                         ## create a column to let us know that this data came from the test set
        testData<-cbind(subject_test, act_fix$ActivityType, typeCol)                      ## combining subject, activityType and the dataType columns together
        names(testData)<-c("SubjectNumber", "ActivityType", "DataSet")                    ## rename them to something meaningful
        testData<-cbind(testData, readings_test)                                          ## test Data complete.....just need to remove all non mean or std dev columns
##
##  3.a Prep the train data set
        subject_train<-read.table(paste(trainDir,"/subject_train.txt",sep=""), header=FALSE) ## read in subject's test file
        readings_train<-read.table(paste(trainDir,"/X_train.txt",sep=""), header=FALSE)      ## read in the X-test or reading test file
        activity_train<-read.table(paste(trainDir,"/Y_train.txt",sep=""), header=FALSE)      ## read in the Y-test or activity test file
##
##  3.b Fix each data set so the columns have meaningful names
        names(readings_train)<-c(features_labels[,2])                                      ## place the features_labels to our readings table
        names(subject_train) <-c("SubjectNumber")                                          ## place the SubjectNumber header to the subject table
        keep<-grepl("mean(_[XYZ])?$|std(_[XYZ])?$", features_labels$V2, perl=TRUE)         ## pair down the readings_test data so we only have means and std devs
        readings_train<-readings_train[,c(keep)]    
##
##  3.c Fix the activity_test column so that the data is more meaningful
library(plyr)
        act_fix<-join(activity_train, activities_labels, by="V1")                         ## copy the activities_test table but add in the activity label
        names(act_fix)<-c('ActivityNo', 'ActivityType')
##
##  3.d add in the subject, activity and readings table
        typeCol<-rep('train', nrow(readings_train))                                       ## create a column to let us know that this data came from the test set
        trainData<-cbind(subject_train, act_fix$ActivityType, typeCol)                    ## combining subject, activityType and the dataType columns together
        names(trainData)<-c("SubjectNumber", "ActivityType", "DataSet")                   ## rename them to something meaningful
        trainData<-cbind(trainData, readings_train)                                       ## test Data complete.....just need to remove all non mean or std dev columns
##
##  4.  merge the two data sets together
        tidyData1<-merge(x=testData, y=trainData, all=TRUE)
##
##  5.  create tidyData2:  matrix with 30 participants X 6 activities= 180 rows and 66 averages for each measurement column
library(reshape)
        tidyMelt<-melt(tidyData1, id=c("SubjectNumber", "ActivityType"), measure.vars=colnames(tidyData1[4:69]))
        tidyData2<-dcast(tidyMelt, SubjectNumber*ActivityType~variable, mean) 
##
## 6.   save tidayData2 for submittal with a meaningful name
        write.table(tidyData2, file="average_sensor_measures.txt", row.names=FALSE)
##
## End of Program



