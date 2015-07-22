# Code Book
This is the Code Book of the Getting and Cleaning Data Course Project.
You could find here a description of each variable and its values of the tidy data set.

## Study design
The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKINGUPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Variables
Here are described the different variables of the new data set:

* `Subject` column includes numbers from 1 to 30, representing each of the 30 persons that took part of the experiment.  
* `Activity` column includes 6 different activities that were performed by the subjects  

|#|Activities|  
|1|WALKING|  
|2|WALKING_UPSTAIRS|  
|3|WALKING_DOWNSTAIRS|  
|4|SITTING|  
|5|STANDING|  
|6|LAYING|  

* Measurements (66 columns) of the subjects doing different activities are added. Measurements include Mean and Standard Deviations that are values between -1 and 1.

|Examples of Measurements|
|---|
|Time-Body-Acc-Mean-X|                          
|Time-Body-Acc-Mean-Y|                          
|Time-Body-Acc-Mean-Z|                          
|Time-Body-Acc-StandardDev-X|                   
|Time-Body-Acc-StandardDev-Y|                   
|Time-Body-Acc-StandardDev-Z|                   
|Time-Gravity-Acc-Mean-X|
|...|


## Data
The `tidy.txt` contains 180 observations (30 subjects x 6 activities) and 68 variables (1 subject, 1 activity and 66 measurements)
Here
```
> head(tidy[,1:4])
  Subject           Activity Time-Body-Acc-Mean-X Time-Body-Acc-Mean-Y
1       1             LAYING            0.2215982         -0.040513953
2       1            SITTING            0.2612376         -0.001308288
3       1           STANDING            0.2789176         -0.016137590
4       1            WALKING            0.2773308         -0.017383819
5       1 WALKING_DOWNSTAIRS            0.2891883         -0.009918505
6       1   WALKING_UPSTAIRS            0.2554617         -0.023953149

```

## Transformations performed to clean the data

1. Data is downloaded and unzipped manually
2. Data Set is merged (10299 observations of 563 variables)
3. Measurements on the mean and standard deviation are extracted  (66)
4. Descriptive names are added to activities and to variable names  
5. New data set is created taking the average of each variable for each activity and each subject (180 observations of 68 variables, including activity and subject)
6. New data set is stored on `Tidy.txt` file and placed on the working directory





