Signals Inertial data are not considered because these are obtained from the
treated here .

The original data are: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
With the source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data cleanup script does the following: 

1. Merges the training and the test sets to create one data set. Reads data 
   of X corresponding to train and test respectively, then the joint 
   in a data frame.

2. Extracts only the measurements on the mean and standard deviation for each
   measurement. Extracts data were obtained from the calculation of the average and 
   the standard deviation.

3. Uses descriptive activity names to name the activities in the data set. 
   Change the numbers in the column for their respective activities activity 
   described in text mode. 


4. Appropriately labels the data set with descriptive activity names. It gets a 
   appropriate name column activities.

5. Creates a 2nd, independent tidy data set with the average of each variable
   for each activity and each subject. Averaging is performed subject to 
  each activity.

