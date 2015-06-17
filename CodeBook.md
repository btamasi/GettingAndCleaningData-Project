# Code Book

## Input Data

The detailed description of the input data set can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Transformations

The `run_analysis.R` file implements the following steps:

1.  Loads and merges the training and test sets.
2.  Loads feature names.
3.  Extracts measurements on the mean and standard deviation of each measurement by selecting features that contain
    either `mean()` or `std()` in their names.
4.  Loads, merges and adds activity data to the data set.
5.  Labels activities with their original labes.
6.  Loads, merges and adds subject labels to the data set.
7.  Calculates averages on the data grouped by `activity` and `subject`.
8.  Exports tidy data set as `tidy_data.txt`.

## Output Data

The `tidy_data.txt` output file contains group averages for the *mean* and *standard deviation* of the following measurement
variables grouped by `activity` and `subject`:

    tBodyAcc-XYZ
    tGravityAcc-XYZ
    tBodyAccJerk-XYZ
    tBodyGyro-XYZ
    tBodyGyroJerk-XYZ
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag
    fBodyAcc-XYZ
    fBodyAccJerk-XYZ
    fBodyGyro-XYZ
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag
