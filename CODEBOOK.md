---
title: "Code Book for the Human Activity Summary Dataset"
output: html_document
---


## Background

This dataset is a summary of human activity measurements collected during normal activities.  The dataset was developed from the "Human Activity Recognition Using Smartphones Dataset" (HAR).  The HAR consists of kinematic measurements collected from experiments in which 30 human subjects were observed while performing 6 normal activities while wearing a waist-mounted smartphone with accelerometers and gyros.  The activities were walking, walking upstairs, walking downstairs, sitting, standing, and laying.  The original dataset was downloaded from the UCI Machine Learning Repository.  For more details on the original dataset, see <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.  

## Process to Develop the Summary Database
This section describes the process for development of the HAR summary dataset, the subject of this Code Book.
The original database was composed of a training dataset and test dataset.  Both training and test datasets had the same format. The summary database was constructed using the following steps: 

1. Read the Training and Test Datasets.  Each dataset consisted of a subject file, an activity file, and a measurements file with files names titled 'subject_(train or test).txt', 'y__(train or test).txt', 'x__(train or test).txt' respectively.

2. Combine the datasets by combining the subject file, an activity file, and the measurements file for the training and test datasets.

3. Add meaningful names to each column of the combined dataset. The first column was called 'subject'.  The second column was named 'activity'.  The names for the measurement variables were obtained by reading in the 'features.txt' file.  The feature labels were converted to valid R variable names by removing all special characters, i.e. '(', ')', '-', and ','.  The feature names were next converted to lowercase.  The features in the summary dataset were then named using the resulting feature_name vector of names.

4. Assign a meaningful name to each activity.  The original HAR dataset assigned a numeric value to each activity ranging from 1-6.  In the summary dataset, the activity variable was converted to a factor variable with labels of "Walking", "Walking upstairs", "Walking downstairs", "Sitting", "Standing", and "Laying""

5. The original HAR dataset contains 561 features for each observation.  For the summary dataset, extract only the measurements of the mean and standard deviation features.  A total of 66 features met this inclusion criteria.  The resulting dataset was composed of 68 columns (subject, activity, and 66 features) and 10,299 rows.

6.  Create the HAR summary dataset as a tidy dataset which contains the average of each variable for each activity and each subject.  The dataset in Step 5 was first changed to a tidy dataset in which row contained the subject, the activity, the feature name, and the measurement for that subject-activity-feature combination.  In the original HAR dataset, there were multiple measurements for each combination. After converting to a tidy dataset, this interim dataset contained 679,734 observations of 4 variables.   The final HAR summary dataset was then constructed by taking the mean of all observations for a particular subject-activity-feature combination.  The final HAR summary dataset, named 'HARsummary.txt' contained 11,880 observations of 4 variables.


## Variables

The final summary dataset contains the following variables:

* subject -- subject number (1-30)
* activity -- activity description (see below for a list of all activities)
* variable -- Description of the Measurement taken during the activity (see below for a list of all measurement variables)
* mean -- Mean of the varible for this subject for performing this activity

### Activities
Following are the names of the activities observed during each subject-activity observation.  These are the values of the 'activity' data element in the dataset:

* Walking
* Walking upstairs
* Walking downstairs
* Sitting
* Standing
* Laying

### Measurement Variables
Following are the names of the variables measured during each subject-activity observation.  These are the values of the 'variable' data element in the dataset:

* tbodyaccmeanx -- Body Motion Acceleration, x-axis, mean, in the time domain,(units=Gs)
* tbodyaccmeany -- Body Motion Acceleration, y-axis, mean, in the time domain,(units=Gs)
* tbodyaccmeanz -- Body Motion Acceleration, z-axis, mean, in the time domain,(units=Gs)
* tbodyaccstdx -- Body Motion Acceleration, x-axis, standard deviation, in the time domain,(units=Gs)
* tbodyaccstdy -- Body Motion Acceleration, y-axis, standard deviation, in the time domain,(units=Gs)
* tbodyaccstdz -- Body Motion Acceleration, z-axis, standard deviation, in the time domain,(units=Gs)
* tgravityaccmeanx -- Gravity Acceleration, x-axis, mean, in the time domain,(units=Gs)
* tgravityaccmeany -- Gravity Acceleration, y-axis, mean, in the time domain,(units=Gs)
* tgravityaccmeanz -- Gravity Acceleration, z-axis, mean, in the time domain,(units=Gs)
* tgravityaccstdx -- Gravity Acceleration, x-axis, standard deviation, in the time domain,(units=Gs)
* tgravityaccstdy -- Gravity Acceleration, y-axis, standard deviation, in the time domain,(units=Gs)
* tgravityaccstdz -- Gravity Acceleration, z-axis, standard deviation, in the time domain,(units=Gs)
* tbodyaccjerkmeanx -- Body Motion Acceleration Jerk, x-axis, mean, in the time domain,(units=G/sec)
* tbodyaccjerkmeany -- Body Motion Acceleration Jerk, y-axis, mean, in the time domain,(units=G/sec)
* tbodyaccjerkmeanz -- Body Motion Acceleration Jerk, z-axis, mean, in the time domain,(units=G/sec)
* tbodyaccjerkstdx -- Body Motion Acceleration Jerk, x-axis, standard deviation, in the time domain,(units=G/sec)
* tbodyaccjerkstdy -- Body Motion Acceleration Jerk, y-axis, standard deviation, in the time domain,(units=G/sec)
* tbodyaccjerkstdz -- Body Motion Acceleration Jerk, z-axis, standard deviation, in the time domain,(units=G/sec)
* tbodygyromeanx -- Body Motion Angular Velocity, x-axis, mean, in the time domain,(units=deg/sec)
* tbodygyromeany -- Body Motion Angular Velocity, y-axis, mean, in the time domain,(units=deg/sec)
* tbodygyromeanz -- Body Motion Angular Velocity, z-axis, mean, in the time domain,(units=deg/sec)
* tbodygyrostdx -- Body Motion Angular Velocity, x-axis, standard deviation, in the time domain,(units=deg/sec)
* tbodygyrostdy -- Body Motion Angular Velocity, y-axis, standard deviation, in the time domain,(units=deg/sec)
* tbodygyrostdz -- Body Motion Angular Velocity, z-axis, standard deviation, in the time domain,(units=deg/sec)
* tbodygyrojerkmeanx -- Body Motion Angular Velocity Jerk, x-axis, mean, in the time domain,(units= deg/sec/sec)
* tbodygyrojerkmeany -- Body Motion Angular Velocity Jerk, y-axis, mean, in the time domain,(units= deg/sec/sec)
* tbodygyrojerkmeanz -- Body Motion Angular Velocity Jerk, z-axis, mean, in the time domain,(units= deg/sec/sec)
* tbodygyrojerkstdx -- Body Motion Angular Velocity Jerk, x-axis, standard deviation, in the time domain,(units= deg/sec/sec)
* tbodygyrojerkstdy -- Body Motion Angular Velocity Jerk, y-axis, standard deviation, in the time domain,(units= deg/sec/sec)
* tbodygyrojerkstdz -- Body Motion Angular Velocity Jerk, z-axis, standard deviation, in the time domain,(units= deg/sec/sec)
* tbodyaccmagmean -- Body Motion Acceleration, resultant magnitude, mean, in the time domain,(units=Gs)
* tbodyaccmagstd -- Body Motion Acceleration, resultant magnitude, standard deviation, in the time domain,(units=Gs)
* tgravityaccmagmean -- Gravity Acceleration, resultant magnitude, mean, in the time domain,(units=Gs)
* tgravityaccmagstd -- Gravity Acceleration, resultant magnitude, standard deviation, in the time domain,(units=Gs)
* tbodyaccjerkmagmean -- Body Motion Acceleration Jerk, resultant magnitude, mean, in the time domain,(units=G/sec)
* tbodyaccjerkmagstd -- Body Motion Acceleration Jerk, resultant magnitude, standard deviation, in the time domain,(units=G/sec)
* tbodygyromagmean -- Body Motion Angular Velocity, resultant magnitude, mean, in the time domain,(units=deg/sec)
* tbodygyromagstd -- Body Motion Angular Velocity, resultant magnitude, standard deviation, in the time domain,(units=deg/sec)
* tbodygyrojerkmagmean -- Body Motion Angular Velocity Jerk, resultant magnitude, mean, in the time domain,(units= deg/sec/sec)
* tbodygyrojerkmagstd -- Body Motion Angular Velocity Jerk, resultant magnitude, standard deviation, in the time domain,(units= deg/sec/sec)
* fbodyaccmeanx -- Body Motion Acceleration, x-axis, mean, in the frequency domain,(units=Gs)
* fbodyaccmeany -- Body Motion Acceleration, y-axis, mean, in the frequency domain,(units=Gs)
* fbodyaccmeanz -- Body Motion Acceleration, z-axis, mean, in the frequency domain,(units=Gs)
* fbodyaccstdx -- Body Motion Acceleration, x-axis, standard deviation, in the frequency domain,(units=Gs)
* fbodyaccstdy -- Body Motion Acceleration, y-axis, standard deviation, in the frequency domain,(units=Gs)
* fbodyaccstdz -- Body Motion Acceleration, z-axis, standard deviation, in the frequency domain,(units=Gs)
* fbodyaccjerkmeanx -- Body Motion Acceleration Jerk, x-axis, mean, in the frequency domain,(units=G/sec)
* fbodyaccjerkmeany -- Body Motion Acceleration Jerk, y-axis, mean, in the frequency domain,(units=G/sec)
* fbodyaccjerkmeanz -- Body Motion Acceleration Jerk, z-axis, mean, in the frequency domain,(units=G/sec)
* fbodyaccjerkstdx -- Body Motion Acceleration Jerk, x-axis, standard deviation, in the frequency domain,(units=G/sec)
* fbodyaccjerkstdy -- Body Motion Acceleration Jerk, y-axis, standard deviation, in the frequency domain,(units=G/sec)
* fbodyaccjerkstdz -- Body Motion Acceleration Jerk, z-axis, standard deviation, in the frequency domain,(units=G/sec)
* fbodygyromeanx -- Body Motion Angular Velocity, x-axis, mean, in the frequency domain,(units=deg/sec)
* fbodygyromeany -- Body Motion Angular Velocity, y-axis, mean, in the frequency domain,(units=deg/sec)
* fbodygyromeanz -- Body Motion Angular Velocity, z-axis, mean, in the frequency domain,(units=deg/sec)
* fbodygyrostdx -- Body Motion Angular Velocity, x-axis, standard deviation, in the frequency domain,(units=deg/sec)
* fbodygyrostdy -- Body Motion Angular Velocity, y-axis, standard deviation, in the frequency domain,(units=deg/sec)
* fbodygyrostdz -- Body Motion Angular Velocity, z-axis, standard deviation, in the frequency domain,(units=deg/sec)
* fbodyaccmagmean -- Body Motion Acceleration, resultant magnitude, mean, in the frequency domain,(units=Gs)
* fbodyaccmagstd -- Body Motion Acceleration, resultant magnitude, standard deviation, in the frequency domain,(units=Gs)
* fbodybodyaccjerkmagmean -- Body Motion Acceleration Jerk, resultant magnitude, mean, in the frequency domain,(units=G/sec)
* fbodybodyaccjerkmagstd -- Body Motion Acceleration Jerk, resultant magnitude, standard deviation, in the frequency domain,(units=G/sec)
* fbodybodygyromagmean -- Body Motion Angular Velocity, resultant magnitude, mean, in the frequency domain,(units=deg/sec)
* fbodybodygyromagstd -- Body Motion Angular Velocity, resultant magnitude, standard deviation, in the frequency domain,(units=deg/sec)
* fbodybodygyrojerkmagmean -- Body Motion Angular Velocity Jerk, resultant magnitude, mean, in the frequency domain,(units= deg/sec/sec)
* fbodybodygyrojerkmagstd -- Body Motion Angular Velocity Jerk, resultant magnitude, standard deviation, in the frequency domain,(units= deg/sec/sec)

