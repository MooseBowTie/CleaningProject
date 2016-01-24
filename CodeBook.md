# CodeBook
MooseBowTie  
January 24, 2016  





### Study design

## Data Collection

Experiments were carried out with a group of 30 volunteers, 19-48 years of age. 

Each person performed six activities: 

1. walking

2. walking up stairs

3. walking down stairs

4. sitting

5. standing

6. laying


They did this while wearing a smartphone (Samsung Galaxy S II) on their waist. Using its accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. 

The experiments were video-recorded, and the data were labelled manually.



## Preprocessing

According to the README file that came with the origonal dataset, the data were preprocessed as follows:

"The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."



## Additional processing

For this project, the test and training sets were merged. This produced a table with 10299 rows of data and 68 columns. Each row contained 66 values obtained from smartphone data, a subjectID, and the activity the subject was perfoming at the time the measurement was taken.

Then the mean and std variables were extracted. After that, all the measurements for each variable with the same subject and activity were averaged. The code for this can be found in the "run_analysis.R" file.

The result is a table with: 

180 rows (30 subjects * 6 activities each) plus the variable names

66 columns (one for each variable that was selected) plus the row names






### Code book

This section describes the meaning of each variable.
An XYZ after the variable name indicates there are three variables of that type, one for each axis.

## subjectActivities
This column indicates which subject and activity the rest of the row pertains to.
It takes the form : "subx_activity"
"x" will be replaced by the subject number, and "activity" will be replaced by one of the 6 activities.

## tBodyAccMean XYZ
This is the average of the body linear acceleration means.
Units: meters per second squared (m/s^2)

## tBodyACCStandardDev XYZ
This is the average of the body linear acceleration standard deviations.
Units: meters per second squared (m/s^2)

## tGravityAccMean XYZ
This is the average of the gravity acceleration means.
Units: meters per second squared (m/s^2)

## tGravityAccStandardDev XYZ
This is the average of the gravity acceleration standard deviations.
Units: meters per second squared (m/s^2)

## tBodyAccJerkMean XYZ
This is the average of the body linear jerk means.
Units: meters per second cubed (m/s^3)

## tBodyAccJerkStandardDev XYZ
This is the average of the body linear jerk standard deviations.
Units: meters per second cubed (m/s^3)

## tBodyGyroMean XYZ
This is the average of the derivatives of the angular velocity means.
Units: radians per second squared (rad/s^2)

## tBodyGyroStandardDev XYZ
This is the average of the derivatives of the angular velocity standard deviations.
Units: radians per second squared (rad/s^2)

## tBodyGyroJerkMean XYZ
This is the average of the derivatives of the angular acceleration means.
Units: radians per second cubed (rad/s^3)

## tBodyGyroJerkStandardDev XYZ
This is the average of the derivatives of the angular acceleration standard deviations.
Units: radians per second cubed (rad/s^3)

## tBodyAccMagMean
This is the average of the acceleration magnitude means.
Units: meters per second squared (m/s^2)

## tBodyAccMagStandardDev
This is the average of the acceleration magnitude standard deviations.
Units: meters per second squared (m/s^2)

## tGravityAccMagMean
This is the average of the gravity acceleration magnitude means.
Units: meters per second squared (m/s^2)

## tGravityAccMagStandardDev
This is the average of the gravity acceleration magnitude standard deviations.
Units: meters per second squared (m/s^2)

## tBodyAccJerkMagMean
This is the average of the body linear jerk magnitude means.
Units: meters per second cubed (m/s^3)

## tBodyAccJerkMagStandardDev
This is the average of the body linear jerk magnitude standard deviations.
Units: meters per second cubed (m/s^3)

## tBodyGyroMagMean
This is the average of the derivatives of the angular velocity magnitude means.
Units: radians per second squared (rad/s^2)

## tBodyGyroMagStandardDev
This is the average of the derivatives of the angular velocity magnitude standard deviations.
Units: radians per second squared (rad/s^2)

## tBodyGyroJerkMagMean
This is the average of the derivatives of the angular acceleration magnitude means.
Units: radians per second cubed (rad/s^3)

## tBodyGyroJerkMagStandardDev
This is the average of the derivatives of the angular acceleration magnitude standard deviations.
Units: radians per second cubed (rad/s^3)

## fBodyAccMean XYZ
This is the average of the fast fourier transforms of the body linear acceleration means.
Units: meters per second (m/s)

## fBodyAccStandardDev XYZ
This is the average of the fast fourier transforms of the body linear acceleration standard deviations.
Units: meters per second (m/s)

## fBodyAccJerkMean XYZ
This is the average of the fast fourier transforms of the body linear jerk means.
Units: meters per second squared (m/s^2)

## fBodyAccJerkStandardDev XYZ
This is the average of the fast fourier transforms of the body linear jerk standard deviations.
Units: meters per second squared (m/s^2)

## fBodyGyroMean XYZ
This is the average of the fast fourier transforms of the derivatives of the angular velocity means.
Units: radians per second (rad/s)

## fBodyGyroStandardDev XYZ
This is the average of the fast fourier transforms of the derivatives of the angular velocity standard deviations.
Units: radians per second (rad/s)

## fBodyAccMagMean
This is the average of the fast fourier transforms of the acceleration magnitude means.
Units: meters per second (m/s)

## fBodyAccMagStandardDev
This is the average of the fast fourier transforms of the acceleration magnitude standard deviations.
Units: meters per second (m/s)

## fBodyAccJerkMagMean
This is the average of the fast fourier transforms of the body linear jerk magnitude means.
Units: meters per second squared (m/s^2)

## fBodyAccJerkMagStandardDev
This is the average of the fast fourier transforms of the body linear jerk magnitude standard deviations.
Units: meters per second squared (m/s^2)

## fBodyGyroMagMean
This is the average of the fast fourier transforms of the derivatives of the angular velocity magnitude means.
Units: radians per second (rad/s)

## fBodyGyroMagStandardDev
This is the average of the fast fourier transforms of the derivatives of the angular velocity magnitude standard deviations.
Units: radians per second (rad/s)

## fBodyGyroJerkMagMean
This is the average of the fast fourier transforms of the derivatives of the angular acceleration magnitude means.
Units: radians per second squared (rad/s^2)

## fBodyGyroJerkMagStandardDev
This is the average of the fast fourier transforms of the derivatives of the angular acceleration magnitude standard deviations.
Units: radians per second squared (rad/s^2)


