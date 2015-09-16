## Data Science Specialization

## Course Project - Getting and Cleaning Data

This **readme** file explains the steps followed to obtain the **tidy data set**.

Set the directory containing the file **run_analysis.R** as your working directory.
Source the file **run_analysis.R**.

### The script in the file is composed of the following code blocks:

1. download the R-package **dplyr**
2. read the text files containing the original data
3. merge the 2 datasets **X_train** and **X_test**
4. select the measurements on the mean and standard deviation from the dataset **features**
5. select the corresponding columns in the merged dataset **X_merged**, and rename them with appropriate labels
6. add the columns corresponding to the activity and the subject who performed the activity
7. replace the activity numbers with the corresponding descriptive activity names
8. create a new dataset with the average of each variable for each activity and each subject
9. save the new tidy dataset **X_new** in the text file **mydataset.txt**

### The code for reading the text file in R is:

```
dataset <- read.table("mydataset.txt", header = TRUE)
View(dataset)

```

