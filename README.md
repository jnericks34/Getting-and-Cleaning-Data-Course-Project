# Getting and Cleaning Data Course Project
## Background Information:


### **Information on the dataset**:

\"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.\"   

\"For each record it is provided:
  - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
  - Triaxial Angular velocity from the gyroscope. 
  - A 561-feature vector with time and frequency domain variables. 
  - Its activity label. 
  - An identifier of the subject who carried out the experiment.

**The dataset includes the following files:**

  - README.txt
  - features_info.txt: Shows information about the variables used on the feature vector.
  - features.txt: List of all features.
  - activity_labels.txt: Links the class labels with their activity name.
  - train/X_train.txt: Training set.
  - train/y_train.txt: Training labels.
  - test/X_test.txt: Test set.
  - test/y_test.txt: Test labels.

**The following files are available for the train and test data. Their descriptions are equivalent.** 

  - train/subject_train.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
  - train/Inertial Signals/total_acc_x_train.txt: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'.  
    Every row shows a 128 element vector. The same description applies for the total_acc_x_train.txt and total_acc_z_train.txt files for the Y and Z         axis. 
  - train/Inertial Signals/body_acc_x_train.txt: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
  - train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are               radians/second. \"

\"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

**These signals were used to estimate variables of the feature vector for each pattern:**  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

  - tBodyAcc-XYZ
  - tGravityAcc-XYZ
  - tBodyAccJerk-XYZ
  - tBodyGyro-XYZ
  - tBodyGyroJerk-XYZ
  - tBodyAccMag
  - tGravityAccMag
  - tBodyAccJerkMag
  - tBodyGyroMag
  - tBodyGyroJerkMag
  - fBodyAcc-XYZ
  - fBodyAccJerk-XYZ
  - fBodyGyro-XYZ
  - fBodyAccMag
  - fBodyAccJerkMag
  - fBodyGyroMag
  - fBodyGyroJerkMag

**The set of variables that were estimated from these signals are:**

  - mean(): Mean value
  - std(): Standard deviation
  - mad(): Median absolute deviation 
  - max(): Largest value in array
  - min(): Smallest value in array
  - sma(): Signal magnitude area
  - energy(): Energy measure. Sum of the squares divided by the number of values. 
  - iqr(): Interquartile range 
  - entropy(): Signal entropy
  - arCoeff(): Autorregresion coefficients with Burg order equal to 4
  - correlation(): correlation coefficient between two signals
  - maxInds(): index of the frequency component with largest magnitude
  - meanFreq(): Weighted average of the frequency components to obtain a mean frequency
  - skewness(): skewness of the frequency domain signal 
  - kurtosis(): kurtosis of the frequency domain signal 
  - bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
  - angle(): Angle between to vectors.

**Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:**

  - gravityMean
  - tBodyAccMean
  - tBodyAccJerkMean
  - tBodyGyroMean
  - tBodyGyroJerkMean\"


**The full dataset can be download from the following site:**

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


**Reference and copied from:**

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.  
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012   



### **Getting and Cleaning Data Coursera course:**

The final project of the Getting and Cleaning data course uses a portion of the orginal dataset. 

**The course site is listed below:**

https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project

The goal of this project is to create a summarized report. The report will include 66 out of the total 561 features captured. These features were classified as either being a mean or a standard deviation. These features are listed below:

  - tBodyAcc-mean()-X
  - tBodyGyro-mean()-X
  - tBodyGyro-mean()-Y
  - tBodyGyro-mean()-Z
  - tBodyGyro-std()-X
  - tBodyGyro-std()-Y
  - tBodyGyro-std()-Z
  - tBodyGyroJerk-mean()-X
  - tBodyGyroJerk-mean()-Y
  - tBodyGyroJerk-mean()-Z
  - tBodyGyroJerk-std()-X
  - tBodyGyroJerk-std()-Y
  - tBodyGyroJerk-std()-Z
  - tBodyAcc-mean()-Y
  - tBodyAccMag-mean()
  - tBodyAccMag-std()
  - tGravityAccMag-mean()
  - tGravityAccMag-std()
  - tBodyAccJerkMag-mean()
  - tBodyAccJerkMag-std()
  - tBodyGyroMag-mean()
  - tBodyGyroMag-std()
  - tBodyGyroJerkMag-mean()
  - tBodyGyroJerkMag-std()
  - fBodyAcc-mean()-X
  - fBodyAcc-mean()-Y
  - fBodyAcc-mean()-Z
  - fBodyAcc-std()-X
  - fBodyAcc-std()-Y
  - fBodyAcc-std()-Z
  - tBodyAcc-mean()-Z
  - fBodyAccJerk-mean()-X
  - fBodyAccJerk-mean()-Y
  - fBodyAccJerk-mean()-Z
  - fBodyAccJerk-std()-X
  - fBodyAccJerk-std()-Y
  - fBodyAccJerk-std()-Z
  - tBodyAcc-std()-X
  - tGravityAcc-mean()-X
  - tGravityAcc-mean()-Y
  - fBodyGyro-mean()-X
  - fBodyGyro-mean()-Y
  - fBodyGyro-mean()-Z
  - fBodyGyro-std()-X
  - fBodyGyro-std()-Y
  - fBodyGyro-std()-Z
  - tGravityAcc-mean()-Z
  - tGravityAcc-std()-X
  - tGravityAcc-std()-Y
  - tGravityAcc-std()-Z
  - tBodyAcc-std()-Y
  - fBodyAccMag-mean()
  - fBodyAccMag-std()
  - fBodyBodyAccJerkMag-mean()
  - fBodyBodyAccJerkMag-std()
  - fBodyBodyGyroMag-mean()
  - fBodyBodyGyroMag-std()
  - fBodyBodyGyroJerkMag-mean()
  - fBodyBodyGyroJerkMag-std()
  - tBodyAcc-std()-Z
  - tBodyAccJerk-mean()-X
  - tBodyAccJerk-mean()-Y
  - tBodyAccJerk-mean()-Z
  - tBodyAccJerk-std()-X
  - tBodyAccJerk-std()-Y
  - tBodyAccJerk-std()-Z

These features were captured multiple times for 30 subjects in performing 6 diffent activities. The tidy dataset provided in this repository is the mean of all 66 features grouped by subject by activity creating a data table of 180 rows by 68 collumns.   

## File Description:
#### Only the following files will be used:  
**1. activity_labels.txt** - contains the names of the activities.  
      - There are 6 activities   
**2. features.txt** - contains the names of the features captured.  
      - There are 651 features captured.  
**3. subject_test.txt** - the test subjects maps the y_test data  
      - There are 10 test subjects  
**4. X_test.txt** - multiple test feature measurements for the 10 subjects     
**5. y_test.txt** - the test subjects rows .. need to add this column to the data  
**6. subject_train.txt** - the training data subjects maps the y_train data  
      - There are 20 training subjects  
**7. X_train.txt** - multiple training feature measurements for the 20 subjects    
**8. y_train.txt** - the train subjects .. need to add this column to the data    

## Algorithm Recipe:

### Goal:
The goal of this project is to create a tidy dataset that will contain the average values of 30 subjects across 6 different activities for only the features that are classified as mean or standard deviation values. This dataset needs to be properly labeled. 


## Requirements and Code:

This code is a R script. The additional packages required for running this code are dplyr and knitr.

**This code was ran with the following conditions:**

  - R version 3.5.1 (2018-07-02)
  - Platform: x86_64-w64-mingw32/x64 (64-bit)
  - Running under: Windows >= 8 x64 (build 9200)
  - knitr_1.20   
  - dplyr_0.7.7
