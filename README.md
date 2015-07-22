# Getting and Cleaning Data Course Project

## Introduction
This repository contains the content of the project of "Getting and cleaning data" part of the Data Science specialization (Johns Hopkins on Coursera Platform)

## Files on repo
The following files can be found on this repository:   
1. `run_analysis.R` -> Only script of the project. It transforms the original data set on a new tidy data set  
2. `CodeBook.md` ->  code book that describes the variables, the data, and transformations performed to clean up the data  
3. `Tidy.txt` -> file that includes a new tidy data set  

## Raw data
Data comes from the following source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Instructions
Follow the following steps to get the tidy data:  

1. Download and unzip raw data on folder `UCI HAR Dataset`. Folder must be placed on your Working Directory:
2. Place run_analysis.R script on your Working Directory.  
3. Call script on R Studio:
```{r}
source("run_analysis.R")
```
As a result the script will create a new file `tidy.txt` on your Working Directory that includes the tidy data (dimension 180x68).