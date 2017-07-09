#------------------------------------------------------------------------------
#   Getting and cleaning Data - Project
#     !!!!!  Remove commenting on data downloading
#------------------------------------------------------------------------------
library (plyr)
library (reshape2)

#--- Clear any stored data.
  rm(list = ls(all = TRUE))

#--- Download Samsung Galaxy S smartphone accelerometer dataset.
  if (!file.exists("./data")) {
    dir.create("./data")
  }
  # filnam = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  # download.file(filnam,destfile="./data/wearable.zip")
  # unzip("./data/wearable.zip")

#--- Read feature label dataset and convert feature labels into variable names.
  feature_name <- read.table ("./UCI HAR Dataset/features.txt")
  selected_features <- grep("mean\\()|std",feature_name$V2)            #-- Features with Mean or Std Dev measurements
  feature_name$V2 <- gsub("\\(","",feature_name$V2)  
  feature_name$V2 <- gsub(")","",feature_name$V2)  
  feature_name$V2 <- gsub("-","",feature_name$V2)
  feature_name$V2 <- gsub(",","",feature_name$V2)  
  feature_name$V2 <- tolower(feature_name$V2)    

#--- Read training dataset.
  subject_train <- read.table ("./UCI HAR Dataset/train/subject_train.txt")
  x_train <- read.table ("./UCI HAR Dataset/train/X_train.txt") 
  y_train <- read.table ("./UCI HAR Dataset/train/y_train.txt")

#--- Read test dataset.
  subject_test <- read.table ("./UCI HAR Dataset/test/subject_test.txt")
  x_test <- read.table ("./UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table ("./UCI HAR Dataset/test/y_test.txt")

#--- Build Combo Training + Test Dataset.
  subject <- rbind(subject_train, subject_test)
  x <- rbind(x_train, x_test)
  y <- rbind(y_train, y_test)
  names (subject) <- "subject"
  names (y) <- "activity"  
  names (x) <- feature_name$V2  

#--- Select only mean & std-deviation features.
  xselect <- x[,selected_features]
  dcombo <- cbind(subject, y, xselect)  
  
#--- Assign names to each activity type.
  activity_name <- read.table ("./UCI HAR Dataset/activity_labels.txt") 
  dcombo$activity <- factor(dcombo$activity,labels=activity_name$V2)
  
#-----------------------------------------------------------------------------------------------------
#   Build a Tidy Dataset with the average of each variable for each activity and each subject
#-----------------------------------------------------------------------------------------------------
  d <- melt(dcombo, id=c("subject","activity"))  
  dharsum <- ddply(d,c("subject","activity","variable"),summarize, mean=mean(value))
  write.csv(file="HARsummary.csv",dharsum, row.names=F)
  
# #--- Write out variable definitions for project writeup.  
#   feature <- feature_name$V2[selected_features]
#   b <- data.frame(feature)
#   b$qty <-NA
#   b$qty[grep('acc',b$feature)] <- 'Acceleration'
#   b$qty[grep('accjerk',b$feature)] <- 'Acceleration Jerk'
#   b$qty[grep('gyro',b$feature)] <- 'Angular Velocity'
#   b$qty[grep('gyrojerk',b$feature)] <- 'Angular Velocity Jerk'  
#   b$bodygrav <- NA
#   b$bodygrav[grep('body',b$feature)] <- 'Body Motion' 
#   b$bodygrav[grep('gravity',b$feature)] <- 'Gravity'
#   b$units <- NA
#   b$units [grep('acc',b$feature)] <- '(units=Gs)'
#   b$units [grep('accjerk',b$feature)] <- '(units=G/sec)'
#   b$units [grep('gyro',b$feature)] <- '(units=deg/sec)' 
#   b$units[grep('gyrojerk',b$feature)] <- '(units= deg/sec/sec)'    
#   b$axis <- NA
#   b$axis [grep('meanx|stdx',b$feature)] <- 'x-axis'
#   b$axis [grep('meany|stdy',b$feature)] <- 'y-axis'
#   b$axis [grep('meanz|stdz',b$feature)] <- 'z-axis'
#   b$axis [grep('magmean|magstd',b$feature)] <- 'resultant magnitude' 
#   b$domain <- NA
#   b$domain [grep('tbody',b$feature)] <- 'time domain'
#   b$domain [grep('tgravity',b$feature)] <- 'time domain'
#   b$domain [grep('fbody',b$feature)] <- 'frequency domain'
#   b$meanstd <- NA
#   b$meanstd [grep('mean',b$feature)] <- 'mean'
#   b$meanstd [grep('std',b$feature)] <- 'standard deviation'
# 
#   b$msg <- paste0("* ", b$feature, " -- ",b$bodygrav," ",b$qty,", ", b$axis, ", ", b$meanstd,', in the ',b$domain,',',  b$units)
#   write.csv(file="bongobongo.txt",b$msg, row.names=F, quote=F)
  
  