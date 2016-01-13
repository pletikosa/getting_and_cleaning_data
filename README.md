
# Getting and Cleaning Data Course Project

This repository contains the files required for the course project of "Getting and Cleaning Data". The goal of the project is to perform several transformations over the [Human Activity Recognition Using Smartphones Data Set](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), available from the following URL:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Repository Structure
This repository contains the following files:

* README.md -- explains the files included in this repository (this file)
* [CodeBook.md](CodeBook.md) -- a code book describing the resulting dataset and applied transformations
* [run_analysis.R](run_analysis.R) -- an R script containing the code needed for data transformation
* [tidyData.txt](tidyData.txt) - a tidy dataset obtained after the transformation

## Data Transformation Process
The process of data transformation was conducted by running the [run_analysis.R](run_analysis.R) file. The process itself involves several steps:

0. **PREPROCESSING**
    * First the required libraries are loaded. In particular `dplyr` is used for data summarization conducted in the last step. 
    * Next, the data required for this task is loaded. For the purpose of this task, the following files included in the original dataset were of interest:
        * `UCI HAR Dataset\test\subject_test.txt` -> `subjectTestData`
        * `UCI HAR Dataset\test\X_test.txt` -> `xTestData`
        * `UCI HAR Dataset\test\y_test.txt` -> `yTestData`
        * `UCI HAR Dataset\train\subject_train.txt` -> `subjectTrainData`
        * `UCI HAR Dataset\train\X_train.txt` -> `xTrainData`
        * `UCI HAR Dataset\train\y_train.txt` -> `yTrainData`
    
1. **MERGING**
    * First training and testing data are each merged (column-wise) to include the measured variables (`x<dst>Data`), subject identification (`subject<dst>Data`) and the outcome variable (`y<dst>Data`), where `<dst>` stands for `Train` or `Test`, respectively (see previous point). 
    * Then completed training (`trainData`) and testing (`testData`) datasets are merged (row-wise) to create a single data set (`data`).

2. **EXTRACTING THE MEAN AND STANDARD DEVIATION MEASUREMENTS**
    * First the list of feature names is read from `UCI HAR Dataset\\features.txt` file.
    * Then the feature labels (contained in the second column (`V2` variable) are merged with the labels indicating the subject (`subjectid`) and activity (`activityid`) columns.
    * The resulting list of column names is applied to the data 
    * Finally, columns containing `mean` or `std` in their names (including `activityid` and `subjectid` are extracted from the data by applying the `grepl(...)` method, using the following regular expression: `\\.mean\\.|\\.std\\.|activityid|subjectid`

3. **ASSIGNING DESCRIPTIVE ACTIVITY NAMES**
    * First the file containing the activity labels is read (`UCI HAR Dataset\\activity_labels.txt`).
    * Then, the `merge` command is used to merge the labels with the data
    * Finally, the original column (named `activityid`) which contains numeric activity values is removed

4. **LABELING THE VARIABLES WITH DESCRIPTIVE NAMES**  
Since the data labels were already assigned in Step 2, in this step transformations have been made to change the variable names to a form that complies with the recommendations for tidy data, as well as with the feature descriptions provided in the `UCI HAR Dataset\\features_info.txt` file. The transformations were conducted as follows:
    * Abbreviations (`Acc`, `Gyro`, `Mag`) were replaced with full terms (`Accelerometer`, `Gyroscope`, `Magnitude`).
    * Names of statistical function (`mean`, `std`) were capitalized.
    * A typo was corrected (`BodyBody` -> `Body`).
    * The leading characters representing the measurement units were extended to full terms (`t` -> `time`, `f` -> `frequency`).
    * `Axis` term was added after each axis symbol (e.g. `X` -> `XAxis`).
    * The dots were removed.

5. **SUMMARIZING OVER ACTIVITY AND SUBJECT**  
In the final step, a copy of the `data` frame obtained in the previous step is created (`tidyData`). Then the following transformations are applied:  
    * The `subjectid` and `activity` variables are transformed into factors.
    * Then these two factors are defined as grouping variables by applying the `group_by` function.
    * A new dataframe is created, by summarizing over `activity` and `subject` by calculating the average value of the measurements (i.e. `mean`).
    * The original variable names are applied to avoid the `_mean` extension assigned in the previous step.
    * Finally, the data is stored under the name `tidyData.txt` in the working directory.

## The Resulting Tidy Dataset
The actual datafile generated in the final step is stored in this repository as [tidyData.txt](tidyData.txt)

The file [CodeBook.md](CodeBook.md) provides a detailed description of all variables included in the resulting dataset, as well as the transformation performed over the original variable values.
