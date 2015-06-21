Code Book

Process of the "run_analysis.R" Script:

1) The script loads in the features data, which is described as the variable names of the data set.

2) The script loads in the test data set

3) The script goes through and relabels the variables and recodes descriptives

4) The script extracts the mean and standard deviation columns of each variable

5) The script removes excess data and creates a cleaned test data set.

6) Steps 2 through 5 are repeated for the train data set.

7) The cleaned up test and cleaned up train data set are 
	combined to make the tidy data set

8) The code creates an additional tidy data set of the averages of
	each variable for every subject activity combination.

9) Both data sets are saved to the working directory.


Variable Code book:

SubjectID - the identification given to the participant of the study. 

activitiesNumeric - the numeric value assigned to the particular activity 
	preformed which include:
	1 - WALKING
	
2 - WALKING_UPSTAIRS
	
3 - WALKING_DOWNSTAIRS
	
4 - SITTING

	5 - STANDING

	6 - LAYING


activities - particular activity preformed set as a sting variable

mean() - any column name containing "mean()" or "Mean", suggests mean 
	value is represented 

std() - any column name containing "std()" or "Std", suggests standard deviation
	value is represented 

The following data comes from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 

Signals without Fast Fourier Transformation (FFT):
tBodyAcc-XYZ - the accelerometer's triaxial acceleration signal
tGravityAcc-XYZ - the accelerometer's triaxial acceleration signal (Gravity)
tBodyAccJerk-XYZ - the accelerometer's triaxial jerk
tBodyGyro-XYZ - the gyroscope's andular velocity 
tBodyGyroJerk-XYZ - the gyroscope's andular jerk
tBodyAccMag - the accelerometer's triaxial acceleration signal by magnitude
tGravityAccMag - the accelerometer's triaxial acceleration signal by magnitude (Gravity)
tBodyAccJerkMag - the accelerometer's triaxial jerk by magnitude
tBodyGyroMag - the gyroscope's andular velocity by magnitude
tBodyGyroJerkMag - the gyroscope's andular jerk by magnitude

Signals with Fast Fourier Transformation (FFT):
fBodyAcc-XYZ - the accelerometer's triaxial acceleration signal
fGravityAcc-XYZ - the accelerometer's triaxial acceleration signal (Gravity)
fBodyAccJerk-XYZ - the accelerometer's triaxial jerk
fBodyGyro-XYZ - the gyroscope's andular velocity 
fBodyGyroJerk-XYZ - the gyroscope's andular jerk
fBodyAccMag - the accelerometer's triaxial acceleration signal by magnitude
fGravityAccMag - the accelerometer's triaxial acceleration signal by magnitude (Gravity)
fBodyAccJerkMag - the accelerometer's triaxial jerk by magnitude
fBodyGyroMag - the gyroscope's andular velocity by magnitude
fBodyGyroJerkMag - the gyroscope's andular jerk by magnitude
