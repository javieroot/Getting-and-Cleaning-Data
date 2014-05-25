Code Book of Getting and Cleaning Data Course Project
=====================================================

This is a code book that describes the variables, the data, and any 
transformations or work that has been done to clean up the data.

Signals Inertial data are not considered because these are obtained from the
treated here .


# The data cleanup script does the following: 

1. Se fija el directorio de trabajo

2. Se revisa si el directorio UCI HAR Dataset existe, sino se descomprime el
   archivo getdata-projectfiles-UCI HAR Dataset.zip para obtenerlo ya que 
   contiene los datos a trabajar
   
3. Merges the training and the test sets to create one data set. Reads data 
   of X corresponding to train and test respectively, then the joint 
   in a data frame.

4. Extracts only the measurements on the mean and standard deviation for each
   measurement. Extracts data were obtained from the calculation of the average
   and the standard deviation.

5. Uses descriptive activity names to name the activities in the data set. 
   Change the numbers in the column for their respective activities activity 
   described in text mode. 

6. Appropriately labels the data set with descriptive activity names. It gets a 
   appropriate name column activities.

7. Creates a 2nd, independent tidy data set with the average of each variable
   for each activity and each subject. Averaging is performed subject to 
   each activity.

