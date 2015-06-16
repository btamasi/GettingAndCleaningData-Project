## Load and merge train and test sets
X.train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X.test <- read.table("./UCI HAR Dataset/test/X_test.txt")
X <- rbind(X.train, X.test)

## Load feature names
feat.name <- read.table("./UCI HAR Dataset/features.txt",
                    colClasses = "character")[, 2]

## Find mean and std features
feat.keep <- grep("mean\\(\\)|std\\(\\)", feat.name) 
X <- X[, feat.keep]
colnames(X) <- feat.name[feat.keep]

## Load, merge and add activity data
y.train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y.test <- read.table("./UCI HAR Dataset/test/y_test.txt")
X <- cbind(rbind(y.train, y.test), X)
colnames(X)[1] <- "activity"

## Label activities
lab <- read.table("./UCI HAR Dataset/activity_labels.txt",
                  colClasses = "character")[, 2]
X$activity <- factor(X$activity, labels = lab)

## Load, merge and add subjects
s.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
s.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
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
