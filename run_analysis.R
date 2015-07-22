#You should create one R script called run_analysis.R that does the following. 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy 
#   data set with the average of each variable for each activity and each subject.

# Data source:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

library(plyr)

dir.name<-"UCI HAR Dataset"

# Read files
X_test <-read.table(file.path(dir.name, "test", "X_test.txt"), header=FALSE) #Features
X_train<-read.table(file.path(dir.name, "train", "X_train.txt"), header=FALSE) #Features
S_test <-read.table(file.path(dir.name, "test", "subject_test.txt"), header=FALSE) # Subject
S_train<-read.table(file.path(dir.name, "train", "subject_train.txt"), header=FALSE) # Subject
Y_test <-read.table(file.path(dir.name, "test", "y_test.txt"), header=FALSE) # Activity
Y_train<-read.table(file.path(dir.name, "train", "y_train.txt"), header=FALSE) # Activity

ActivityLabels <-read.table(file.path(dir.name, "activity_labels.txt"),head=FALSE) # Read activity labels

######################################################################
# Step 1: Merge the training and the test sets to create one data set.
######################################################################

# Bind data
X <-rbind(X_test,X_train) # Bind Features
S <-rbind(S_test,S_train) # Bind Subject
Y <-rbind(Y_test,Y_train) # Bind Activity

# Set names to variables
names(S)<-c("Subject")
names(Y)<-c("Activity")
FeaturesNames <- read.table(file.path(dir.name, "features.txt"),head=FALSE)
names(X)<- FeaturesNames$V2

# Create new data set
dataset<-cbind(S,Y,X)

#########################################################################################################
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
#########################################################################################################

# Limits the features to those that include mean() or std()
mean_std <-X[,grep("(mean|std)\\(",names(X))]
dataset_mean_std <- cbind(S,Y,mean_std)

################################################################################
# Step 3: Uses descriptive activity names to name the activities in the data set.
################################################################################

# Update activity labels of the activities
Y$Activity <- ActivityLabels[match(Y$Activity, ActivityLabels$V1), "V2"]

################################################################################
# Step 4: Appropriately labels the data set with descriptive variable names. 
################################################################################

# where t -> Time, f ->Frequency, mean()->Mean, std()->StandardDev, BodyBody -> Body
# "-" in between words and some more cleaning to separate words with hyphens

names(mean_std)<-gsub("^t", "Time-", names(mean_std))
names(mean_std)<-gsub("^f", "Frequency-", names(mean_std))
names(mean_std)<-gsub("mean\\(\\)", "Mean", names(mean_std))
names(mean_std)<-gsub("std\\(\\)", "StandardDev", names(mean_std))
names(mean_std)<-gsub("BodyBody", "Body", names(mean_std))
names(mean_std)<-gsub("Body", "Body-", names(mean_std))
names(mean_std)<-gsub("Gravity", "Gravity-", names(mean_std))
names(mean_std)<-gsub("Mag-", "-Magnitude-", names(mean_std))
names(mean_std)<-gsub("Jerk-", "-Jerk-", names(mean_std))

################################################################################
# Step 5: From the data set in step 4, creates a second, independent tidy 
# data set with the average of each variable for each activity and each subject.
################################################################################

new_ds <- cbind(S,Y,mean_std)
tidy<-ddply(new_ds, c("Subject", "Activity"), numcolwise(mean))
write.table(tidy,file="tidy.txt", row.name=FALSE) #create txt-file with tidy data

