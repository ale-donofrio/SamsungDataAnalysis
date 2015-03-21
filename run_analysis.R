#Common data

fileUrl <- "./UCI HAR Dataset/features.txt"
features <- read.table(fileUrl, sep = " ", col.names = c("id", "feature"))

fileUrl <- "./UCI HAR Dataset/activity_labels.txt"
activity_labels <- read.table(fileUrl, sep = " ", col.names = c("id", "activity"))

ncomp <- 128

#Training data

fileUrl <- "./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt"
body_acc_x_train <- read.table(fileUrl, col.names = paste(rep("body_acc_x_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt"
body_acc_y_train <- read.table(fileUrl, col.names = paste(rep("body_acc_y_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt"
body_acc_z_train <- read.table(fileUrl, col.names = paste(rep("body_acc_z_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"
body_gyro_x_train <- read.table(fileUrl, col.names = paste(rep("body_gyro_x_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"
body_gyro_y_train <- read.table(fileUrl, col.names = paste(rep("body_gyro_y_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"
body_gyro_z_train <- read.table(fileUrl, col.names = paste(rep("body_gyro_z_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"
total_acc_x_train <- read.table(fileUrl, col.names = paste(rep("total_acc_x_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt"
total_acc_y_train <- read.table(fileUrl, col.names = paste(rep("total_acc_y_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt"
total_acc_z_train <- read.table(fileUrl, col.names = paste(rep("total_acc_z_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/train/X_train.txt"
trainingSet <- read.table(fileUrl, col.names = features$feature)

fileUrl <- "./UCI HAR Dataset/train/y_train.txt"
trainingLabels <- read.table(fileUrl, col.names = "id_activity")

##Adding columns

trainingSet <- cbind(trainingSet, total_acc_x_train, total_acc_y_train, total_acc_z_train)
trainingSet <- cbind(trainingSet, body_acc_x_train, body_acc_y_train, body_acc_z_train)
trainingSet <- cbind(trainingSet, body_gyro_x_train, body_gyro_y_train, body_gyro_z_train)

activities <- merge(trainingLabels, activity_labels, by.x = "id_activity", by.y = "id", all = "TRUE")

trainingSet$activity <- activities$activity

fileUrl <- "./UCI HAR Dataset/train/subject_train.txt"
subject_train <- read.table(fileUrl, col.names = "id_subject")

trainingSet$id_subject <- subject_train$id_subject


#Test data

fileUrl <- "./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"
body_acc_x_test <- read.table(fileUrl, col.names = paste(rep("body_acc_x_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"
body_acc_y_test <- read.table(fileUrl, col.names = paste(rep("body_acc_y_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"
body_acc_z_test <- read.table(fileUrl, col.names = paste(rep("body_acc_z_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt"
body_gyro_x_test <- read.table(fileUrl, col.names = paste(rep("body_gyro_x_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt"
body_gyro_y_test <- read.table(fileUrl, col.names = paste(rep("body_gyro_y_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"
body_gyro_z_test <- read.table(fileUrl, col.names = paste(rep("body_gyro_z_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt"
total_acc_x_test <- read.table(fileUrl, col.names = paste(rep("total_acc_x_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt"
total_acc_y_test <- read.table(fileUrl, col.names = paste(rep("total_acc_y_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt"
total_acc_z_test <- read.table(fileUrl, col.names = paste(rep("total_acc_z_", ncomp), (1:ncomp), sep = ""))

fileUrl <- "./UCI HAR Dataset/test/X_test.txt"
testSet <- read.table(fileUrl, col.names = features$feature)

fileUrl <- "./UCI HAR Dataset/test/y_test.txt"
testLabels <- read.table(fileUrl, col.names = "id_activity")

##Adding columns

testSet <- cbind(testSet, total_acc_x_test, total_acc_y_test, total_acc_z_test)
testSet <- cbind(testSet, body_acc_x_test, body_acc_y_test, body_acc_z_test)
testSet <- cbind(testSet, body_gyro_x_test, body_gyro_y_test, body_gyro_z_test)

activities <- merge(testLabels, activity_labels, by.x = "id_activity", by.y = "id", all = "TRUE")

testSet$activity <- activities$activity

fileUrl <- "./UCI HAR Dataset/test/subject_test.txt"
subject_test <- read.table(fileUrl, col.names = "id_subject")

testSet$id_subject <- subject_test$id_subject

data <- rbind(trainingSet, testSet)

colNames <- names(data)[1:561]
meanData <- aggregate(data[colNames], by = data[c("id_subject", "activity")], FUN = mean)

meanData <- arrange(meanData, id_subject, activity)

write.table(meanData, file = "meanData.txt", row.name = FALSE)
