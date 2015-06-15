XtrainFile <- "./UCI HAR Dataset/train/X_train.txt"
XtestFile <- "./UCI HAR Dataset/test/X_test.txt"
ytrainFile <- "./UCI HAR Dataset/train/y_train.txt"
ytestFile <- "./UCI HAR Dataset/test/y_test.txt"
subTrainFile <- "./UCI HAR Dataset/train/subject_train.txt"
subTestFile <- "./UCI HAR Dataset/test/subject_test.txt"

## Loading data
X.train <- read.table(XtrainFile)
X.test <- read.table(XtestFile)
y.train <- read.table(ytrainFile)
y.test <- read.table(ytestFile)
s.train <- read.table(subTrainFile)
s.test <- read.table(subTestFile)

## Merging training and test data
X <- rbind(X.train, X.test)

## Load feature names
fnameFile <- "./UCI HAR Dataset/features.txt"
fname <- read.table(fnameFile, colClasses = "character")[, 2]

## Find mean and std features
feat.keep <- grep("mean\\(\\)|std\\(\\)", fname) 
X <- X[, feat.keep]
colnames(X) <- fname[feat.keep]

## Add activity data
X <- cbind(rbind(y.train, y.test), X)
colnames(X)[1] <- "activity"

## Label activities
lab <- read.table("./UCI HAR Dataset/activity_labels.txt",
                  colClasses = "character")[, 2]
X$activity <- factor(X$activity, labels = lab)

## Add subjects
X <- cbind(rbind(s.train, s.test), X)
colnames(X)[1] <- "subject"
X$subject <- factor(X$subject)

## Tidy dataset
require(dplyr)
tidy <- X %>%
  group_by(activity, subject) %>%
  summarise_each(funs(mean))

## Export tidy data
write.table(tidy, file = "tidy_data.txt", quote = FALSE, row.names = FALSE)
