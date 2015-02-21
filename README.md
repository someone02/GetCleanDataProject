# Project Submission - Getting and Cleaning Data

## Running the script

The main function to be used is `run_analysis`, which takes in one parameter, the path to the dataset. For example,

```R
df <- run_analysis("UCI HAR Dataset")
```

This returns a data frame of the form

| subject | activityLabel | ... |

where `subject` is the subject id, `activityLabel` is the activity description
and the subsequent columns contain the average mean/std feature over the
specific 'subject' and 'activityLabel'.

## About the script

The script runs the steps indicated in the requirements in the following main steps:

- Reads in the subject, feature and activity files for each of training and test data sets and column binds them. At the same time, update the variable names with the appropriate names from the `features.txt` file.
- Row bind the test and training data sets to combine the data sets.
- Select variable names that contains either the ".mean." or ".std." in them to extract only the mean and standard deviation for each measurement, as well as keep the subject and activity numeric labels.
- Perform a join with the activities.txt file to use descriptive activity names.
- Group the above data set by subject and activityLabel, and then summarise each of the remaining columns using the mean function.

## Codebook

The codebook is described below:

- **subject** : Subject ID
- **activityLabel** : Activity Description

The remaining columns are the average of the respective features for each `subject` and `activityLabel`

- **tBodyAcc.mean...XYZ**: Mean of Body acceleration signals in X/Y/Z directions
- **tGravityAcc.mean...XYZ**: Mean of Gravity acceleration signals in X/Y/Z directions
- **tBodyAccJerk.mean...XYZ**: Mean of Body linear acceleration jerk signals in X/Y/Z directions
- **tBodyGyro.mean...XYZ**: Mean of Body angular velocity signals in X/Y/Z directions
- **tBodyGyroJerk.mean...XYZ**: Mean of Body angular velocity jerk signals in X/Y/Z directions
- **tBodyAccMag.mean..**: Mean of Euclidean magnitude of Body acceleration signals
- **tGravityAccMag.mean..**: Mean of Euclidean magniture of Gravity acceleration signals
- **tBodyAccJerkMag.mean..**: Mean of Euclidean magniture of Body linear acceleration jerk signals
- **tBodyGyroMag.mean..**: Mean of Euclidean magnitude of Body angular velocity signals
- **tBodyGyroJerkMag.mean..**: Mean of Euclidean magnitude of Body angular velocity jerk signals
- **fBodyAcc.mean...XYZ**: Mean of FFT of Body acceleration signals in X/Y/Z directions
- **fBodyAccJerk.mean...XYZ**: Mean of FFT of Body linear acceleration jerk signals in X/Y/Z directions
- **fBodyGyro.mean...XYZ**: Mean of FFT of Body angular velocity signals in X/Y/Z directions
- **fBodyAccMag.mean..**: Mean of FFT of Euclidean magnitude of Body acceleration signals
- **fBodyBodyAccJerkMag.mean..**: Mean of FFT of Euclidean magniture of Body linear acceleration jerk signals
- **fBodyBodyGyroMag.mean..**: Mean of FFT of Euclidean magnitude of Body angular velocity signals
- **fBodyBodyGyroJerkMag.mean..**: Mean of FFT of Euclidean magnitude of Body angular velocity jerk signals
- **tBodyAcc.std...XYZ**: Standard Deviation of Body acceleration signals in X/Y/Z directions
- **tGravityAcc.std...XYZ**: Standard Deviation of Gravity acceleration signals in X/Y/Z directions
- **tBodyAccJerk.std...XYZ**: Standard Deviation of Body linear acceleration jerk signals in X/Y/Z directions
- **tBodyGyro.std...XYZ**: Standard Deviation of Body angular velocity signals in X/Y/Z directions
- **tBodyGyroJerk.std...XYZ**: Standard Deviation of Body angular velocity jerk signals in X/Y/Z directions
- **tBodyAccMag.std..**: Standard Deviation of Euclidean magnitude of Body acceleration signals
- **tGravityAccMag.std..**: Standard Deviation of Euclidean magniture of Gravity acceleration signals
- **tBodyAccJerkMag.std..**: Standard Deviation of Euclidean magniture of Body linear acceleration jerk signals
- **tBodyGyroMag.std..**: Standard Deviation of Euclidean magnitude of Body angular velocity signals
- **tBodyGyroJerkMag.std..**: Standard Deviation of Euclidean magnitude of Body angular velocity jerk signals
- **fBodyAcc.std...XYZ**: Standard Deviation of FFT of Body acceleration signals in X/Y/Z directions
- **fBodyAccJerk.std...XYZ**: Standard Deviation of FFT of Body linear acceleration jerk signals in X/Y/Z directions
- **fBodyGyro.std...XYZ**: Standard Deviation of FFT of Body angular velocity signals in X/Y/Z directions
- **fBodyAccMag.std..**: Standard Deviation of FFT of Euclidean magnitude of Body acceleration signals
- **fBodyBodyAccJerkMag.std..**: Standard Deviation of FFT of Euclidean magniture of Body linear acceleration jerk signals
- **fBodyBodyGyroMag.std..**: Standard Deviation of FFT of Euclidean magnitude of Body angular velocity signals
- **fBodyBodyGyroJerkMag.std..**: Standard Deviation of FFT of Euclidean magnitude of Body angular velocity jerk signals

