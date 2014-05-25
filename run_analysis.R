# The session information is displayed

# > sessionInfo()
# R version 3.0.2 (2013-09-25)
# Platform: x86_64-redhat-linux-gnu (64-bit)
# 
# locale:
#  [1] LC_CTYPE=es_MX.UTF-8      LC_NUMERIC=C              LC_TIME=es_MX.utf8       
#  [4] LC_COLLATE=es_MX.UTF-8    LC_MONETARY=es_MX.utf8    LC_MESSAGES=es_MX.UTF-8  
#  [7] LC_PAPER=es_MX.utf8       LC_NAME=C                 LC_ADDRESS=C             
# [10] LC_TELEPHONE=C            LC_MEASUREMENT=es_MX.utf8 LC_IDENTIFICATION=C      
# 
# attached base packages:
#   [1] stats     graphics  grDevices utils     datasets  methods   base     
# 
# other attached packages:
#   [1] plyr_1.8
# 
# loaded via a namespace (and not attached):
#   [1] tools_3.0.2


# Changing work directory
setwd("/home/javier/Respaldo/Data Science Specialization/repositorios/Getting-and-Cleaning-Data")

# Loading plyr library
library(plyr)


# We review whether the UCI HAR Dataset directory exists, if not exist that 
# directory, the getdata-projectfiles-UCI HAR Dataset.zip file is decompressed 
# to obtain it because the data to work is contained in it
if("UCI HAR Dataset" %in% dir() == FALSE){
  unzip("getdata-projectfiles-UCI HAR Dataset.zip")  
}

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

# Create the vector with the necessary fields for the grouping
agrupacion <- c("subject", "activity")

# Averages for groups                 
result <- ddply(clean.data, agrupacion, numcolwise(mean))

# Write the result in a text file
write.table(result, "data_set_with_the_averages.txt", row.names = FALSE)
