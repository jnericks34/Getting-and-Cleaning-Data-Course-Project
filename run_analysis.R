library(dplyr)
library(knitr)
# Get the current working directory to know where you are
getwd()

# If the data sub directory does not exist, create it now
if(!file.exists("./data")){dir.create("./data")}

# set the working directory
setwd("./data")

# Create a variable that points to the dataset that we need to download 
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#download the dataset and call the file dataset.zip
download.file(fileUrl,destfile="./dataset.zip")

#unzip the dataset file
unzip(zipfile="./dataset.zip")

# listing the files
files<-list.files(getwd(), recursive=TRUE)

#files
# [1] "dataset.zip"                                                 
# [2] "UCI HAR Dataset/activity_labels.txt"                         
# [3] "UCI HAR Dataset/features.txt"                                
# [4] "UCI HAR Dataset/features_info.txt"                           
# [5] "UCI HAR Dataset/README.txt"                                  
# [6] "UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"   
# [7] "UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"   
# [8] "UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"   
# [9] "UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt"  
#[10] "UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt"  
#[11] "UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"  
#[12] "UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt"  
#[13] "UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt"  
#[14] "UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt"  
#[15] "UCI HAR Dataset/test/subject_test.txt"                       
#[16] "UCI HAR Dataset/test/X_test.txt"                             
#[17] "UCI HAR Dataset/test/y_test.txt"                             
#[18] "UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt" 
#[19] "UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt" 
#[20] "UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt" 
#[21] "UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"
#[22] "UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"
#[23] "UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"
#[24] "UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"
#[25] "UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt"
#[26] "UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt"
#[27] "UCI HAR Dataset/train/subject_train.txt"                     
#[28] "UCI HAR Dataset/train/X_train.txt"                           
#[29] "UCI HAR Dataset/train/y_train.txt" 

# There are 8 main files that we need. 
# 1,2 y_(test/train).txt files contain the activity ids.
# 3 activity_labels.txt file maps the activity ID to what the activity is 
#     1 WALKING
#     2 WALKING_UPSTAIRS
#     3 WALKING_DOWNSTAIRS
#     4 SITTING
#     5 STANDING
#     6 LAYING 
# 4, 5 subject_(test/train).txt files contain the different subject identifiers. 
# 6, 7 X_(test/train).txt files contains the values captured. There are 561 different
# variables in this dataset. The names of the variables can be found in the 
# features.txt file. 
# 8 features.txt file contains the column headings for the X_test/train dataset. These
# are all of the measurements being made and represent the 651 variables.



# read the activity labels into R.
activities <- read.table("./UCI HAR Dataset/activity_labels.txt") 

# read in the 561 feature labels into R
features <- read.table("./UCI HAR Dataset/features.txt") 

# read the test data into R
testYdata <- read.table("./UCI HAR Dataset/test/y_test.txt")
testXdata <- read.table("./UCI HAR Dataset/test/X_test.txt")
testSubjectdata <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#read the training data into R
trainYdata <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainXdata <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainSubjectdata <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#quick check on the dimensions of the data
# just to make sure the column numbers are 
# the same for the data
dim(testXdata)
#[1] 2947  561
dim(trainXdata)
#[1] 7352  561

# quick check to make sure the row counts are the same 
# for the respective X data set.
dim(testYdata)
#[1] 2947    1
dim(trainYdata)
#[1] 7352    1

dim(testSubjectdata)
#[1] 2947    1 
dim(trainSubjectdata)
#[1] 7352    1



# Now we are combining the test and training data
xcombine <- rbind(testXdata,trainXdata)
ycombine <- rbind(testYdata,trainYdata)
subjectcombine <- rbind(testSubjectdata,trainSubjectdata)



# Adding the column headings (features) to the measurement file.
names(xcombine)<- features$V2

# Now we only want to keep the measurements that are labelled
# either *mean() or *std() per the assignment request.
keepfeatures <- grep("-mean\\(\\)|-std\\(\\)", features$V2) 
xselected <-  xcombine[, keepfeatures]


# Adding the activity label
names(ycombine) <- c("activity")
# Adding the subject label
names(subjectcombine) <- c("subject")


# Creating the first complete dataset
Data <- cbind(subjectcombine,ycombine,xselected)

# Cleaning up the labels  ...
# removes the -, the (, and the ) character from the label
names(Data) <- gsub("\\-|\\(|\\)","", names(Data))
# substitutes the beginning t with time
names(Data) <- gsub("^t","time", names(Data))
# substitutes the beginning f with frequency
names(Data) <- gsub("^f","frequency", names(Data))
# substitutes Acc with accelerometer
names(Data)<-gsub("Acc", "accelerometer", names(Data))
# substitutes Gyro with gyroscope
names(Data)<-gsub("Gyro", "gyroscope", names(Data))
# substitutes Mag with magnitude
names(Data)<-gsub("Mag", "magnitude", names(Data))
# substitutes BodyBody with just body
names(Data)<-gsub("BodyBody", "body", names(Data))
# converts all letters to lower case
names(Data)<-tolower(names(Data))


# Now we will change the activity numbers to the proper labels.
# The second column of the will be changed to the 2 column of the 
# activities dataset if the Data[,2] == activities[,1]
Data[, 2] <- activities[Data[,2], 2]

# We also want to change the subject from a number class to a factor
Data[, 1] <- as.factor(Data[,1])

# Checking to see if we have it correctly ...
#str(Data)
#'data.frame':	10299 obs. of  68 variables:
# $ subject                                    : Factor w/ 30 levels "1","2","3","4",..: 2 2 2 2 2 2 2 2 2 2 ...
# $ activity                                   : Factor w/ 6 levels "LAYING","SITTING",..: 3 3 3 3 3 3 3 3 3 3 ...
# $ timebodyaccelerometermeanx                 : num  0.257 0.286 0.275 0.27 0.275 ...
# $ timebodyaccelerometermeany                 : num  -0.0233 -0.0132 -0.0261 -0.0326 -0.0278 ...
# $ timebodyaccelerometermeanz                 : num  -0.0147 -0.1191 -0.1182 -0.1175 -0.1295 ...
# $ timebodyaccelerometerstdx                  : num  -0.938 -0.975 -0.994 -0.995 -0.994 ...
# $ timebodyaccelerometerstdy                  : num  -0.92 -0.967 -0.97 -0.973 -0.967 ...
# $ timebodyaccelerometerstdz                  : num  -0.668 -0.945 -0.963 -0.967 -0.978 ...
#...


# Creating the independent tidy data set with the average 
# of each variable for each activity and each subject. 
tidyData <- group_by(Data,activity,subject)

# Taking the mean of the dataset
meantidyData <- summarize_all(tidyData, mean, na.rm=TRUE)

# Exporting the tidy dataset to a file
write.table(meantidyData, "fitness_tidy_dataset.txt", row.names = FALSE)
