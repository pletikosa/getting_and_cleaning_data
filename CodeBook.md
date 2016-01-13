Codebook for Getting and Cleaning Data Course Project
==================================

##Overview

The work conducted as a part of this project is based on the [Human Activity Recognition Using Smartphones Data Set](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), in continuation referred to as `UCI HAR Dataset`.

The resulting dataset, i.e. [tidyData.txt](tidyData.txt) and in continuation referred to as the `tidy dataset` represents a transformed subset of the original dataset. The steps conducted to perform the transformation are detailed in the [README.md](README.md) file, while the actual R code is available in this repo as [run_analysis.R](run_analysis.R)

## Study Design

According to the study description provided by the authors: 

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

(Source: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.)

## Data Transformation

The `tidy dataset` combines the training and testing data of `UCI HAR Dataset`. In addition, only a subset of the original measurements has been extracted. In particular, only variables representing the means and standard deviations of the obtained measurements were used. 

Apart from the measurements, the `tidy dataset` also includes the information about the measured output (see `activity` variable in *Code Book* section), as well as the subject information (see `subjectid` variable in the *Code Book* section).

Finally, the dataset was summarized by calculating the average values of the measured variables for each activity and subject. The resulting `tidy dataset` contains 180 observations, each wth 68 variables as explained in the continuation.

## Code Book

According to its authors, in the original `UCI HAR Dataset` the features originate from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. In addition, 

>These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>
>* tBodyAcc-XYZ
>* tGravityAcc-XYZ
>* tBodyAccJerk-XYZ
>* tBodyGyro-XYZ
>* tBodyGyroJerk-XYZ
>* tBodyAccMag
>* tGravityAccMag
>* tBodyAccJerkMag
>* tBodyGyroMag
>* tBodyGyroJerkMag
>* fBodyAcc-XYZ
>* fBodyAccJerk-XYZ
>* fBodyGyro-XYZ
>* fBodyAccMag
>* fBodyAccJerkMag
>* fBodyGyroMag
>* fBodyGyroJerkMag


(Source: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.)

Over these values, a set of measures were applied which resulted in the variables included in the dataset. Of these, for the `tidy dataset` of interest were:

* mean(): Mean value
* std(): Standard deviation

Thus the resulting dataset contains the following variables:

* activity                                   : Factor (6 levels, "LAYING","SITTING", "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS")
* subject                                    : Factor (30 levels, 1 to 30)
* timeBodyAccelerometerMeanXAxis             : numeric : The mean of the body acceleration on X axis. 
* timeBodyAccelerometerMeanYAxis             : numeric : The mean of the body acceleration on Y axis. 
* timeBodyAccelerometerMeanZAxis             : numeric : The mean of the body acceleration on Z axis. 
* timeBodyAccelerometerStdXAxis              : numeric : The standard deviation of the body acceleration on X axis. 
* timeBodyAccelerometerStdYAxis              : numeric : The standard deviation of the body acceleration on Y axis.
* timeBodyAccelerometerStdZAxis              : numeric : The standard deviation of the body acceleration on Z axis.
* timeGravityAccelerometerMeanXAxis          : numeric : The mean of the gravity acceleration on X axis.
* timeGravityAccelerometerMeanYAxis          : numeric : The mean of the gravity acceleration on Y axis.
* timeGravityAccelerometerMeanZAxis          : numeric : The mean of the gravity acceleration on Z axis.
* timeGravityAccelerometerStdXAxis           : numeric : The standard deviation of the gravity acceleration on X axis.
* timeGravityAccelerometerStdYAxis           : numeric : The standard deviation of the gravity acceleration on Y axis.
* timeGravityAccelerometerStdZAxis           : numeric : The standard deviation of the gravity acceleration on Z axis.
* timeBodyAccelerometerJerkMeanXAxis         : numeric : The mean of the body acceleration on X axis, derived in time. 
* timeBodyAccelerometerJerkMeanYAxis         : numeric : The mean of the body acceleration on Y axis, derived in time. 
* timeBodyAccelerometerJerkMeanZAxis         : numeric : The mean of the body acceleration on Z axis, derived in time. 
* timeBodyAccelerometerJerkStdXAxis          : numeric : The standard deviation of the body acceleration on X axis, derived in time. 
* timeBodyAccelerometerJerkStdYAxis          : numeric : The standard deviation of the body acceleration on Y axis, derived in time. 
* timeBodyAccelerometerJerkStdZAxis          : numeric : The standard deviation of the body acceleration on Z axis, derived in time. 
* timeBodyGyroscopeMeanXAxis                 : numeric : The mean of the body angular velocity on X axis.
* timeBodyGyroscopeMeanYAxis                 : numeric : The mean of the body angular velocity on Y axis.
* timeBodyGyroscopeMeanZAxis                 : numeric : The mean of the body angular velocity on Z axis.
* timeBodyGyroscopeStdXAxis                  : numeric : The standard of the body angular velocity on X axis.
* timeBodyGyroscopeStdYAxis                  : numeric : The standard of the body angular velocity on Y axis.
* timeBodyGyroscopeStdZAxis                  : numeric : The standard of the body angular velocity on Z axis.
* timeBodyGyroscopeJerkMeanXAxis             : numeric : The mean of the body angular velocity on X axis, derived in time. 
* timeBodyGyroscopeJerkMeanYAxis             : numeric : The mean of the body angular velocity on Y axis, derived in time. 
* timeBodyGyroscopeJerkMeanZAxis             : numeric : The mean of the body angular velocity on Z axis, derived in time. 
* timeBodyGyroscopeJerkStdXAxis              : numeric : The standard deviation of the body angular velocity on X axis, derived in time. 
* timeBodyGyroscopeJerkStdYAxis              : numeric : The standard deviation of the body angular velocity on Y axis, derived in time.
* timeBodyGyroscopeJerkStdZAxis              : numeric : The standard deviation of the body angular velocity on Z axis, derived in time.
* timeBodyAccelerometerMagnitudeMean         : numeric : The mean of the body acceleration magnitude.
* timeBodyAccelerometerMagnitudeStd          : numeric : The standard deviation of the body acceleration magnitude.
* timeGravityAccelerometerMagnitudeMean      : numeric : The mean of the gravity acceleration magnitude.
* timeGravityAccelerometerMagnitudeStd       : numeric : The standard deviation of the gravity acceleration magnitude.
* timeBodyAccelerometerJerkMagnitudeMean     : numeric : The mean of the body acceleration magnitude, derived in time.
* timeBodyAccelerometerJerkMagnitudeStd      : numeric : The standard deviation of the body acceleration magnitude, derived in time. 
* timeBodyGyroscopeMagnitudeMean             : numeric : The mean of the body angular velocity magnitude.
* timeBodyGyroscopeMagnitudeStd              : numeric : The standard deviation of the body angular velocity magnitude.
* timeBodyGyroscopeJerkMagnitudeMean         : numeric : The mean of the body angular velocity magnitude, derived in time.
* timeBodyGyroscopeJerkMagnitudeStd          : numeric : The standard deviation of the body angular velocity magnitude, derived in time.
* frequencyBodyAccelerometerMeanXAxis        : numeric : The mean of the body acceleration on X axis, with a FFT. 
* frequencyBodyAccelerometerMeanYAxis        : numeric : The mean of the body acceleration on Y axis, with a FFT.
* frequencyBodyAccelerometerMeanZAxis        : numeric : The mean of the body acceleration on Z axis, with a FFT.
* frequencyBodyAccelerometerStdXAxis         : numeric : The standard deviation of the body acceleration on X axis, with a FFT.
* frequencyBodyAccelerometerStdYAxis         : numeric : The standard deviation of the body acceleration on Y axis, with a FFT.
* frequencyBodyAccelerometerStdZAxis         : numeric : The standard deviation of the body acceleration on Z axis, with a FFT.
* frequencyBodyAccelerometerJerkMeanXAxis    : numeric : The mean of the body acceleration on X axis, with a FFT and derived in time. 
* frequencyBodyAccelerometerJerkMeanYAxis    : numeric : The mean of the body acceleration on Y axis, with a FFT and derived in time. 
* frequencyBodyAccelerometerJerkMeanZAxis    : numeric : The mean of the body acceleration on Z axis, with a FFT and derived in time. 
* frequencyBodyAccelerometerJerkStdXAxis     : numeric : The standard deviation of the body acceleration on X axis, with a FFT and derived in time. 
* frequencyBodyAccelerometerJerkStdYAxis     : numeric : The standard deviation of the body acceleration on Y axis, with a FFT and derived in time. 
* frequencyBodyAccelerometerJerkStdZAxis     : numeric : The standard deviation of the body acceleration on Z axis, with a FFT and derived in time. 
* frequencyBodyGyroscopeMeanXAxis            : numeric : The mean of the body angular velocity on X axis, with a FFT.
* frequencyBodyGyroscopeMeanYAxis            : numeric : The mean of the body angular velocity on Y axis, with a FFT.
* frequencyBodyGyroscopeMeanZAxis            : numeric : The mean of the body angular velocity on Z axis, with a FFT.
* frequencyBodyGyroscopeStdXAxis             : numeric : The standard deviation of the body angular velocity on X axis, with a FFT.
* frequencyBodyGyroscopeStdYAxis             : numeric : The standard deviation of the body angular velocity on Y axis, with a FFT.
* frequencyBodyGyroscopeStdZAxis             : numeric : The standard deviation of the body angular velocity on Z axis, with a FFT.
* frequencyBodyAccelerometerMagnitudeMean    : numeric : The mean of the body acceleration magnitude on X axis, with a FFT.
* frequencyBodyAccelerometerMagnitudeStd     : numeric : The standard deviation of the body acceleration magnitude on X axis, with a FFT.
* frequencyBodyAccelerometerJerkMagnitudeMean: numeric : The mean of the body acceleration magnitude, with a FFT and derived in time.
* frequencyBodyAccelerometerJerkMagnitudeStd : numeric : The standard deviation of the body acceleration magnitude, with a FFT and derived in time.
* frequencyBodyGyroscopeMagnitudeMean        : numeric : The mean of the body angular velocity magnitude, with a FFT.
* frequencyBodyGyroscopeMagnitudeStd         : numeric : The standard deviation of the body angular velocity magnitude, with a FFT.
* frequencyBodyGyroscopeJerkMagnitudeMean    : numeric : The mean of the body angular velocity magnitude, with a FFT and derived in time.
* frequencyBodyGyroscopeJerkMagnitudeStd     : numeric : The standard deviation of the body angular velocity magnitude, with a FFT and derived in time.

The transoformation conducted over the original variable names (to make them more "readable") is detailed in [README.md](README.md)

