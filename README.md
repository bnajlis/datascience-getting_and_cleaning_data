# Course project for Getting and Cleaning Data (getdata-031)

The script run_analysis.R includes all the steps to join the source data set and generate a new tidy.txt output data set.

## General Notes

The script code contains comments for each of the steps. The script uses `dplyr` for most of the data wrangling functions, so you need to make sure it is installed in your environment.

The basic steps for the script include (in order)

1. Read column names from features.txt
2. Read train data from X_train.txt, and assign column names read in 1
3. Read train labels from Y_train.txt, and assign fixed "activityId" column names
4. Read train subjects from subject_train.txt and assign fixed "subjectId" column name.
5. Bind data read in 2, 3 and 4 into one train data set.
6. Repeat steps 2 to 5 for test data.
7. Bind train and test data together
8. Read activity labels from activity_labels.txt, and assign fixed column names.
9. Left join complete data set from step 7 with activity labels from step 8
10. Summarize all columns calculating its average, grouping by Subject and Activity Name.
11. Write data set to "tidyData.txt"

There are also several in between steps to clean up temporary data variables.

## Instructions to generate Tidy Dataset

1. Download the run_analysis.R into a new directory, and set the R working directory to this location. You can use:
`setwd("[FOLDER LOCATION"])`
2. Download the source dataset into a "data" folder in your new directory. The contents of your working folder should look something like this:
* .\run_analysis.R
* .\data\test
* .\data\train
* .\data\activity_labels.txt
* .\data\features.txt
* .\data\features_info.txt
* .\data\README.txt
3. Run the run_analysis.R script
