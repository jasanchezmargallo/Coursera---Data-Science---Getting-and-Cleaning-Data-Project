# Code Book
A code book that describes the variables, the data, and any transformations or work that you performed to clean up.

## Data set information
**Human Activity Recognition Using Smartphones Dataset**
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. Smartlab - Non Linear Complex Systems Laboratory. DITEN - Università degli Studi di Genova. Via Opera Pia 11A, I-16145, Genoa, Italy. activityrecognition@smartlab.ws. www.smartlab.ws

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

For each record it is provided:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

The dataset includes the following files:
* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

## Transformations performed on the data set and variables
**1. To merge the training and the test sets to create one data set**
Data sets and labels for the training and tests groups were obtained as a table. Besides, activities and features were imported.
Data sets and labels of both groups were merged using "rbind" function.

*features*: Table with all the features.

*activities*: Table with the lable of all the activities.

*XTraining and XTest*: Tables with the data sets of the training and test groups.

*subjectsTest and subjectsTest*: Tables with the identification of each subject for the training and test groups.

*mergedX*: Merged data sets.

*mergedY*: Merged labels.

*subjects*: Merged subjects ID.


**2. To extract the mean and standard deviation for each measurement**
The indexes of the measurements about the "mean" and "standard deviation" were obtained using the function "grep", looking for the indexes which variables contain "mean()" or "std()".
The data of these measurements were stored in "measures" using the indexes obtained previously.

*index*: Indexes of the measures about the "mean" and "standard deviation".

*measures*: Data set of the measures about the "mean" and "standard deviation".


**3. To use descriptive activity names to name the activities in the data set**
The values of the activities were changed to the corresponding label stored in the table activities.


**4. Appropriately labels the data set with descriptive variable names**
The names of the varibles in "measures" were changed to the lables stored in "features" using the index computed in the step 2.
The column of the "subjects" and "mergedY" tables were changed to "ID" and "Activity", respectively.


**5. To create a tidy data set with the average of each variable for each activity and each subject**
A table combining the data of "subjects", "mergedY" and "measures" was created.
A new table was computed by means of applying the mean function (lapply function) to the subset of variables (.SD) for each "ID" and "Activity".
Finally, the cleaned data set was written into a text file using the function "write.table"

*cleanDataTable*: Table wuth the combined data of "subjects", "mergedY" and "measures" was created.

*cleanDataTableAverages*: Table with the average of each variable for each activity and each subject.
