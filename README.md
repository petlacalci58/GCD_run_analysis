# GCD_run_analysis
Here is the code used to clean data from Samsung 5 data.

#If you want to recreate what I've done you've got to follow this steps:

#1) Download the zip file from this URL:
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#2) Save it in your working directory
#3) Change your working directory in R with the following instruction:
#setwd("Address of your working directory")
#4) Copy the R code from the file in this repository called run_analysis.R and ommit the part where I set the working directory in my computer.
  #What the code above does:
  -Loads the the activity and features labels
  -Extracts the data corresponding to the mean and sd of the data
  -Loads the train and test data
  -Merges the above datasets into one dataset
  -Puts the right name to the columns
  -Write the tidy dataset into a .txt file
#5) You'll have the file tidy_dataset.txt in your working directory by the time R finishes processing the code.


