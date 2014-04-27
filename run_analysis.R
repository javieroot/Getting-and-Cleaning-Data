# 1. Merges the training and the test sets to create one data set.

train.X.train <- read.table("./UCI HAR Dataset/train/X_train.txt")
test.X.test   <- read.table("./UCI HAR Dataset/test/X_test.txt")
X             <- rbind(train.X.train, test.X.test)

# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement.

features         <- read.table("./UCI HAR Dataset/features.txt")
indices_mean_std <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])

X        <- X[, indices_mean_std]
names(X) <- features[indices_mean_std, 2]
names(X) <- gsub("\\(|\\)", "", names(X))

# 3. Uses descriptive activity names to name the activities in the data set

train.y.train   <- read.table("./UCI HAR Dataset/train/y_train.txt")
test.y.test     <- read.table("./UCI HAR Dataset/test/y_test.txt")
y               <- rbind(train.y.train, test.y.test)

activities      <- read.table("./UCI HAR Dataset/activity_labels.txt")
activities[, 2] <- gsub("_", "", tolower(as.character(activities[, 2])))
y[,1]           <- activities[y[,1], 2]
names(y)        <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

train.subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train.subject.test  <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject             <- rbind(train.subject.train, train.subject.test)

names(subject) <- "subject"
clean.data     <- cbind(subject, y, X)
write.table(clean.data, "clean_data.txt", row.names = FALSE)

# 5. Creates a 2nd, independent tidy data set with the average of each variable
#    for each activity and each subject.



uniqueSubjects = unique(subject)[,1]
numSubjects = length(unique(subject)[,1])
numActivities = length(activities[,1])
numCols = dim(clean.data)[2]
result = clean.data[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- clean.data[clean.data$subject==s & clean.data$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "data_averages.txt", , row.names = FALSE)
