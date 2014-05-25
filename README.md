Getting and Cleaning Data Course Project
----------------------------------------

### Introduction:
This repository is intended to store the project (Peer Assessments) of the 
course Getting and Cleaning Data part of the "Data Science" Specialization 
through Coursera.
The purpose of this project is to demonstrate your ability to collect, work
with, and clean a data set. The goal is to prepare tidy data that can be used 
for later analysis.


### Abstract: 
Human Activity Recognition database built from the recordings of 30 
subjects performing activities of daily living (ADL) while carrying a 
waist-mounted smartphone with embedded inertial sensors. This data will be 
prepared for further analysis using R.


### Source:
The original data [are](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

With the [source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Getting and Cleaning Data Course Project

#### This repository:
As mentioned above this repository is intended to store the present project,
contains the following files:

* README.md. This flie
* CodeBook.md. This file describes the variables, the data, and any
  transformations or work that has been done to clean up the data.
* getdata-projectfiles-UCI HAR Dataset.zip. Data set to tidy, see details of 
  the data set section
* run_analysis.R. R script that processes the data
* clean_data.txt. The first tidy data set(only the measurements on the mean and
  standard deviation for each measurement)
* data_set_with_the_averages.txt. A second, independent tidy data set with the 
  average of each variable for each activity and each subject

#### Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments have been video-recorded to
label the data manually. The obtained dataset has been randomly partitioned into
two sets, where 70% of the volunteers was selected for generating the training 
data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is 
assumed to have only low frequency components, therefore a filter with 0.3 Hz 
cutoff frequency was used. From each window, a vector of features was obtained 
by calculating variables from the time and frequency domain. 

Check the README.txt file for further details about this dataset.


#### Attribute Information:
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the 
  estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


#### Process Getting and Cleaning Data
If you want to run the process on your pc , you should clone the repository and 
run the file run_analysis.R considering that you must change the working 
directory and have the plyr library installed. When you run the file 
run_analisys.R the files described above clean_data.txt and 
data_set_with_the_averages.txt  will be generated.

This process has only been tested on the Fedora 20 operating system. For more 
details about the process you should see the book code and/or code file 
run_analysis.R

