---
title: "README"
author: "Bentley"
date: "November 21, 2014"
output: html_document
---

## Step 1
Set the working directory

## Step x
Load the "test subjects" data set 

## Step x
Load the activities associated with their test observations

## Step x
Load the activity labels file 

## Step x
Add the activity description to the activity id of the observations by merging the two data sets on the common column

## Step x
Load the data set that contains the measurements 
Note: There is no subject id associated with the file - the assumption is that the data is in the same order as the other data sets

## Step x
This part of the clean up is used to identify  "only the measurements on the mean and standard deviation for each measurement."
Using the vector to select only the required variables/columns/measures
Assign the correct names to the variables

## Step x
Combine the feature/measures with their test subjects and activities

## Step x
Aggregate and mean the measurements across the test subjects and their respective activities

## Step x 
Load the "train subjects" data set  
Load the activities associated with the train subjects's observations
Join the train subjects and to their activities 
Load the train subjects observations 
Join "train subjects" with their feature/measures observations
Aggregate the means of the measurements across the "train subjects" and their respective activities

## Step x
Merge the "test subjects"" and "train subjects" data sets

## Step x
Write the final results to a table