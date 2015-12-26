#Course Project
#Getting and Cleaning Data
#Irene Petlacalco Barrios
#24/12/2015

#The aim of the course is to learn how to get tidy data from raw data. We've got to follow a few steps to achieve our goal, I will describe them in the following lines.

#-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
#First we set the working directory. I've already downloaded the files into this working directory
setwd("C:/Users/dell inspiron/Documents/GCD")

#We load the activity labels (row labels)
A_L <- read.table("UCI HAR Dataset/activity_labels.txt")
A_L[,2] <- as.character(A_L[,2])

#We load the features labels (column labels)
F_L <- read.table("UCI HAR Dataset/features.txt")
F_L[,2] <- as.character(F_L[,2])

#For extracting the data corresponding to the mean and sd of the data
F_MSD <- grep(".*mean.*|.*std.*", F_L[,2])
F_N <- F_L[F_MSD,2]
F_N = gsub('-mean', 'Mean', F_N)
F_N = gsub('-std', 'Std', F_N)
F_N <- gsub('[-()]', '', F_N)

#We need the trains and test data, so we load the datasets
#In the next instruction we subset the data set called X_train.txt into the ones corresponding to the mean and sd
X_TN <- read.table("UCI HAR Dataset/train/X_train.txt")[F_MSD]
Y_TN <- read.table("UCI HAR Dataset/train/Y_train.txt")
SB_TN <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_TN <- cbind(SB_TN, Y_TN, X_TN)

#In the instruction below we subset the data set called X_test.txt into the ones corresponding to the mean and sd
X_TS <- read.table("UCI HAR Dataset/test/X_test.txt")[F_MSD]
Y_TS <- read.table("UCI HAR Dataset/test/Y_test.txt")
SB_TS<- read.table("UCI HAR Dataset/test/subject_test.txt")
X_TS <- cbind(SB_TS, Y_TS, X_TS)

#Here we merge the data set containing data from the data sets above in order to have one table with all the information
DataSet <- rbind(X_TN, X_TS)

#We put the right names to the columns
colnames(DataSet) <- c("subject", "activity", F_N)

# turn activities & subjects into factors
DataSet$activity <- factor(DataSet$activity, levels = A_L[,1], labels = A_L[,2])
DataSet$subject <- as.factor(DataSet$subject)

#We load the library reshape2 in order to use the functions melt and dcast
library(reshape2)

#We use the functions melt and dcast 
DataSet_MT<- melt(DataSet, id = c("subject", "activity"))
DataSet_M <- dcast(DataSet_MT, subject + activity ~ variable, mean)

#Finally we save the tidy dataset with the name "tidy_dataset.txt"
write.table(DataSet_M, "tidy_dataset.txt", row.names = FALSE, quote = FALSE)
