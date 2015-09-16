## Codebook - Getting and Cleaning Data - Course project

The text file **mydataset.txt** consists of a tidy dataset obtained by cleaning the data from an original dataset.
The original dataset comes from an experiment about Human Activity Recognition Using Smartphones [1], in which 30 volunteers 
performed 6 activities wearing a smartphone on the waist. 

The embedded accelererometer and gyroscope recorded the 3-axial linear acceleration signals and the 3-axial angular velocity 
signals.

The tidy dataset has 180 observations (30 subjects x 6 activities) of 69 variables.

**Each row** in the tidy dataset corresponds to the **average value** of each variable for each **combination of activity and subject**.

The average values were obtained by: 
1. grouping the selected variables for each combination of activity and subject; 
2. applying the summary function "mean" to each column of the grouped dataset.

### Column names

The first two columns **activity** and **subject** indicate respectively the name of the activity and the subject who performed it.

The third column **id_act** is the number identifying the activity.

The following columns (4 to 69) corresponds to the mean (**.mean**) and the standard deviation (**.std**) of the signals collected. These variables were obtained from the original dataset by selecting only the columns whose name contains the word "mean()" or "std()".

Concerning the variable names, in detail we have:

* The prefix **t** refers to **time domain** signals, while the prefix **f** refers to **frequency domain** signals.

* The linear acceleration signals are separated into body **BodyAcc** and gravity **GravityAcc** acceleration.

* The angular velocity is identified by the word **BodyGyro**

* The suffix **.X**, **.Y** and **.Z** indicates the corresponding direction of the linear acceleration and angular velocity

* The word **Jerk** indicates the time derivative of the linear body acceleration and angular velocity.

* The magnitude of the 3-dimensional signals is identified by the word **Mag**.

***
_____________________________

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on 
Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living 
(IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
