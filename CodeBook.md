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
