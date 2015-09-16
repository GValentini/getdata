library(dplyr)

### read the text files in the working directory

act_labs <- read.table("./UCI HAR Dataset/activity_labels.txt",
                    header = FALSE,
                    col.names = c("id_act", "activity"))
features <- read.table("./UCI HAR Dataset/features.txt",
                       header = FALSE, 
                       col.names = c("id_feat", "feature"))
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",
                        header = FALSE,
                        col.names = "subject")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",
                      header = FALSE,
                      col.names = "id_act")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",
                      header = FALSE)
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",
                        header = FALSE,
                        col.names = "subject")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",
                      header = FALSE,
                      col.names = "id_act")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",
                      header = FALSE)

### merge the 2 datasets X_train and X_test

X_merged <- bind_rows(X_train, X_test)
X_merged <- tbl_df(X_merged)

### select the measurements on the mean and standard deviation
labels1 <- grepl("mean", features[,2])
labels2 <- grepl("std", features[,2])
labels3 <- grepl("meanFreq", features[,2])
labels <- as.logical(labels1 + labels2 - labels3)
features <- features[labels == TRUE,]

### select the corresponding columns of the data set 
### and rename them with appropriate labels

X_merged <- select(X_merged, num_range("V",features[,1]))
features[,2] <- gsub("()", "", features[,2], fixed = TRUE)
features[,2] <- gsub("-", ".", features[,2], fixed = TRUE)
names(X_merged) <- features[,2]

### add the columns corresponding to activity and
### the subject who performed the activity

y_col <- bind_rows(y_train, y_test)
sub_col <- bind_rows(sub_train, sub_test)
X_merged <- bind_cols(y_col, sub_col, X_merged)

### use descriptive activity names to name the activities in the data set

X_merged <- right_join(act_labs, X_merged, by = "id_act")

### create an independent tidy data set with the average of
### each variable for each activity and each subject.

X_new <- group_by(X_merged, activity, subject)
X_new <- summarise_each(X_new, funs(mean))

### save the new dataset in a text file

write.table(X_new, file = "mydataset.txt", row.names = FALSE)
