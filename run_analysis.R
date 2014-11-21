## set the main path to the working directory
directory<-setwd("~/Documents/R Working Directory/Coursera/Scripts/GettingCleandingDataProject/UCI HAR Dataset/")

## Load the "test subjects" data set 
subjects<-read.table(paste(directory,"/test/subject_test.txt",sep=""))  
## Load the  data set containing the "test subjects" activities associated with their observations
yvalues<-read.table(paste(directory,"/test/y_test.txt",sep=""))
## Load the data set containing the "test subjects" measurements 
xvalues<-read.table(paste(directory,"/test/X_test.txt",sep=""))

## Load the activity labels file 
activities<-read.table(paste(directory,"/activity_labels.txt",sep=""))
## Mergeing the activity label with the related "test subjects" using the mapping id
activities_labeled<-merge(yvalues,activities,by="V1")
## Merging the fully labeled activities with their subjects
subject_activities<-data.frame(c(subjects,activities_labeled))

## This part of the clean up is used to identify  "only the measurements on the mean and standard deviation for each measurement."
## There are 561 rows in the features txt file. 
## There are 561 columns in the measurement filels e.g. X_test.txt
## The "rows" that are associated with the "column" numbers
features<-read.table("/Users/Bentley/Documents/R Working Directory/Coursera/Scripts/GettingCleandingDataProject/UCI HAR Dataset/features.txt") 
features<-read.table(paste(directory,"/features.txt",sep=""))
meanmeasures<-grep("mean",features$V2,fixed=TRUE) ## Getting the "mean" measures
meanmeasuresnames<-grep("mean",features$V2,value=TRUE) ## Getting the names of the "mean" measures selected
stdmeasures<-grep("std",features$V2,fixed=TRUE) ## Getting the "std"  measures
stdmeasuresnames<-grep("std",features$V2,value=TRUE) ## Getting the names of the "std"  measures selected
allcols<-c(meanmeasures,stdmeasures)  ## Combining  the two vectors into one vector
## Use the vector to select only the required variables/columns/measures from the "test subjects" observations
requiredmeasures<-xvalues[allcols]  
## assigning the correct names to the variables
colnames(requiredmeasures)<-(c(meanmeasuresnames,stdmeasuresnames)) 
## combining the feature/measures with their test subjects and activities
dfr_test_subjects_final<-data.frame(c(subject_activities,requiredmeasures))  
## aggregating and meaning the measurements across the test subjects and their respective activities
dfr_test_final<-aggregate(dfr_test_subjects_final[,4:82], by=list(subject=dfr_test_subjects_final$V1,activity=dfr_test_subjects_final$V2),  FUN=mean)

 
## Load the "train subjects" data set 
train_subjects<-read.table(paste(directory,"/train/subject_train.txt",sep=""))  
## Load the activities associated with the train observations
train_yvalues<-read.table(paste(directory,"/train/y_train.txt",sep=""))
train_activities_labeled<-merge(train_yvalues,activities,by="V1")
## Merging the activities with their train subjects
train_subject_activities<-data.frame(c(train_subjects,train_activities_labeled))
## This data set contains the measurements each of the 2947 observations made on the train subjects
train_xvalues<-read.table(paste(directory,"/train/X_train.txt",sep=""))
train_requiredmeasures<-train_xvalues[allcols]  ## Using the vector to select only the required variables/columns/measures
colnames(train_requiredmeasures)<-(c(meanmeasuresnames,stdmeasuresnames)) ## assigning the correct names to the variables
## combining the feature/measures with their test subjects and activities
dfr_train_subjects_final<-data.frame(c(train_subject_activities,train_requiredmeasures))  
## aggregating and meaning the measurements across the train subjects and their respective activities
dfr_train_final<-aggregate(dfr_train_subjects_final[,4:82], by=list(subject=dfr_train_subjects_final$V1,activity=dfr_train_subjects_final$V2),  FUN=mean)
 
## Now merge the test and train data sets
dfr_final<-rbind(dfr_test_final,dfr_train_final)  
 
##Write the final results to a table
write.table(dfr_final,"~/Documents/tidydataset.txt",sep=";",row.name=FALSE)
 


